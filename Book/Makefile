new2:
	pdflatex --draft dsweetspot.tex
	biber dsweetspot
	pdflatex dsweetspot.tex
	pdflatex dsweetspot.tex

new:
	pdflatex dsweetspot.tex
	bibtex dsweetspot
	authorindex dsweetspot
	makeglossaries dsweetspot
	pdflatex dsweetspot.tex
	authorindex dsweetspot
	pdflatex dsweetspot.tex
	pdflatex dsweetspot.tex

all:
	scons

clean:
	find . -name \*.acn -exec rm {} \;
	find . -name \*.acr -exec rm {} \;
	find . -name \*.alg -exec rm {} \;
	find . -name \*.aux -exec rm {} \;
	find . -name \*.bbl -exec rm {} \;
	find . -name \*.blg -exec rm {} \;
	find . -name \*.dvi -exec rm {} \;
	find . -name \*.fls -exec rm {} \;
	find . -name \*.glg -exec rm {} \;
	find . -name \*.glo -exec rm {} \;
	find . -name \*.idx -exec rm {} \;
	find . -name \*.ilg -exec rm {} \;
	find . -name \*.ind -exec rm {} \;
	find . -name \*.ist -exec rm {} \;
	find . -name \*.lof -exec rm {} \;
	find . -name \*.log -exec rm {} \;
	find . -name \*.lol -exec rm {} \;
	find . -name \*.lot -exec rm {} \;
	find . -name \*.nlo -exec rm {} \;
	find . -name \*.nls -exec rm {} \;
	find . -name \*.out -exec rm {} \;
	find . -name \*.toc -exec rm {} \;
	find . -name \*.xdy -exec rm {} \;
	find . -name \*.xml -exec rm {} \;
	find . -name \*.ain -exec rm {} \;
	- rm dsweetspot.gls;
	find . -name \*~ -exec rm {} \;
	find . -name dsweetspot.pdf -exec rm {} \;
