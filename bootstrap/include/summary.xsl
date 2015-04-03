<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML サマリー表示                                                   -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- サマリー -->
	<xsl:template name="summary">
		<xsl:if test="not(normalize-space(./summary/title) = '')">
			<div class="jumbotron" id="summary_jumbotron">
				<div class="container">
					<h2><xsl:value-of select="./summary/title" /></h2>
					<xsl:if test="not(normalize-space(./summary/description) = '')">
						<h4><xsl:value-of select="./summary/description" /></h4>
					</xsl:if>

					<xsl:for-each select="./summary/*">
						<xsl:choose>
							<xsl:when test="name() = 'title'"> </xsl:when>
							<xsl:when test="name() = 'date'"> </xsl:when>
							<xsl:when test="name() = 'description'"> </xsl:when>
							<xsl:when test="name() = 'links'"> </xsl:when>
							<xsl:when test="name() = 'terms'"> </xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="." />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
