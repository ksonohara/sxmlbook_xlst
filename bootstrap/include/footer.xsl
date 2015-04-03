<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML フッター                                                       -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- フッダー -->
	<xsl:template name="footer">
		<xsl:if test="$footer.type = 'show'">

			<br />
			<br />
			<br />
			<br />

			<div class="footer navbar-default" id="page_footer">
				<br />

				<div class="container">
					<div class="row">
						<div class="col-sm-6 hidden-xs"><xsl:value-of select="./info/description" /></div>
						<div class="col-sm-6 hidden-xs"><xsl:value-of select="./info/release" /></div>
					</div>
					<!-- 著作権 -->
					<div class="footer_copyright">
						<xsl:value-of select="./info/copyright" />
					</div>
				</div>
				<br />
				<br />
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
