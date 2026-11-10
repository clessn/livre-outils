-- Tableaux du PDF : un filet fin entre chaque rangée.
--
-- gt ne sait pas tracer de filets entre les rangées en LaTeX : il ne produit
-- que les trois filets de booktabs (haut, sous l'en-tête, bas). Quand des
-- cellules tiennent sur plusieurs lignes, on ne voit plus où finit une rangée.
-- Ce filtre ajoute un filet fin après chaque rangée du corps du tableau, sauf
-- la dernière, qui est déjà suivie du filet du bas.
--
-- Il ne touche que la sortie LaTeX ; la version web garde le style de gt.

local FILET = "\\midrule[0.2pt]\\addlinespace[2.5pt]\n"

local function ajouter_filets(s)
  local debut_haut = s:find("\\toprule", 1, true)
  if not debut_haut then return nil end
  -- fin de la ligne qui porte le filet sous l'en-tête
  local _, fin_entete = s:find("\\midrule[^\n]*\n", debut_haut)
  local debut_bas = s:find("\\bottomrule", fin_entete or 1, true)
  if not fin_entete or not debut_bas then return nil end

  local avant = s:sub(1, fin_entete)
  local corps = s:sub(fin_entete + 1, debut_bas - 1)
  local apres = s:sub(debut_bas)

  local n
  corps, n = corps:gsub("(\\\\[ \t]*\n)", function(fin) return fin .. FILET end)
  if n < 2 then return nil end
  -- retirer le filet ajouté après la dernière rangée
  corps = corps:sub(1, #corps - #FILET)
  return avant .. corps .. apres
end

local function traiter(el)
  if el.format ~= "latex" and el.format ~= "tex" then return nil end
  local nouveau = ajouter_filets(el.text)
  if nouveau then
    el.text = nouveau
    return el
  end
  return nil
end

return { { RawBlock = traiter, RawInline = traiter } }
