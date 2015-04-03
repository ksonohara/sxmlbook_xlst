<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.0_2                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML アイテム群                                                     -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- 内容 -->
	<xsl:template name="items">
		<xsl:param name="prefix" select="''" />
		<xsl:param name="clazz" select="$clazz.title" />
		<xsl:param name="indent" select="0" />
		<xsl:param name="enabled" select="0" />

		<xsl:if test="not(count(./index) = '0')">
			<xsl:for-each select="./index">
				<xsl:variable name="i" select="@name" />
				<xsl:variable name="n" select="key('itemid', $i)" />

				<xsl:variable name="on">
					<xsl:choose>
						<xsl:when test="$enabled = '1'">1</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="$html.index.name = ''">1</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$html.index.name = @name">1</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:if test="$on = '1'">
					<xsl:apply-templates select="$n">
						<xsl:with-param name="clazz" select="$clazz"/>
						<xsl:with-param name="indent" select="$indent"/>
						<xsl:with-param name="index_number" select="concat($prefix, concat(position(), '. '))"/>
					</xsl:apply-templates>

					<xsl:call-template name="items">
						<xsl:with-param name="indent" select="$indent + 1"/>
						<xsl:with-param name="prefix" select="concat($prefix, concat(position(), '.'))"/>
						<xsl:with-param name="enabled" select="1"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 -->
	<xsl:template match="item">
		<xsl:param name="indent" select="0" />
		<xsl:param name="clazz" select="''" />
		<xsl:param name="index_number" select="''" />

		<div class="content">
			<xsl:variable name="c">
				<xsl:choose>
					<xsl:when test = "$indent = '0'">content_title</xsl:when>
					<xsl:otherwise>content_subtitle</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test = "$clazz != ''">_<xsl:value-of select="$clazz" /></xsl:when>
				</xsl:choose>
			</xsl:variable>

			<h1 class="{$c}">
				<a
					class="{$c}"
					id="{./@id}"
				>
					 <xsl:value-of select="$index_number" /> <xsl:value-of select="./title" /><xsl:if test="normalize-space(./@make) = 'true'"> ～編集中～</xsl:if>
				</a>
			</h1>

			<xsl:if test="not(normalize-space(./description) = '')">
				<div class="content_summary">
					<xsl:if test="not(normalize-space(./date) = '')">
						<xsl:value-of select="./date" />　
					</xsl:if>

					<xsl:value-of select="./description" />
				</div>
			</xsl:if>


			<div class="content_main">
				<xsl:if test="not(normalize-space(./@make) = '')">
					<div class="content_make">
						<div class="content_make_title">～編集中～</div>
					</div>
				</xsl:if>

				<xsl:for-each select="./*">
					<xsl:choose>
						<xsl:when test="name() = 'title'"> </xsl:when>
						<xsl:when test="name() = 'date'"> </xsl:when>
						<xsl:when test="name() = 'description'"> </xsl:when>
						<xsl:when test="name() = 'links'"> </xsl:when>
						<xsl:when test="name() = 'terms'"> </xsl:when>
						<xsl:otherwise>
							<div class="content_{name()}">
								<xsl:apply-templates select="." />
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>

				<xsl:call-template name="linklist">
					<xsl:with-param name="target" select="./links"/>
					<xsl:with-param name="id" select="'itemid'"/>
					<xsl:with-param name="title" select="'関連項目'"/>
				</xsl:call-template>

				<xsl:call-template name="linklist">
					<xsl:with-param name="target" select="./terms"/>
					<xsl:with-param name="id" select="'termid'"/>
					<xsl:with-param name="title" select="'関連用語'"/>
				</xsl:call-template>

				<div class="content_top">
					<a
						class="content_top"
						href="#"
					>
						<xsl:choose>
							<xsl:when test="$text.top != ''"><xsl:value-of select="$text.top" /></xsl:when>
							<xsl:otherwise>▲トップへ</xsl:otherwise>
						</xsl:choose>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 リファレンス -->
	<xsl:template match="ref_element">
		<div class="content_title">◇<xsl:value-of select="./title" /></div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メソッド -->
	<xsl:template match="method">
		<div class="content_title"><xsl:value-of select="./title" /></div>

		<div class="content_text"><xsl:value-of select="./method_access" /><xsl:value-of select="' '" /><xsl:value-of select="./title" />
			(
			<xsl:for-each select="./method_param">
				<div class="content_param"><a class="content_param" href="#{./@link}"><xsl:value-of select="./@link" /></a><xsl:value-of select="' '" /><xsl:value-of select="./text()" /></div>
			</xsl:for-each>
			)
			<xsl:variable name="i" select="count(./method_exception)" />
			<xsl:if test="not($i = '0')">
				throws 
				<xsl:for-each select="./method_exception">
					<div class="content_param"><a class="content_param" href="#{./@link}"><xsl:value-of select="./@link" /></a><xsl:value-of select="' '" /><xsl:value-of select="./text()" /></div>
				</xsl:for-each>
			</xsl:if>
			;
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 マップ -->
	<xsl:template match="list">
		<table class="content_list">
			<xsl:for-each select="./value">
				<tr class="content_list">
					<td class="content_list">
						<xsl:value-of select="./text()" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 リスト -->
	<xsl:template match="map">
		<table class="content_list">
			<xsl:for-each select="./value">
				<tr class="content_list">
					<th class="content_list">
						<xsl:value-of select="./title" />: 
					</th>
					<td class="content_list">
						<xsl:value-of select="./text" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 テーブル -->
	<xsl:template match="table">
		<table class="content_table">
			<tr class="content_table">
				<xsl:for-each select="./columns/column">
					<th  class="content_table">
						<xsl:value-of select="./text()" />
					</th>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="./values">
				<tr class="content_table">
					<xsl:for-each select="./value">
							<td class="content_table">
								<xsl:apply-templates select="." />
							</td>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 単語 -->
	<xsl:template match="term">
		<xsl:variable name="n" select="key('termid', ./@link)" />

		<xsl:choose>
			<xsl:when test="normalize-space($n/title) = ''">
				<div class="content_term_title">
					<a
						class="content_term_title"
						id="term_{./@termid}"
					>
						◇ <xsl:value-of select="./title" />
					</a>
				</div>

				<div class="content_term_text">
					<xsl:for-each select="./*">
						<xsl:choose>
							<xsl:when test="name() = 'title'"> </xsl:when>
							<xsl:when test="name() = 'description'"> </xsl:when>
							<xsl:otherwise>
								<!--div class="content_{name()}"-->
									<xsl:apply-templates select="." />
								<!--/div-->
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when  test="not(normalize-space(./title) = '')">
						<div class="content_term_title">
							<a
								class="content_term_title"
								id="term_{./@termid}"
							>
								<xsl:value-of select="./title" />
							</a>
						</div>
						<div class="content_term_text">
							<xsl:value-of select="./text" />
						</div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if  test="not(normalize-space(./title) = '')">
							<div class="content_term_title">
								<a
									class="content_term_title"
									id="term_{./@termid}"
								>
									<xsl:value-of select="./title" />
								</a>
							</div>
						</xsl:if>
						<div class="content_term_text">
							＞
							<a
								class="content_term_text"
								href="#term_{./@link}"
							>
								<xsl:value-of select="$n/title" />
							</a>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 ステップ -->
	<xsl:template match="step">
		<xsl:variable name="mark">
			<xsl:choose>
				<xsl:when test="normalize-space(./number) = ''">　</xsl:when>
				<xsl:otherwise><xsl:value-of select="normalize-space(./number)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="content_step_title">
			<span class="content_step_title_mark">
				<xsl:value-of select="$mark" />
			</span>
			<span class="content_step_title">
				<xsl:value-of select="./title" />
			</span>
		</div>

		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="content_step_image">
			<xsl:choose>
				<xsl:when test="normalize-space(./description) = ''"></xsl:when>
				<xsl:otherwise>
					<div class="content_step_text">
						<xsl:value-of select="./description" />
					</div>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:variable name="css">
				<xsl:choose>
					<xsl:when test="normalize-space(./size) = ''">content_image</xsl:when>
					<xsl:otherwise>content_image_<xsl:value-of select="./size" /></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="src">
				<xsl:choose>
					<xsl:when test="normalize-space(./thumbnail) = ''"><xsl:value-of select="./url" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="./thumbnail" /></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$image.click = '1'">
					<a
						class="content_image"
						href="{$image_url}{./url}"
						title="{./title}"
					>
						<xsl:choose>
							<xsl:when test="normalize-space(./url) = ''"></xsl:when>
							<xsl:otherwise>
								<img
									class="{$css}"
									src="{$image_url}{$src}"
									alt="{./title}"
								 />
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="normalize-space(./url) = ''"></xsl:when>
						<xsl:otherwise>
							<img
								class="{$css}"
								src="{$image_url}{$src}"
								alt="{./title}"
							 />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>

		</div>
		<xsl:for-each select="./value">
			<div class="content_step_text">
				→ <xsl:apply-templates select="." />
			</div>
		</xsl:for-each>

		<xsl:for-each select="./text">
			<div class="content_step_text">
				<xsl:apply-templates select="." />
			</div>
		</xsl:for-each>

		<br class="content_step_br" />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 イメージ -->
	<xsl:template match="image">
		<xsl:choose>
			<xsl:when test="normalize-space(./title) = ''"></xsl:when>
			<xsl:otherwise>
				<div class="content_image_title">
					●<xsl:value-of select="./title" />
				</div>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:call-template name="urlimage">
			<xsl:with-param name="title" select="normalize-space(./title)" />
			<xsl:with-param name="showurl" select="1" />
			<xsl:with-param name="url" select="normalize-space(./url)" />
			<xsl:with-param name="link" select="normalize-space(./link)" />
			<xsl:with-param name="thumbnail" select="normalize-space(./thumbnail)" />
			<xsl:with-param name="size" select="normalize-space(./size)" />
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 サムネイル -->
	<xsl:template match="thumbnails">
		<xsl:choose>
			<xsl:when test="normalize-space(./title) = ''"></xsl:when>
			<xsl:otherwise>
				<div class="content_image_thumbnails_title">
					●<xsl:value-of select="./title" />
				</div>
			</xsl:otherwise>
		</xsl:choose>

		<div class="content_image_thumbnails">
			<xsl:for-each select="./thumbnail">
				<xsl:call-template name="urlimage">
					<xsl:with-param name="title" select="normalize-space(./title)" />
					<xsl:with-param name="showurl" select="0" />
					<xsl:with-param name="url" select="normalize-space(./url)" />
					<xsl:with-param name="link" select="normalize-space(./link)" />
					<xsl:with-param name="thumbnail" select="normalize-space(./thumbnail)" />
					<xsl:with-param name="size" select="normalize-space(./size)" />
				</xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 セパレータ -->
	<xsl:template match="separator">
		<hr class="content_separator" />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 改行 -->
	<xsl:template match="newline">
		<br />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 コード -->
	<xsl:template match="code">
		<pre class="content_image_code">
			<xsl:value-of select="./text()" />
		</pre>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 テキスト -->
	<xsl:template match="text">
		<xsl:call-template name="uitext">
			<xsl:with-param name="type" select="normalize-space(./@type)"/>
			<xsl:with-param name="mark" select="normalize-space(./@mark)"/>
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="normalize-space(./@clazz)"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 FAQ -->
	<xsl:template match="faq">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="concat('● ', ./title)" />
			<xsl:with-param name="text" select="./text"/>
			<xsl:with-param name="css" select="'faq'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メモ -->
	<xsl:template match="memo">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="'◇ メモ'" />
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="'memo'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 注意 -->
	<xsl:template match="warn">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="'◇ 注意'"/>
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="'warn'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 警告 -->
	<xsl:template match="alert">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="'◇ 警告'"/>
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="'alert'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 トピック -->
	<xsl:template match="topic">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="concat('○ ', ./title)" />
			<xsl:with-param name="text" select="./text"/>
			<xsl:with-param name="css" select="'topic'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 Site -->
	<xsl:template match="site">
		<div class="content_site_title">◆ 
			<xsl:value-of select="normalize-space(./title)" />
		</div>
		<div class="content_site_text">
			<xsl:call-template name="urltext">
				<xsl:with-param name="title" select="normalize-space(./title)" />
				<xsl:with-param name="css" select="content_url"/>
				<xsl:with-param name="url" select="normalize-space(./url)" />
				<xsl:with-param name="target" select="normalize-space(./url/@target)" />
				<xsl:with-param name="urltype" select="normalize-space(./url/@urltype)" />
			</xsl:call-template>
		</div>
		<xsl:choose>
			<xsl:when test="normalize-space(./text)=''"> </xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="uitext">
					<xsl:with-param name="text" select="./text"/>
					<xsl:with-param name="type" select="'text'"/>
					<xsl:with-param name="css" select="'site'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 URL -->
	<xsl:template match="url">
		<xsl:call-template name="urltext">
			<xsl:with-param name="title" select="normalize-space(./text)" />
			<xsl:with-param name="css" select="content_url"/>
			<xsl:with-param name="url" select="normalize-space(./text)" />
			<xsl:with-param name="target" select="normalize-space(./@target)" />
			<xsl:with-param name="urltype" select="normalize-space(./@urltype)" />
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- ボックスイメージ -->
	<xsl:template name="urlimage">
		<xsl:param name="title" select="''" />
		<xsl:param name="showtitle" select="'1'" />
		<xsl:param name="link" select="''" />
		<xsl:param name="url" select="''" />
		<xsl:param name="thumbnail" select="''" />
		<xsl:param name="size" select="''" />

		<xsl:variable name="i" select="normalize-space($link)" />
		<xsl:variable name="n" select="key('itemid', $i)" />

		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="h">
			<xsl:choose>
				<xsl:when test="$n != ''">#<xsl:value-of select="$i" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="$image_url" /><xsl:value-of select="$url" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="css">
			<xsl:choose>
				<xsl:when test="normalize-space(./size) = ''">content_image</xsl:when>
				<xsl:otherwise>content_image_<xsl:value-of select="./size" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="src">
			<xsl:choose>
				<xsl:when test="normalize-space($thumbnail) = ''"><xsl:value-of select="$url" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="$thumbnail" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$image.click = '1'">
				<a
					class="content_image"
					href="{$h}"
					title="{$title}"
				>
					<img
						class="{$css}"
							src="{$image_url}{$src}"
						alt="{$title}"
					 />
				</a>
			</xsl:when>
			<xsl:otherwise>
				<img
					class="{$css}"
						src="{$image_url}{$src}"
					alt="{$title}"
				 />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- ボックステキスト -->
	<xsl:template name="urltext">
		<xsl:param name="css" select="content_url" />
		<xsl:param name="title" select="''" />
		<xsl:param name="url" select="''" />
		<xsl:param name="target" select="''" />
		<xsl:param name="urltype" select="''" />
		<xsl:variable name="text">
			<xsl:choose>
				<xsl:when test="$urltype='title'"><xsl:value-of select="$title" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="$url" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="t">
			<xsl:choose>
				<xsl:when test="$target=''">_blank</xsl:when>
				<xsl:otherwise><xsl:value-of select="$target" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<a
			class="{$css}"
			target="{$t}"
			href="{$url}"
		>
			<xsl:value-of select="$text" />
		</a>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 リンク -->
	<xsl:template match="link">
		<xsl:variable name="i" select="normalize-space(./text())" />
		<xsl:variable name="n" select="key('itemid', $i)" />

		<a
			class="content_link"
			href="#{$i}"
		>
			<xsl:value-of select="normalize-space($n/title)" />
		</a>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メール -->
	<xsl:template match="mail">
		<a
			class="content_mail"
			target="_TOP"
			onclick="location.href = 'mai' + 'lto:'+ '{normalize-space(./account)}' + '&#64;' + '{normalize-space(./domain)}';"
		>
			<xsl:value-of select="normalize-space(./account)" />の<xsl:value-of select="normalize-space(./domain)" />
		</a>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- ボックステキスト -->
	<xsl:template name="uiboxtext">
		<xsl:param name="title" select="''" />
		<xsl:param name="text" select="''" />
		<xsl:param name="css" select="''" />

		<div class="content_{$css}_title"><xsl:value-of select="$title" /></div>
		<xsl:call-template name="uitext">
			<xsl:with-param name="text" select="$text"/>
			<xsl:with-param name="type" select="'text'"/>
			<xsl:with-param name="css" select="$css"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- テキスト -->
	<xsl:template name="uitext">
		<xsl:param name="type" select="''" />
		<xsl:param name="mark" select="''" />
		<xsl:param name="text" select="''" />
		<xsl:param name="css" select="'text'" />

		<xsl:variable name="c">
			<xsl:choose>
				<xsl:when test="$type = ''">content_<xsl:value-of select="$css" /></xsl:when>
				<xsl:otherwise>content_<xsl:value-of select="$css" />_<xsl:value-of select="$type" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="m">
			<xsl:choose>
				<xsl:when test="$mark = ''"> </xsl:when>
				<xsl:otherwise><xsl:value-of select="$mark" /><xsl:value-of select="' '" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:if test="$text!=''">
			<div class="{$c}">
				<xsl:value-of select="$m" /><xsl:value-of select="$text" />
			</div>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- リンクリスト -->
	<xsl:template name="linklist">
		<xsl:param name="target" select="''" />
		<xsl:param name="id" select="''" />
		<xsl:param name="title" select="'関連'" />
		<xsl:variable name="f" select="$target/id" />

		<xsl:if test="not(count($target) = '0')">
			<br /><br />

			<xsl:call-template name="uitext">
				<xsl:with-param name="type" select="'bold'"/>
				<xsl:with-param name="mark" select="'□'"/>
				<xsl:with-param name="text" select="$title"/>
			</xsl:call-template>

			<xsl:for-each select="$f">
				<div class="content_link">
					<xsl:variable name="i" select="normalize-space(./text())" />
					<xsl:variable name="n" select="key($id, $i)" />
					<a
						class="content_link"
						href="#{$i}"
					>
						<xsl:value-of select="normalize-space($n/title)" />
					</a>
				</div>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
