#Fichero: Makefile
#Compilar con:
# $make
DOC=book

XMLMAIN=main.xml
XMLFILE=book.xml
PDFFILE=$(DOC).pdf
FOPFILE=$(DOC).fo
HTMLFILE=$(DOC).html

FOXSL=/usr/share/xml/docbook/stylesheet/docbook-xsl-ns/fo/docbook.xsl
HTMLXSL=/usr/share/xml/docbook/stylesheet/docbook-xsl-ns/xhtml-1_1/docbook.xsl

main:
	make clean
	make pdf
        
second:
	@echo "\n=== Creating book.xml with all xml files\n"
	xmllint --xinclude --output $(XMLFILE) $(XMLMAIN)
	@echo "\n=== Done\n"

# Build the docs in PDF format
pdf: second
	@echo "\n=== Creating PDF\n"
	xsltproc -o $(FOPFILE) $(FOXSL) $(XMLFILE)
	fop -fo $(FOPFILE) -pdf $(PDFFILE)
	@echo "\n===Done.\n"

html: second
	xsltproc -o $(HTMLFILE) $(HTMLXSL) $(XMLFILE)

check:
	@echo -e "\n=== Checking correctness of $(XMLFILE)\n"
	@xmllint --valid --noout --postvalid $(XMLFILE)
	@echo -e "Done.\n"

clean: 
	rm -f $(FOPFILE)
	rm -f $(XMLFILE)
	rm -f $(PDFFILE)
	rm -f $(HTMLFILE)

install:
	@echo "\n=== Installing development tools\n"
	apt-get install xsltproc fop docbook-xsl-ns docbook5-xml
	@echo "\n===Done.\n"
        
