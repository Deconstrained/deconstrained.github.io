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
    <div id="contact">
        <ul class="plaincloud">
            <xsl:for-each select="personal/identity/contact/*">
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
            <xsl:for-each select="personal/identity/socialmedia/link">
            <li><xsl:value-of select="./@site" />: <a href="{./@href}"><xsl:value-of select="." /></a></li>
            </xsl:for-each><!-- </link> -->
        </ul>
    </div><!-- #socialmedia -->

</div><!-- #personal -->

<h2>Qualifications</h2>
<ul id="strengths">
    <xsl:for-each select="personal/strengths/point">
        <li><xsl:value-of select="." /></li>
    </xsl:for-each>
</ul><!-- #strengths -->


<h2>Expertise</h2>
<ul id="expertise">
    <xsl:for-each select="expertise/area">
        <li><xsl:value-of select="." /></li>
    </xsl:for-each>
</ul>

<h2>Skills</h2>
<xsl:for-each select="skills/skillset">
    <h3><xsl:value-of select="./@type" /></h3>
    <ul class="bulletcloud">
        <xsl:for-each select="skill">
            <li><xsl:value-of select="." /></li>
        </xsl:for-each><!-- </skillset> -->
    </ul>
</xsl:for-each><!-- </skills> -->

<h2>Certifications</h2>
<table class="basic" id="certifications">
    <thead>
        <tr>
            <th>Agency</th>
            <th>Title</th>
            <th>Date</th>
        </tr>
    </thead>
    <tbody>
    <xsl:for-each select="certifications/certification">
        <tr>
            <td><xsl:value-of select="./@agency" /></td>
            <td><xsl:value-of select="./@title" /></td>
            <td><xsl:value-of select="./@date" /></td>
        </tr>
    </xsl:for-each><!-- </certifications> -->
    </tbody>
</table><!-- #certifications -->

<div id="certlogos">
    <xsl:for-each select="certifications/certlogo">
        <xsl:copy-of select="." />
    </xsl:for-each><!-- </certlogo> -->
</div>

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
        </xsl:for-each><!-- </title> -->
    </h3> 
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
    <em><xsl:value-of select="./@pos" />&#160;<xsl:copy-of select="$org" />,</em> From <xsl:value-of select="dates/@start" /> to <xsl:value-of select="dates/@end" />;<br />
    <xsl:if test="duty">
        <em>Duties:</em> 
        <ul class="breakdown">
            <xsl:for-each select="duty">
                <li><xsl:value-of select="." /></li>
            </xsl:for-each>
        </ul>
    </xsl:if>
    <xsl:if test="accomplishment">
        <em>Acccomplishments:</em>
        <ul class="breakdown">
            <xsl:for-each select="accomplishment">
                <li><xsl:value-of select="." /></li>
            </xsl:for-each>
        </ul>
    </xsl:if>
</xsl:for-each><!-- </experience> -->

</body>
</html>
</xsl:template>
</xsl:stylesheet>
