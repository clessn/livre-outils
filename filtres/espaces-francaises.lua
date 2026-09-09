--[[
  Espaces insécables de la typographie française.

  Règle suivie (Lexique des règles typographiques en usage à l'Imprimerie nationale) :
    · espace fine insécable (U+202F) devant  ?  !  ;
    · espace insécable      (U+00A0) devant  :
    · espace insécable à l'intérieur des guillemets français «  »

  Le filtre ne fait que remplacer des espaces existantes. Il n'en ajoute jamais là
  où l'auteur n'en a pas mis, pour ne pas toucher aux URL, aux noms de fichiers ni
  au code. Le contenu des blocs de code et du code en ligne n'est jamais parcouru.
--]]

local FINE  = "\u{202F}"
local INSEC = "\u{00A0}"

local function espace_avant(c)
  if c == ":" then return INSEC end
  if c == "?" or c == "!" or c == ";" then return FINE end
  return nil
end

-- Normalise les espaces insécables déjà présentes dans le texte source
-- (écrites &nbsp; ou saisies au clavier) vers la bonne largeur.
function Str(el)
  local t = el.text
  t = t:gsub(INSEC .. "([%?!;])", FINE .. "%1")
  t = t:gsub(FINE .. ":", INSEC .. ":")
  if t ~= el.text then return pandoc.Str(t) end
end

function Inlines(inlines)
  local sortie = pandoc.List()
  local i = 1
  while i <= #inlines do
    local el, suiv = inlines[i], inlines[i + 1]
    local traite = false

    if (el.t == "Space" or el.t == "SoftBreak") and suiv and suiv.t == "Str" then
      local esp = espace_avant(suiv.text:sub(1, 1))   -- ? ! ; : tiennent sur un octet
      if esp then
        sortie:insert(pandoc.Str(esp))
        i = i + 1
        traite = true
      elseif suiv.text:match("^»") then                -- « et » tiennent sur deux octets
        sortie:insert(pandoc.Str(INSEC))
        i = i + 1
        traite = true
      end
    end

    if not traite and el.t == "Str" and el.text:match("«$")
       and suiv and (suiv.t == "Space" or suiv.t == "SoftBreak") then
      sortie:insert(el)
      sortie:insert(pandoc.Str(INSEC))
      i = i + 2
      traite = true
    end

    if not traite then
      sortie:insert(el)
      i = i + 1
    end
  end
  return sortie
end
