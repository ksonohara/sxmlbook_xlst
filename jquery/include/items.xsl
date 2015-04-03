<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-12 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
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

				<xsl:variable name="index_number" select="concat($prefix, concat(position(), '. '))" />

				<xsl:if test="$on = '1'">
					<div data-role="page" id="{$n/@id}" class="type-interior" data-theme="{$jquery.theme}">
						<div data-role="header">
							<a href="#home" data-icon="home" data-iconpos="notext" data-direction="reverse" class="ui-btn-left">
								<xsl:choose>
									<xsl:when test="$text.indexes != ''"><xsl:value-of select="$text.indexes" /></xsl:when>
									<xsl:otherwise>目次</xsl:otherwise>
								</xsl:choose>
							</a>
							<h1><xsl:value-of select="$index_number" /> <xsl:value-of select="$n/title" /><xsl:if test="normalize-space($n/@make) = 'true'"> ～編集中～</xsl:if></h1>
						</div>

						<div data-role="content">
							<div class="content-secondary aside-content">
								<ul data-role="listview" data-inset="true">
									<xsl:text disable-output-escaping="yes">&lt;!-- =============== --&gt;</xsl:text>
									<li class="current">
										<xsl:variable name="up">
											<xsl:choose>
												<xsl:when test="normalize-space(../@name) = ''">home</xsl:when>
												<xsl:otherwise><xsl:value-of select="../@name" /></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<a
											href="{$html.file}#{$up}"
										>上へ</a>
									</li>

									<xsl:call-template name="index_item">
										<xsl:with-param name="prefix" select="concat($prefix, concat(position(), '.'))" />
										<xsl:with-param name="enabled" select="1" />
									</xsl:call-template>
								</ul>
							</div>
							<div class="content-primary main-content">
								<xsl:apply-templates select="$n">
									<xsl:with-param name="indent" select="$indent"/>
									<xsl:with-param name="index_number" select="$index_number"/>
								</xsl:apply-templates>
							</div>
						</div>

						<div data-role="footer">
							<h2><xsl:value-of select="/sxmlbook/info/description" /></h2>
							<h2><xsl:value-of select="/sxmlbook/info/copyright" /></h2>
						</div>

					</div>
				</xsl:if>

				<xsl:call-template name="items">
					<xsl:with-param name="indent" select="$indent + 1"/>
					<xsl:with-param name="prefix" select="concat($prefix, concat(position(), '.'))"/>
					<xsl:with-param name="enabled" select="1"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 -->
	<xsl:template match="item">
		<xsl:param name="indent" select="0" />
		<xsl:param name="index_number" select="''" />

		<xsl:text disable-output-escaping="yes">&lt;!-- =============== --&gt;</xsl:text>

		<xsl:if test="not(normalize-space(./date) = '')">
			<h3>
				<xsl:value-of select="./date" />
			</h3>
		</xsl:if>

		<xsl:if test="not(normalize-space(./description) = '')">
			<h3>
				<xsl:value-of select="./description" />
			</h3>
		</xsl:if>

		<xsl:if test="not(normalize-space(./@make) = '')">
			<h3>～編集中～</h3>
		</xsl:if>

		<xsl:for-each select="./*">
			<xsl:choose>
				<xsl:when test="name() = 'title'"> </xsl:when>
				<xsl:when test="name() = 'date'"> </xsl:when>
				<xsl:when test="name() = 'description'"> </xsl:when>
				<xsl:when test="name() = 'links'"> </xsl:when>
				<xsl:when test="name() = 'terms'"> </xsl:when>
				<xsl:otherwise>
					<p>
						<xsl:apply-templates select="." />
					</p>
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
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 エレメント リファレンス -->
	<xsl:template match="ref_element">
		<ul data-role="listview" data-inset="true">
			<li data-role="list-divider"><xsl:value-of select="../title" /></li>
		</ul>

		<p>
			&lt;<xsl:value-of select="./title" /><xsl:value-of select="' '" />
			<xsl:variable name="r" select="count(./element_child)" />
			<xsl:variable name="t" select="count(./element_parent)" />
			<xsl:variable name="p" select="count(./element_attribute)" />
			<xsl:if test="not($p = '0')">
				<xsl:for-each select="./element_attribute">
					<xsl:choose>
						<xsl:when test="normalize-space(./@link) = ''"><xsl:value-of select="./@define" />="" </xsl:when>
						<xsl:otherwise>
							<a href="#{./@link}"><xsl:value-of select="./@define" /></a>="" 
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if> /&gt;

			<xsl:if test="not($p = '0')">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">属性</li>
					<xsl:for-each select="./element_attribute">
						<li>
							<xsl:choose>
								<xsl:when test="normalize-space(./@link) = ''">
									<h4><xsl:value-of select="./@define" /></h4>
									<p><xsl:value-of select="./text()" /></p>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="n" select="key('itemid', ./@link)" />
									<h4>
										<a href="#{./@link}"><xsl:value-of select="$n/title" /></a>
									</h4>
									<p><xsl:value-of select="$n/description" /></p>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="normalize-space(./@required) = 'true'">
								<p>必須</p>
							</xsl:if>
							<p><xsl:value-of select="./text()" /><xsl:value-of select="' '" /></p>
	 					</li>
					</xsl:for-each>
				</ul>
			</xsl:if>

			<xsl:if test="not($t = '0')">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">親エレメント</li>
					<xsl:for-each select="./element_parent">
						<li>
							<xsl:choose>
								<xsl:when test="normalize-space(./@link) = ''">
									<h4><xsl:value-of select="./@define" /></h4>
									<p><xsl:value-of select="./text()" /></p>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="n" select="key('itemid', ./@link)" />
									<h4>
										<a href="#{./@link}"><xsl:value-of select="$n/title" /></a>
									</h4>
									<p><xsl:value-of select="$n/description" /></p>
								</xsl:otherwise>
							</xsl:choose>
							<p><xsl:value-of select="./text()" /><xsl:value-of select="' '" /></p>
	 					</li>
					</xsl:for-each>
				</ul>
			</xsl:if>

			<xsl:if test="not($r = '0')">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">子エレメント</li>
					<xsl:for-each select="./element_child">
						<li>
							<xsl:choose>
								<xsl:when test="normalize-space(./@link) = ''">
									<h4><xsl:value-of select="./@define" /></h4>
									<p><xsl:value-of select="./text()" /></p>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="n" select="key('itemid', ./@link)" />
									<h4>
										<a href="#{./@link}"><xsl:value-of select="$n/title" /></a>
									</h4>
									<p><xsl:value-of select="$n/description" /></p>
								</xsl:otherwise>
							</xsl:choose>
							<p><xsl:value-of select="./text()" /><xsl:value-of select="' '" /></p>
	 					</li>
					</xsl:for-each>
				</ul>
			</xsl:if>
		</p>

		<xsl:variable name="c" select="count(./code)" />
		<xsl:if test="not($c = '0')">
			<ul data-role="listview" data-inset="true">
				<li>コード例</li>
				<li><xsl:apply-templates select="code" /></li>
			</ul>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 属性 リファレンス -->
	<xsl:template match="ref_atribute">
		<ul data-role="listview" data-inset="true">
			<li data-role="list-divider"><xsl:value-of select="../title" /></li>
		</ul>

		<p>
			<xsl:value-of select="./title" />=""<xsl:value-of select="' '" />
			<xsl:variable name="t" select="count(./atribute_element)" />

			<xsl:if test="not($t = '0')">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">属性</li>
					<xsl:for-each select="./atribute_element">
						<li>
							<xsl:choose>
								<xsl:when test="normalize-space(./@link) = ''">
									<h4><xsl:value-of select="./@define" /></h4>
									<p><xsl:value-of select="./text()" /></p>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="n" select="key('itemid', ./@link)" />
									<h4>
										<a href="#{./@link}"><xsl:value-of select="$n/title" /></a>
									</h4>
									<p><xsl:value-of select="$n/description" /></p>
								</xsl:otherwise>
							</xsl:choose>
							<p><xsl:value-of select="./text()" /><xsl:value-of select="' '" /></p>
	 					</li>
					</xsl:for-each>
				</ul>
			</xsl:if>

			<br />
			<br />
		</p>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 マップ -->
	<xsl:template match="map">
		<table class="ui-body">
			<xsl:for-each select="./key">
				<tr>
					<th class="ui-body-e">
						<xsl:value-of select="./@title" />
					</th>
					<td class="ui-body-c">
						<xsl:value-of select="./value" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 リスト -->
	<xsl:template match="list">
		<table class="ui-body">
			<xsl:for-each select="./value">
				<tr>
					<td class="ui-body-c">
						<xsl:value-of select="./text()" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 テーブル -->
	<xsl:template match="table">
		<table class="ui-body">
			<tr>
				<xsl:for-each select="./columns/column">
					<th class="ui-body-e">
						<xsl:value-of select="./text()" />
					</th>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="./values">
				<tr>
					<xsl:for-each select="./value">
							<td class="ui-body-c">
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
				<strong>
					<a
						class="content_term_title"
						id="term_{./@termid}"
					>
						◇ <xsl:value-of select="./title" />
					</a>
				</strong>

				<p>
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
				</p>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when  test="not(normalize-space(./title) = '')">
						<strong>
							<a
								id="term_{./@termid}"
							>
								<xsl:value-of select="./title" />
							</a>
						</strong>
						<p>
							<xsl:value-of select="./text" />
						</p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if  test="not(normalize-space(./title) = '')">
							<p>
								<a
									id="term_{./@termid}"
								>
									<xsl:value-of select="./title" />
								</a>
							</p>
						</xsl:if>
						<p>
							＞
							<a
								href="#term_{./@link}"
							>
								<xsl:value-of select="$n/title" />
							</a>
						</p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 ステップ -->
	<xsl:template match="step">
		<strong>
			■ <xsl:value-of select="./title" />
		</strong>

		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<p>
			<xsl:choose>
				<xsl:when test="normalize-space(./description) = ''"></xsl:when>
				<xsl:otherwise>
					<div class="content_step_text">
						<xsl:value-of select="./description" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
			<a
				data-transition="pop"
				rel="external"
				href="{$image_url}{./url}"
				title="{./title}"
			>
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
				<img
					src="{$image_url}{$src}"
					alt="{./title}"
				 />
			</a>
		</p>

		<p>
			<xsl:for-each select="./value">
				<div>
					→ <xsl:apply-templates select="." />
				</div>
			</xsl:for-each>

			<br />
			<br />
		</p>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 イメージ -->
	<xsl:template match="image">
		<strong>
			●<xsl:value-of select="./title" />
		</strong>

		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<p>
			<a
				rel="external"
				href="{$image_url}{./url}"
				title="●{./title}"
			>
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
				<img
					class="{$css}"
					src="{$image_url}{$src}"
					alt="{./title}"
				 />
			</a>
		</p>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 セパレータ -->
	<xsl:template match="separator">
		<hr />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 改行 -->
	<xsl:template match="newline">
		<br />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 コード -->
	<xsl:template match="code">
		<pre><code><xsl:value-of select="./text()" /></code></pre>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 テキスト -->
	<xsl:template match="text">
		<xsl:call-template name="uitext">
			<xsl:with-param name="type" select="normalize-space(./@type)"/>
			<xsl:with-param name="mark" select="normalize-space(./@mark)"/>
			<xsl:with-param name="text" select="./text()"/>
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
		<strong>
			■ <xsl:value-of select="normalize-space(./title)" />
		</strong>
		<p>
			<xsl:call-template name="urltext">
				<xsl:with-param name="title" select="normalize-space(./title)" />
				<xsl:with-param name="css" select="content_url"/>
				<xsl:with-param name="url" select="normalize-space(./url)" />
				<xsl:with-param name="target" select="normalize-space(./url/@target)" />
				<xsl:with-param name="urltype" select="normalize-space(./url/@urltype)" />
			</xsl:call-template>
		</p>
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
			rel="external"
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
			href="#{$i}"
		>
			<xsl:value-of select="normalize-space($n/title)" />
		</a>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メール -->
	<xsl:template match="mail">
		<a
			rel="external"
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

		<strong><xsl:value-of select="$title" /></strong>
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
			<p><xsl:value-of select="$m" /><xsl:value-of select="$text" /></p>
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
			<ul data-role="listview" data-inset="true">
				<li data-role="list-divider">
					<xsl:value-of select="$title" />
				</li>

				<xsl:for-each select="$f">
					<li>
						<xsl:variable name="i" select="normalize-space(./text())" />
						<xsl:variable name="n" select="key($id, $i)" />
						<a
							href="#{$i}"
						>
							<xsl:value-of select="normalize-space($n/title)" />
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
