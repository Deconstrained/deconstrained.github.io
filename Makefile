%: index.html

index.html: resume.xml resume.dtd xsl/modern-major-generalist.xsl
	xsltproc --novalid resume.xml -o index.html
    
