<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="MBPartyTemplate[@id='kingdom_hero_party_aserai_template']"/>
	<xsl:template match="MBPartyTemplate[@id='kingdom_hero_party_battania_template']"/>
	<xsl:template match="MBPartyTemplate[@id='kingdom_hero_party_empire_template']"/>
	<xsl:template match="MBPartyTemplate[@id='kingdom_hero_party_khuzait_template']"/>
	<xsl:template match="MBPartyTemplate[@id='kingdom_hero_party_sturgia_template']"/>
	<xsl:template match="MBPartyTemplate[@id='kingdom_hero_party_vlandia_template']"/>

	<xsl:template match="MBPartyTemplate[@id='vassal_reward_troops_aserai']"/>
	<xsl:template match="MBPartyTemplate[@id='vassal_reward_troops_battania']"/>
	<xsl:template match="MBPartyTemplate[@id='vassal_reward_troops_empire']"/>
	<xsl:template match="MBPartyTemplate[@id='vassal_reward_troops_khuzait']"/>
	<xsl:template match="MBPartyTemplate[@id='vassal_reward_troops_sturgia']"/>
	<xsl:template match="MBPartyTemplate[@id='vassal_reward_troops_vlandia']"/>
	
	<xsl:template match="MBPartyTemplate[@id='villager_empire_template']"/>
	<xsl:template match="MBPartyTemplate[@id='villager_aserai_template']"/>
	<xsl:template match="MBPartyTemplate[@id='villager_sturgia_template']"/>
	<xsl:template match="MBPartyTemplate[@id='villager_vlandia_template']"/>
	<xsl:template match="MBPartyTemplate[@id='villager_battania_template']"/>
	<xsl:template match="MBPartyTemplate[@id='villager_khuzait_template']"/>
</xsl:stylesheet>
