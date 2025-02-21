# OUCRU R training course 2025
The GitHub repository for the OUCRU R training course in 2025

Materials for the course in their quarto format are stored here

## For learners

The course main webpage is here: https://oucru-modelling.github.io/R-training-2025/

## For instructors

- Make sure you are using `renv` for R package version control
- Test **locally** with `quarto render`
    - Resulting main page is `_render/index.html`
- **Publish** by:
    - simply push your commits to the `main` branch, GitHub Actions should handle the rendering and publishing (desired)
    - `quarto publish gh-pages` (undesired)