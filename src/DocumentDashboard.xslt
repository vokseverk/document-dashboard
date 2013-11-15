<?xml version="1.0" encoding="utf-8" ?>
<!--
	## DocumentDashboard.xslt
	
	Implement a simple dashboard for any Document Type in your tree.
-->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY % entities SYSTEM "mocks/entities.ent">
	%entities;
	
	<!ENTITY editContentLink "/umbraco/editContent.aspx?id={@id}">
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

	<!-- Process `$currentPage` - i.e., find the template that matches the current DocumentType -->
	<xsl:template match="/">
		<xsl:apply-templates select="$currentPage" />
	</xsl:template>

	<!--
	Generic template for any DocumentType that doesn't have its own template;
	Generate an edit link for every child node.
	-->
	<xsl:template match="*[@isDoc]" priority="-1">
		<xsl:for-each select="$documents">
			<p>
				<xsl:apply-templates select="." mode="editLink" />
			</p>
		</xsl:for-each>
	</xsl:template>
	
	<!--
	Helper template - matches any DocumentType if applied in *editLink* mode,
	generating a link to edit that particular document. You can use this in your
	own custom dashboards as well.
	-->
	<xsl:template match="*[@isDoc]" mode="editLink">
		<a href="&editContentLink;" title="Click to edit...">Edit</a>
	</xsl:template>
	
	<!--
	Render a node as a linked thumbnail - if your image property doesn't use the standard
	`umbracoFile` alias, specify the right one in the `$image` parameter. Likewise, you can
	specify another property to use for the caption if you don't want to use `@nodeName`.
	-->
	<xsl:template match="*[@isDoc]" mode="editLinkImage">
		<xsl:param name="image" />
		<xsl:param name="caption" select="@nodeName" />
		
		<!--
		This is fairly safe to do, unless you have a property named exactly the same as an
		image in the umbracoFile property. Not likely to happen :-)
		-->
		<xsl:variable name="filename" select="*[not(@isDoc)][name() = $image] | umbracoFile" />
		
		<xsl:variable name="extension" select="substring($filename, (string-length($filename) - 3))" />
		<xsl:variable name="thumbnail" select="concat(substring-before($filename, $extension), '_thumb.jpg')" />
		<a href="&editContentLink;" title="Click to edit...">
			<figure>
				<img src="{$thumbnail}" alt="{$caption}" />
				<xsl:if test="normalize-space($caption)">
					<figcaption>
						<xsl:value-of select="$caption" />
					</figcaption>
				</xsl:if>
			</figure>
		</a>
	</xsl:template>
	
<!-- :: Dashboards :: -->

	<!--
	Don't add your own dashboards to this file, but add them to the included file.
	It's easier to upgrade if your custom code is in a separate file.
	-->
	<xsl:include href="_Dashboards.xslt" />

</xsl:stylesheet>