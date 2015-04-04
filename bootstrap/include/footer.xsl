<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XSLT Footer                                                          -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- フッター -->
	<xsl:template name="footer">
		<xsl:choose>
			<xsl:when test="$footer_mode='test'">Error!</xsl:when>
			<xsl:otherwise>
				<footer class="container-fluid">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 hidden-xs"><xsl:value-of select="./info/description" /></div>
							<div class="col-lg-6 hidden-xs"><xsl:value-of select="./info/release" /></div>
							<div class="col-lg-12 hidden-xs"><xsl:value-of select="./info/copyright" /></div>
						</div>
					</div>
				</footer>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
