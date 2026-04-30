#' Análisis Espacial de Patrones de Puntos para Eye-Tracking
#' @export
spatial_eye_analysis <- function(datos_tidy, res_x = 1280, res_y = 720) {
  
  # Preparación y conversión a píxeles
  datos_tidy$X <- round(datos_tidy$X_Prop * res_x)
  datos_tidy$Y <- round((1 - datos_tidy$Y_Prop) * res_y)
  
  window <- spatstat.geom::owin(c(0, res_x), c(0, res_y))
  categorias <- unique(datos_tidy$Categoria)
  resultados_finales <- data.frame()
  
  cat("Iniciando análisis espacial...\n")
  
  for (cat_actual in categorias) {
    datos_cat <- subset(datos_tidy, Categoria == cat_actual)
    datos_cat <- subset(datos_cat, X >= 0 & X <= res_x & Y >= 0 & Y <= res_y)
    
    pp <- spatstat.geom::unique.ppp(spatstat.geom::ppp(datos_cat$X, datos_cat$Y, window = window))
    
    if (pp$n > 2) {
      nn_media <- mean(spatstat.geom::nndist(pp))
      ce_index <- spatstat.explore::clarkevans(pp)[1]
      
      lcf_env <- spatstat.explore::envelope(pp, lcfstat::LCFest, nsim = 99, global = FALSE, verbose = FALSE)
      max_lcf <- max(lcf_env$obs)
      r_max <- lcf_env$r[which.max(lcf_env$obs)]
      
      resultados_finales <- rbind(resultados_finales, data.frame(
        Categoria = cat_actual,
        N_Fijaciones = pp$n,
        Max_LCF = round(max_lcf, 3),
        Distancia_R_Max = round(r_max, 1),
        NN_Media_px = round(nn_media, 2),
        Clark_Evans = round(ce_index, 3)
      ))
    }
  }
  return(resultados_finales)
}
