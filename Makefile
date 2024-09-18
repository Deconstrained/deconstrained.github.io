%: index.html

index.html: resume.xml resume.dtd xsl/modern-major-generalist.xsl css/GenericTech.css
	xsltproc --novalid resume.xml -o index.html

css/GenericTech.css: scss/GenericTech.scss
	./scsscompile.sh
