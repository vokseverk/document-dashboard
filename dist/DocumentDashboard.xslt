<?xml version="1.0"?>
<!--
	## DocumentDashboard.xslt
	
	Implement a simple dashboard for any Document Type in your tree.
-->
<?umbraco-package "Document Dashboard (v0.2)"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umb="urn:umbraco.library" version="1.0" exclude-result-prefixes="umb">
	
	
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>
	
	<!-- Default to children of `$currentPage` -->
	<xsl:variable name="documents" select="$currentPage/*[@isDoc]"/>
	
	<xsl:template match="/">
		<xsl:apply-templates select="$currentPage"/>
	</xsl:template>

	<xsl:template match="*[@isDoc]" priority="-1">
		<xsl:apply-templates select="$documents" mode="editLink"/>
	</xsl:template>
	
	<xsl:template match="*[@isDoc]" mode="editLink">
		<a href="/umbraco/editContent.aspx?id={@id}" title="Click to edit...">Edit</a>
	</xsl:template>
	
<!-- :: Dashboards :: -->

	<!-- Include your own templates here, e.g.:  -->
	<!-- <xsl:include href="dashboards/NewsItem.xslt" /> -->

</xsl:stylesheet>
