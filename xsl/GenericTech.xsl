<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/resume">
<html>
<head>
<title><xsl:value-of select="personal/identity/fullname" /></title>
<link rel="stylesheet" href="css/GenericTech.css" type="text/css" />
</head>
<body>

<xsl:for-each select="personal">
    <xsl:for-each select="identity">
        <h1><xsl:value-of select="fullname" /></h1>
<p>XLST Resum&#233; stylesheet under construction.<br />

In the mean time, you can see all of what I've put into this
</b>
        

        <div id="contact">
            <ul class="cloud">
                <xsl:for-each select="contact/*">
                    <li>
                        <xsl:if test="name() = 'phone'">
                            &#9743;&#160;<a href="tel:{.}" title="phone"><xsl:value-of select="." /></a>
                        </xsl:if><!-- </phone> -->
                        <xsl:if test="name() = 'email'">
                            &#9993;&#160;<a href="mailto:{.}" title="email"><xsl:value-of select="." /></a>
                        </xsl:if><!-- </email> -->
                        <xsl:if test="name() = 'website'">
                            &#9875;&#160;<a href="{./@href}" title="website"><xsl:value-of select="." /></a> 
                        </xsl:if>
                        <xsl:if test="./@type != ''">
                            &#160;(<xsl:value-of select="./@type" />)
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ul><!-- .cloud -->
        </div><!-- #contact -->

        <div id="socialmedia">
            <ul class="plain">
                <xsl:for-each select="socialmedia/link">
                    
                </xsl:for-each><!-- </link> -->
            </ul>
        </div><!-- #socialmedia -->

    </xsl:for-each><!-- </identity> -->
</xsl:for-each><!-- </personal> -->

</body>
</html>
</xsl:template>
</xsl:stylesheet>
