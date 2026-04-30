# lcf_for_visual_fixations
An R pipeline to analyze eye-tracking spatial dispersion using the Local Correlation Function (LCF), Nearest Neighbor, and Clark-Evans index.
## Installation

You can install this package directly from GitHub using `devtools`:

```R
# Install devtools if you haven't already
install.packages("devtools")

# Install the package
devtools::install_github("robertojimenez-castillo/lcf_for_visual_fixations")

Usage

library(lcfforvisualfixations)

# Run the pipeline
resultados <- spatial_eye_analysis(my_eye_tracking_data, res_x = 1280, res_y = 720)
print(resultados)

Markdown

## Credits & References

This pipeline acts as a wrapper and is entirely built upon the foundational mathematical frameworks of the following packages. If you use this tool in your research, please ensure you properly cite the original authors:

* **spatstat (Spatial Point Pattern analysis):** 
  Baddeley, A., Rubak, E., & Turner, R. (2015). *Spatial Point Patterns: Methodology and Applications with R*. London: Chapman and Hall/CRC. [https://spatstat.org/](https://spatstat.org/)

* **lcfstat (Local Correlation Function):** 
  Martynova, E. `lcfstat`: *Local Correlation Function for spatial point patterns in R*. GitHub repository: [EvgeniyaMartynova/lcfstat](https://github.com/EvgeniyaMartynova/lcfstat)
