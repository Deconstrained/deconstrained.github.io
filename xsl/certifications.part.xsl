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
        <xsl:for-each select="./*">
            <xsl:copy-of select="." />
        </xsl:for-each><!-- </certlogo/child> -->
    </xsl:for-each><!-- </certlogo> -->
</div>


