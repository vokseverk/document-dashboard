<?xml version="1.0" encoding="utf-8" ?>
<!--
	## DocumentDashboard.xslt
	
	Implement a simple dashboard for any Document Type in your tree.
-->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY % entities SYSTEM "mocks/entities.ent">
	%entities;
]>
<?umbraco-package ?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umb="urn:umbraco.library"
	exclude-result-prefixes="umb"
>
	&compatibility;
	
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />

	<xsl:param name="currentPage" />
	
	<!-- Default to children of `$currentPage` -->
	<xsl:variable name="documents" select="$currentPage/*[@isDoc]" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="$currentPage" />
	</xsl:template>

	<xsl:template match="*[@isDoc]" priority="-1">
		<xsl:apply-templates select="$documents" mode="editLink" />
	</xsl:template>
	
	<xsl:template match="*[@isDoc]" mode="editLink">
		<a href="/umbraco/editContent.aspx?id={@id}" title="Click to edit...">Edit</a>
	</xsl:template>
	
<!-- :: Dashboards :: -->

	<!--
	Don't add your own dashboards to this file, but add them to the included file.
	It's easier to upgrade if your custom code is in a separate file.
	-->
	<xsl:include href="_Dashboards.xslt" />

</xsl:stylesheet>