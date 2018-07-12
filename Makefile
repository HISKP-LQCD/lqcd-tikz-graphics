tex := $(wildcard *.tex)
pdf := $(tex:.tex=.pdf)
crop := $(tex:.tex=-crop.pdf)
png := $(tex:.tex=.png)

all: $(pdf) $(crop) $(png)

%.pdf: %.tex
	lualatex --halt-on-error $^

%-crop.pdf: %.pdf
	pdfcrop $^

%.png: %-crop.pdf
	pdftocairo -png -r 200 -singlefile $^ $$(basename $@ .png)
