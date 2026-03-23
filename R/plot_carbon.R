if(!require("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2", repos = "http://cran.us.r-project.org")
}
library(ggplot2)
library(readr)
library(dplyr)

plot_summary <- tryCatch(read_csv("outputs/plot_summary.csv", show_col_types = FALSE), error = function(e) NULL)

if (!is.null(plot_summary) && nrow(plot_summary) > 0) {
  # Filtra NAs
  plot_summary <- plot_summary %>% filter(!is.na(C_AGB_Mg_ha))
  
  if(nrow(plot_summary) > 0) {
    p <- ggplot(plot_summary, aes(x = plot_id, y = C_AGB_Mg_ha, fill = plot_id)) +
      geom_col(color = "black", alpha = 0.8) +
      theme_minimal(base_size = 14) +
      labs(
        title = "Estoque de Carbono Arbóreo (Acima do Solo)",
        subtitle = "Sítio de Tracuateua",
        x = "Identificação da Parcela",
        y = "Carbono (Mg C ha⁻¹)"
      ) +
      theme(
        legend.position = "none",
        panel.grid.major.x = element_blank(),
        plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5, color = "gray40")
      ) +
      scale_fill_brewer(palette = "Set2")
      
    ggsave("outputs/grafico_carbono_parcelas.png", plot = p, width = 8, height = 5, dpi = 300)
    message("✔ Gráfico de colunas salvo como 'outputs/grafico_carbono_parcelas.png'.")
  } else {
    message("Não há dados válidos de carbono arbóreo.")
  }
} else {
  message("Arquivo plot_summary.csv não encontrado ou vazio.")
}
