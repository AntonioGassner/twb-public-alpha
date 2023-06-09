<xsl:stylesheet
        version="1.1"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:ext="http://exslt.org/common"
        exclude-result-prefixes="ext"
        xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    >

    <xsl:template name="tokenize">
        <xsl:param name="text"/>
            <xsl:choose>
                <xsl:when test="translate($text, ',', '') = $text">
                    <xsl:element name="AvailablePiece">
                        <xsl:attribute name="id">
                            <xsl:value-of select="$text"/>
                        </xsl:attribute>
                    </xsl:element>                    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="AvailablePiece">
                        <xsl:attribute name="id">
                            <xsl:value-of select="substring-before($text, ',')"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:call-template name="tokenize">
                        <xsl:with-param name="text" select="substring-after($text, ',')"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>

    <xsl:template name="generate-available-pieces">
        <xsl:param name="weapon-pieces"/>

        <xsl:variable name="available-piece-tags">
            <xsl:call-template name="tokenize">
                <xsl:with-param name="text">
                    <xsl:value-of select="$weapon-pieces"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:copy-of select="."/>
        <xsl:for-each select="msxsl:node-set($available-piece-tags)">
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:template>
				
				
	<xsl:variable name="mace-pieces" select="concat(
                    'twb_mace_head_1,',
                    'twb_mace_head_2'
                    
                )"/>

	<xsl:variable name="two-hand-mace-pieces" select="concat(
                    'twb_mace_head_1,',
                    'twb_mace_head_2'
                    
                )"/>
				

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

	
	<xsl:template match="//WeaponDescription[@id='Mace']//AvailablePiece[not(following-sibling::AvailablePiece)]">
        <xsl:call-template name="generate-available-pieces">
            <xsl:with-param name="weapon-pieces">
                <xsl:value-of select="$mace-pieces"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

	<xsl:template match="//WeaponDescription[@id='TwoHandedMace']//AvailablePiece[not(following-sibling::AvailablePiece)]">
		<xsl:call-template name="generate-available-pieces">
			<xsl:with-param name="weapon-pieces">
				<xsl:value-of select="$two-hand-mace-pieces"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

    
</xsl:stylesheet>