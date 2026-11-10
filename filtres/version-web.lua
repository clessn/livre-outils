-- Version web : remplacer ce qui est écrit en LaTeX pur.
--
-- Plusieurs passages du livre utilisent des commandes LaTeX directement
-- (le logo \LaTeX{}, les noms des auteurs centrés sous le titre, une citation
-- en retrait, un mot en couleur). Le PDF les comprend, mais une page web les
-- ignore : le mot ou le bloc disparaît et laisse un trou dans la phrase.
-- Ce filtre leur donne un équivalent HTML. Il ne fait rien pour le PDF.

if not quarto.doc.is_format("html") then
  return {}
end

local function est_tex(el)
  return el.format == "tex" or el.format == "latex"
end

-- \LaTeX{}, \TeX{}, \textcolor{red}{mot}, \path{...} dans le fil du texte
local function en_ligne(el)
  if not est_tex(el) then return nil end
  local t = el.text
  if t:match("^\\LaTeX") then return pandoc.Str("LaTeX") end
  if t:match("^\\TeX") then return pandoc.Str("TeX") end
  local couleur, mot = t:match("^\\textcolor{(%a+)}{(.-)}$")
  if couleur then
    return pandoc.Span({ pandoc.Str(mot) }, pandoc.Attr("", {}, { style = "color: " .. couleur .. ";" }))
  end
  local chemin = t:match("^\\path{(.-)}$")
  if chemin then return pandoc.Code(chemin) end
  if t:match("^\\pagesdenotes") then return {} end
  return nil
end

-- Le nom du langage R est écrit $\textsf{R}$, une formule mathématique.
-- Sur le web, elle ne s'affiche qu'une fois un script externe chargé, et le
-- moteur de recherche du site ne la voit pas. On écrit donc la lettre en clair.
local function lettre_r(el)
  if el.text:match("^%s*\\textsf{R}%s*$") then
    return pandoc.Span({ pandoc.Str("R") }, pandoc.Attr("", { "langage-r" }))
  end
  return nil
end

-- Noms des auteurs : \begin{center}\textit{A (Univ), \\ B (Univ)}\end{center}
local function auteurs(t)
  local dedans = t:match("\\begin{center}%s*\\textit{(.-)}%s*\\end{center}")
  if not dedans then return nil end
  -- Sur la page d'accueil, les trois noms figurent déjà dans le bloc de titre.
  if (quarto.doc.input_file or ""):match("index%.qmd$") then return {} end
  local lignes = {}
  for morceau in (dedans .. "\\\\"):gmatch("(.-)\\\\") do
    local nom = morceau:gsub("^%s+", ""):gsub("[%s,]+$", "")
    if nom ~= "" then
      if #lignes > 0 then table.insert(lignes, pandoc.LineBreak()) end
      table.insert(lignes, pandoc.Str(nom))
    end
  end
  if #lignes == 0 then return nil end
  return pandoc.Div({ pandoc.Para({ pandoc.Emph(lignes) }) }, pandoc.Attr("", { "auteurs-chapitre" }))
end

-- Citation en retrait : \begin{displayquote} ... \end{displayquote}
local function citation(t)
  local dedans = t:match("\\begin{displayquote}(.-)\\end{displayquote}")
  if not dedans then return nil end
  dedans = dedans:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
  return pandoc.BlockQuote(pandoc.read(dedans, "markdown").blocks)
end

local function en_bloc(el)
  if not est_tex(el) then return nil end
  local t = el.text
  if t:match("^%s*\\pagesdenotes") then return {} end
  return auteurs(t) or citation(t)
end

return { { RawInline = en_ligne, RawBlock = en_bloc, Math = lettre_r } }
