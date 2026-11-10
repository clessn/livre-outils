-- Retire du PDF les titres marqués .web-seulement.
--
-- La page de bienvenue (index.qmd) n'existe que sur le site. Son contenu est
-- déjà réservé au web, mais Quarto en garderait le titre dans le PDF, ce qui
-- créerait une page « Bienvenue » vide avant le prélude. Ce filtre l'enlève.

if quarto.doc.is_format("html") then
  return {}
end

return {
  {
    Header = function(h)
      if h.classes:includes("web-seulement") then return {} end
    end
  }
}
