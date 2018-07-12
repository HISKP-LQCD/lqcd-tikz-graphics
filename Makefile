tex := $(wildcard *.tex)
pdf := $(tex:.tex=.pdf)
png := $(tex:.tex=.png)

all: $(pdf) $(png)

%.pdf: %.tex
	lualatex --halt-on-error $^
	mv $@ temp-$@
	pdfcrop temp-$@ $@

%.png: %.pdf
	pdftocairo -png -r 200 -singlefile $^ $$(basename $@ .png)
