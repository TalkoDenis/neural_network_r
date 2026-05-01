.PHONY train test lint format

train:
	Rscript main.R

test:
	Rscript -e "testthat::test_dir('tests')"

lint:
	Rscript -e "lintr::lint_dir('src')"

format:
	Rscript -e "styler::style_dir('src')"
