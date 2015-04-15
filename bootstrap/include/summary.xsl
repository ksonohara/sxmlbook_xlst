<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   sXML本体                                                             -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- サマリー -->
	<xsl:template name="summary">
		<xsl:if test="not(normalize-space(./summary/title) = '')">
			<div class="jumbotron" id="summary_jumbotron">
				<div class="row">
					<div class="col-lg-12">
						<h2><xsl:value-of select="./summary/title" /></h2>
						<xsl:if test="not(normalize-space(./summary/description) = '')">
							<h4><xsl:value-of select="./summary/description" /></h4>
						</xsl:if>
					</div>

					<div class="container">
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
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
