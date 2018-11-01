# Render site

# Processar arquivo Rmd e gerar saída em HTML
rmarkdown::render('code/search.Rmd', encoding = 'UTF-8', output_dir = 'docs/')

# Editar arquivo HTML
con <- 'docs/search.html'
file <- readLines(con = con)
for (i in seq(length(file))) {
  
  # Ajustar largura da tabela à largura da tela.
  file[i] <- gsub(pattern = 'max-width: 940px;', replacement = 'max-width: 100%;', x = file[i], fixed = TRUE)
  
  # Configuração do idioma do filtro das colunas.
  file[i] <- 
    gsub(pattern = 'placeholder=\\"All\\"', replacement = 'placeholder=\\"Todos\\"', x = file[i], fixed = TRUE)
}
writeLines(text = file, con = con)

# Open server portal
browseURL("http://www.suporte.cpd.ufsm.br/newftp/")
