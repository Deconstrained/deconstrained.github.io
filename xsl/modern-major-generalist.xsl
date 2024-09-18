<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />

<xsl:template match="/resume">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8" />
<title><xsl:value-of select="personal/identity/fullname" /></title>
<link rel="stylesheet" href="css/GenericTech.css" type="text/css" />
</head>
<body>

<div id="personal">
    <h1><xsl:value-of select="personal/identity/fullname" /></h1>
    <img id="portrait" alt="Portrait (2015)" src="https://secure.gravatar.com/avatar/6eff1207b5f18b025c07856ec697e67c?size=100" />

    <div id="contact">
        <ul class="plaincloud">
            <xsl:for-each select="personal/identity/contact/*">
                <li><span class="glyph fa fa-{name(.)}" aria-hidden="true"></span>
                <xsl:choose>
                    <xsl:when test="name() = 'email'"><a href="mailto:{.}" title="email"><xsl:value-of select="." /></a></xsl:when>
                    <xsl:when test="name() = 'phone'"><a href="tel:{.}" title="{./@type}"><xsl:value-of select="." /></a></xsl:when>
                    <xsl:otherwise><a href="{./@href}"><xsl:value-of select="." /></a></xsl:otherwise>
                </xsl:choose>
                </li>
            </xsl:for-each>
        </ul><!-- .cloud -->
    </div><!-- #contact -->

</div><!-- #personal -->

<h2>Qualifications</h2>
<ul id="strengths" class="bulletcloud">
    <xsl:for-each select="personal/strengths/point">
        <li><xsl:value-of select="." /></li>
    </xsl:for-each>
</ul><!-- #strengths -->

<h2>Expertise</h2>
<ul id="expertise" class="bulletcloud">
    <xsl:for-each select="expertise/area">
        <li><xsl:value-of select="." /></li>
    </xsl:for-each>
</ul><!-- #expertise -->

<h2>Experience</h2>
<xsl:for-each select="experience/position">
    <h3>
        <xsl:for-each select="title">
            <xsl:choose>
                <xsl:when test="position() > 1">
                    &#160;/&#160;
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="." />
            <xsl:value-of select="./@pos" />
        </xsl:for-each><!-- </title> -->
        <xsl:variable name="org">
            <xsl:text>
            </xsl:text>
            <xsl:choose>
                <xsl:when test="./@href">
                    <a href="{./@href}"><xsl:value-of select="./@org" /></a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="./@org" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        &#160;<xsl:value-of select="./@pos" />&#160;<xsl:copy-of select="$org" />
    </h3>
    <span class="at-org-during">From <xsl:value-of select="dates/@start" /> to <xsl:value-of select="dates/@end" /></span>
    <br />
    <xsl:if test="duty">
        <em>Duties:</em> 
        <ul class="breakdown">
            <xsl:for-each select="duty">
                <li><xsl:value-of select="." /></li>
            </xsl:for-each>
        </ul>
    </xsl:if>
    <xsl:if test="accomplishment">
        <em>Accomplishments:</em>
        <ul class="breakdown">
            <xsl:for-each select="accomplishment">
                <li><xsl:value-of select="." /></li>
            </xsl:for-each>
        </ul>
    </xsl:if>
</xsl:for-each><!-- </experience> -->

<h2>Skills</h2>
<xsl:for-each select="skills/skillset">
    <h3><xsl:value-of select="./@type" /></h3>
    <ul class="bulletcloud">
        <xsl:for-each select="skill">
            <li><xsl:value-of select="." /></li>
        </xsl:for-each><!-- </skillset> -->
    </ul>
</xsl:for-each><!-- </skills> -->

<!-- TODO: Make a section for GitHub projects -->

<h2>Education</h2>

<table class="basic" id="education">
    <thead>
        <tr>
            <th>Degree</th>
            <th>Major</th>
            <th>Institution</th>
            <th>Year</th>
        </tr>
    </thead>
    <tbody>
        <xsl:for-each select="education/degree">
            <tr>
                <td><xsl:value-of select="./@title" /></td>
                <td><xsl:value-of select="./@major" /></td>
                <td><xsl:value-of select="./@institution" /></td>
                <td><xsl:value-of select="./@year" /></td>
            </tr>
        </xsl:for-each><!-- </education> -->
    </tbody>
</table><!-- #education -->

<!--
<h2>Hobbies</h2>
<ul>
<xsl:for-each select="hobbies/hobby">
    <li><xsl:copy-of select="." /></li>
</xsl:for-each>
</ul>
-->

</body>
</html>
</xsl:template>
</xsl:stylesheet>
