.PHONY: pdf week06 week09 clean

pdf: week06 week09

week06:
	cd slides/week-06-pendekatan-numerik-pdp-orde-1 && latexmk -pdf -interaction=nonstopmode -halt-on-error week-06-pendekatan-numerik-pdp-orde-1.tex

week09:
	cd slides/week-09-persamaan-gelombang && latexmk -pdf -interaction=nonstopmode -halt-on-error week-09-persamaan-gelombang.tex

clean:
	cd slides/week-06-pendekatan-numerik-pdp-orde-1 && latexmk -C || true
	cd slides/week-09-persamaan-gelombang && latexmk -C || true
