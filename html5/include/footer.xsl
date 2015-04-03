<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.0.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007 K.Sonohara All Right Reserved.                    -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML フッタ                                                         -->
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
			<div class="footer">
				<!-- タイトル -->
				<div class="footer_title" >
					<xsl:if test="$html.title != ''"><xsl:value-of select="$html.title" /> [</xsl:if>
					<xsl:value-of select="./info/title" />
					<xsl:if test="$html.title != ''">]</xsl:if>
				</div>

				<!-- 会社名 -->
				<div class="footer_company" >
					<a
						class="footer_company"
						href="{./info/homepage}"
						target="_TOP"
					>
						<xsl:value-of select="./info/company" />
					</a>
				</div>

				<!-- 著作権 -->
				<div class="footer_copyright">
					<xsl:value-of select="./info/copyright" />
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
