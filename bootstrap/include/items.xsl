<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
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
						<xsl:when test="$html.index.name=''">1</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="$html.index.name = @name">1</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
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


		<xsl:variable name="ch">
			<xsl:choose>
				<xsl:when test="$html.book != '1'"> </xsl:when>
				<xsl:otherwise>hidden</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div id="{./@id}" class="{$ch} col-xs-12">
			<div class="page-header">
				<h3>
					<xsl:call-template name="icon">
						<xsl:with-param name="name" select="$title.icon"/>
					</xsl:call-template>
					<xsl:if test="$item.prefix = '1'">
						<xsl:value-of select="$index_number" />
					</xsl:if>
					<xsl:value-of select="./title" />
				</h3>
			</div>

			<xsl:variable name="h4">
				<xsl:value-of select="normalize-space(./date)" />
				<xsl:value-of select="normalize-space(./description)" />
				<xsl:value-of select="normalize-space(./icon)" />
				<xsl:value-of select="normalize-space(./@new)" />
				<xsl:value-of select="normalize-space(./@make)" />
				<xsl:value-of select="normalize-space(./@deprecate)" />
				<xsl:value-of select="normalize-space(./@update)" />
			</xsl:variable>

			<xsl:if test="not($h4 = '')">
				<h5>
					<xsl:if test="not(normalize-space(./date) = '')">
						<xsl:value-of select="./date" /><xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="not(normalize-space(./description) = '')">

						<xsl:value-of select="./description" /><xsl:text> </xsl:text>
					</xsl:if>

					<xsl:if test="not(normalize-space(./@new) = '')">
						<span class="label label-primary">New</span>
					</xsl:if>
					<xsl:if test="not(normalize-space(./@update) = '')">
						<span class="label label-primary">更新</span>
					</xsl:if>
					<xsl:if test="not(normalize-space(./@make) = '')">
						<span class="label label-default">編集中</span>
					</xsl:if>
					<xsl:if test="not(normalize-space(./@deprecate) = '')">
						<span class="label label-danger">廃止予定</span>
					</xsl:if>

					<xsl:for-each select="./icon">
						<xsl:text> </xsl:text>
						<span class="label label-default">
							<xsl:value-of select="." />
						</span>
					</xsl:for-each>
				</h5>
			</xsl:if>

			<xsl:for-each select="./*">
				<xsl:choose>
					<xsl:when test="name() = 'title'"> </xsl:when>
					<xsl:when test="name() = 'date'"> </xsl:when>
					<xsl:when test="name() = 'description'"> </xsl:when>
					<xsl:when test="name() = 'icon'"> </xsl:when>
					<xsl:when test="name() = 'links'"> </xsl:when>
					<xsl:when test="name() = 'terms'"> </xsl:when>
					<xsl:otherwise>
						<xsl:variable name="of">
							<xsl:choose>
								<xsl:when test="./@offset = 'false'"><xsl:text></xsl:text></xsl:when>
								<xsl:when test="./@offset != ''">col-xs-offset-<xsl:value-of select="./@offset" /></xsl:when>
								<xsl:otherwise><xsl:text></xsl:text></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="cl">
							<xsl:choose>
								<xsl:when test="./@column = 'false'"><xsl:text></xsl:text></xsl:when>
								<xsl:when test="./@column != ''">col-xs-<xsl:value-of select="./@column" /></xsl:when>
								<xsl:otherwise>col-xs-12</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="cz">
							<xsl:choose>
								<xsl:when test="./@clazz != ''"><xsl:text> </xsl:text><xsl:value-of select="./@clazz" /></xsl:when>
								<xsl:otherwise><xsl:text></xsl:text></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<div class="{$of} {$cl}{$cz}">
							<xsl:apply-templates select="." />
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>

			<xsl:if test="not(count(./links) = '0')">
				<xsl:call-template name="linklist">
					<xsl:with-param name="target" select="./links"/>
					<xsl:with-param name="id" select="'itemid'"/>
					<xsl:with-param name="title" select="'関連項目'"/>
				</xsl:call-template>
			</xsl:if>

			<xsl:if test="not(count(./terms) = '0')">
				<xsl:call-template name="linklist">
					<xsl:with-param name="target" select="./terms"/>
					<xsl:with-param name="id" select="'termid'"/>
					<xsl:with-param name="title" select="'関連用語'"/>
				</xsl:call-template>
			</xsl:if>

			<xsl:if test="$top.mark = '1'">
				<div class="col-xs-offset-11 col-xs-1 hidden-xs">
					<xsl:choose>
						<xsl:when test="$html.book != '1'">
							<a href="#">
								<xsl:call-template name="icon">
									<xsl:with-param name="name" select="'circle-arrow-up'"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a href="#" onclick="mikan.page.showbook(null); ">
								<xsl:call-template name="icon">
									<xsl:with-param name="name" select="'circle-arrow-up'"/>
								</xsl:call-template>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:if>
			<xsl:text>　</xsl:text>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 エレメント リファレンス -->
	<xsl:template match="ref_element">
		<xsl:variable name="e" select="count(./element_attribute)" />
		<xsl:if test="not($e = '0')">
			<div class="panel panel-default">
				<div class="panel-heading">属性</div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>定義名</th>
							<th>必須</th>
							<th>説明</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="./element_attribute">
							<xsl:sort select="./@define" />
							<tr>
								<xsl:variable name="i" select="normalize-space(./@link)" />
								<xsl:variable name="n" select="key('itemid', $i)" />

								<td>
									<a
										href="#{$i}"
									>
										<xsl:value-of select="normalize-space(./@define)" />
									</a>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="normalize-space(./@type) = 'required'">必須</xsl:when>
										<xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td><xsl:value-of select="normalize-space($n/description)" /></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>


		<xsl:variable name="o" select="count(./element_node)" />
		<xsl:if test="not($o = '0')">
			<div class="panel panel-default">
				<div class="panel-heading">ノード</div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>説明</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="./element_node">
							<tr>
								<td>
									<xsl:value-of select="normalize-space(./@description)" />
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>

		<xsl:variable name="d" select="count(./element_child)" />
		<xsl:if test="not($d = '0')">
			<div class="panel panel-default">
				<div class="panel-heading">子エレメント</div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>定義名</th>
							<th>必須/任意</th>
							<th>説明</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="./element_child">
							<xsl:sort select="./@define" />
							<tr>
								<xsl:variable name="i" select="normalize-space(./@link)" />
								<xsl:variable name="n" select="key('itemid', $i)" />

								<td>
									<a
										href="#{$i}"
									>
										<xsl:value-of select="normalize-space(./@define)" />
									</a>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="normalize-space(./@type) = '1'">1個必須</xsl:when>
										<xsl:when test="normalize-space(./@type) = '+'">1個以上必須する</xsl:when>
										<xsl:when test="normalize-space(./@type) = '?'">なしまたは1個必須</xsl:when>
										<xsl:when test="normalize-space(./@type) = '*'">必須</xsl:when>
										<xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td><xsl:value-of select="normalize-space($n/description)" /></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>

		<xsl:variable name="p" select="count(./element_parent)" />
		<xsl:if test="not($p = '0')">
			<div class="panel panel-default">
				<div class="panel-heading">親エレメント</div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>定義名</th>
							<th>説明</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="./element_parent">
							<xsl:sort select="./@define" />
							<tr>
								<xsl:variable name="i" select="normalize-space(./@link)" />
								<xsl:variable name="n" select="key('itemid', $i)" />

								<td>
									<a
										href="#{$i}"
									>
										<xsl:value-of select="normalize-space(./@define)" />
									</a>
								</td>
								<td><xsl:value-of select="normalize-space($n/description)" /></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
		</div>
		</xsl:if>

		<xsl:variable name="a" select="count(./atribute_element)" />
		<xsl:if test="not($a = '0')">
			<div class="panel panel-default">
				<div class="panel-heading">対象エレメント</div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>定義名</th>
							<th>説明</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="./atribute_element">
							<tr>
								<xsl:variable name="i" select="normalize-space(./@link)" />
								<xsl:variable name="n" select="key('itemid', $i)" />

								<td>
									<a
										href="#{$i}"
									>
										<xsl:value-of select="normalize-space(./@define)" />
									</a>
								</td>
								<td><xsl:value-of select="normalize-space($n/description)" /></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>

		<xsl:variable name="c" select="count(./code)" />
		<xsl:if test="not($c = '0')">
			<div class="panel panel-default">
				<div class="panel-heading">コード例</div>
				<xsl:call-template name="code">
					<xsl:with-param name="code" select="./code/text()"/>
				</xsl:call-template>
			</div>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 リスト -->
	<xsl:template match="list">
		<div class="panel panel-default">
			<table class="table table-striped">
				<xsl:for-each select="./value">
					<tbody>
						<tr>
							<td>
								<xsl:value-of select="./text()" />
							</td>
						</tr>
					</tbody>
				</xsl:for-each>
			</table>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 マップ -->
	<xsl:template match="map">
		<dl class="dl-horizontal">
			<xsl:for-each select="./key">
			    <dt><xsl:value-of select="./@name" /></dt>
			    <dd><xsl:value-of select="./text()" /></dd>
			</xsl:for-each>
		</dl>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 テーブル -->
	<xsl:template match="table">
		<div class="panel panel-default">
			<table class="table table-striped">
				<xsl:if test="not(count(./columns) = '0')">
					<thead>
						<tr>
							<xsl:for-each select="./columns/column">
								<th>
									<xsl:value-of select="./text()" />
								</th>
							</xsl:for-each>
						</tr>
					</thead>
				</xsl:if>
				<tbody>
					<xsl:for-each select="./values">
						<tr>
							<xsl:for-each select="./value">
								<td>
									<xsl:apply-templates select="." />
									<xsl:text> </xsl:text>
								</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 単語 -->
	<xsl:template match="term">
		<xsl:variable name="n" select="key('termid', ./text())" />

		<h4>
			<a
				href="#term_{./text()}"
			>
				<xsl:call-template name="icon">
					<xsl:with-param name="name" select="'search'"/>
				</xsl:call-template>
				<xsl:value-of select="$n/title" />
			</a>
		</h4>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 単語 -->
	<xsl:template match="termitem">
		<hr />

		<h4>
			<a
				id="term_{./@termid}"
			>
				<xsl:call-template name="icon">
					<xsl:with-param name="name" select="'pushpin'"/>
				</xsl:call-template>
			</a>

			<xsl:value-of select="./title" />
		</h4>

		<p>
			<xsl:value-of select="./text" />
		</p>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 カレンダー -->
	<xsl:template match="calender">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<xsl:call-template name="icon">
					<xsl:with-param name="name" select="'calendar'"/>
				</xsl:call-template>
				<xsl:value-of select="./title" />
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="danger">日</th>
						<th>月</th>
						<th>火</th>
						<th>水</th>
						<th>木</th>
						<th>金</th>
						<th class="info">土</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="./days">
						<tr>
							<xsl:for-each select="./day">
								<td>
									<h4><xsl:value-of select="./@number" /></h4>
									<p><xsl:value-of select="./text()" /></p>
								</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 ステップ -->
	<xsl:template match="step">
		<xsl:if test="normalize-space(./title) != ''">
			<h3>
				<xsl:choose>
					<xsl:when test="normalize-space(./number) != ''">
						<span class="badge pull-left"><xsl:value-of select="normalize-space(./number)" /> </span>
						<xsl:text> </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="icon">
							<xsl:with-param name="name" select="'hand-right'"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="./title" />
			</h3>
		</xsl:if>

		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="container">
			<div class="col-offset-xs-0 col-xs-8">
				<xsl:choose>
					<xsl:when test="normalize-space(./description) = ''"></xsl:when>
					<xsl:otherwise>
						<p>
							<xsl:value-of select="./description" />
						</p>
					</xsl:otherwise>
				</xsl:choose>

				<xsl:variable name="src">
					<xsl:choose>
						<xsl:when test="normalize-space(./thumbnail) = ''"><xsl:value-of select="./url" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="./thumbnail" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:choose>
					<xsl:when test="$image.click = '1'">
						<xsl:choose>
							<xsl:when test="normalize-space(./url) = ''"></xsl:when>
							<xsl:otherwise>
								<a
									href="{$image_url}{./url}"
									title="{./title}"
								>
									<img
										src="{$image_url}{$src}"
										alt="{./title}"
									 />
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="normalize-space(./url) = ''"></xsl:when>
							<xsl:otherwise>
								<img
									src="{$image_url}{$src}"
									alt="{./title}"
								 />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>

				<xsl:text> </xsl:text>
			</div>
		</div>

		<xsl:for-each select="./value">
			<div class="col-offset-xs-0 col-xs-8">
				<xsl:call-template name="icon">
					<xsl:with-param name="name" select="'arrow-right'"/>
				</xsl:call-template>

				<xsl:apply-templates select="." />
			</div>
		</xsl:for-each>

		<xsl:for-each select="./*">
			<xsl:choose>
				<xsl:when test="name() = 'number'"> </xsl:when>
				<xsl:when test="name() = 'title'"> </xsl:when>
				<xsl:when test="name() = 'url'"> </xsl:when>
				<xsl:when test="name() = 'value'"> </xsl:when>
				<xsl:when test="name() = 'description'"> </xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="." />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

		<!--xsl:for-each select="./text">
			<div class="col-offset-xs-0 col-xs-8">
				<xsl:apply-templates select="." />
			</div>
		</xsl:for-each-->
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メディア -->
	<xsl:template match="point">
		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="row">
			<div class="col-xs-6">
				<p class="text-center">
					<xsl:choose>
						<xsl:when test="normalize-space(./@right) = ''">
							<img
								class="text-center"
								src="{$image_url}{./url}"
								alt="{./title}"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="point_body">
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</p>
			</div>
			<div class="col-xs-6">
				<p class="text-center">
					<xsl:choose>
						<xsl:when test="normalize-space(./@right) = ''">
							<xsl:call-template name="point_body">
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<img
								class="text-center"
								src="{$image_url}{./url}"
								alt="{./title}"
							/>
						</xsl:otherwise>
					</xsl:choose>
				</p>
			</div>
		</div>

		<br />
		<hr />
	</xsl:template>

	<xsl:template name="point_body">
		<h2><xsl:value-of select="./title" /></h2>
		<xsl:choose>
			<xsl:when test="normalize-space(./description) = ''"></xsl:when>
			<xsl:otherwise>
				<h4>
					<xsl:value-of select="./description" />
				</h4>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:for-each select="./value">
			<p>
				<xsl:call-template name="icon">
					<xsl:with-param name="name" select="'chevron-right'"/>
				</xsl:call-template>
				<xsl:apply-templates select="." />
			</p>
		</xsl:for-each>

		<xsl:for-each select="./text">
				<xsl:apply-templates select="." />
		</xsl:for-each>

		<xsl:for-each select="./map">
			<p>
				<xsl:apply-templates select="." />
			</p>
		</xsl:for-each>

		<xsl:for-each select="./site">
			<p>
				<xsl:apply-templates select="." />
			</p>
		</xsl:for-each>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 パネル -->
	<xsl:template match="panel">
		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="image_link">
			<xsl:choose>
				<xsl:when test="normalize-space(./link) != ''"><xsl:value-of select="normalize-space(./link)" /></xsl:when>
				<xsl:when test="$image.click = '1'"><xsl:value-of select="$image_url" /><xsl:value-of select="normalize-space(./url)" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="normalize-space($image_link) = ''">
				<img
					src="{$image_url}{./url}"
					alt="{./title}"
				 />
			</xsl:when>
			<xsl:otherwise>
				<a
					href="{$image_link}"
					title="{./title}"
				>
					<img
						src="{$image_url}{./url}"
						alt="{./title}"
					 />
				</a>
			</xsl:otherwise>
		</xsl:choose>

		<h3>
			<xsl:value-of select="normalize-space(./title)" />
		</h3>

		<xsl:for-each select="./*">
			<xsl:choose>
				<xsl:when test="name() = 'title'"> </xsl:when>
				<xsl:when test="name() = 'url'"> </xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="." />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メディア -->
	<xsl:template match="media">
		<xsl:variable name="pull">
			<xsl:choose>
				<xsl:when test="normalize-space(./@right) = ''">pull-left</xsl:when>
				<xsl:otherwise>pull-right</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="mark">
			<xsl:choose>
				<xsl:when test="normalize-space(./number) = ''"><xsl:text> </xsl:text></xsl:when>
				<xsl:otherwise><xsl:value-of select="normalize-space(./number)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="image_url">
			<xsl:choose>
				<xsl:when test="$image.dir != ''"><xsl:value-of select="$html.dir" /><xsl:value-of select="$image.dir" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="src">
			<xsl:choose>
				<xsl:when test="normalize-space(./thumbnail) = ''"><xsl:value-of select="./url" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="./thumbnail" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="row">
			<div class="col-xs-10">
				<div class="media">
					<xsl:choose>
						<xsl:when test="$image.click = '1'">
							<xsl:choose>
								<xsl:when test="normalize-space(./url) = ''"></xsl:when>
								<xsl:otherwise>
									<a
										class="{$pull}"
										href="{$image_url}{./url}"
										title="{./title}"
									>
										<img
											class="media-object"
											src="{$image_url}{$src}"
											alt="{./title}"
										 />
									</a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="normalize-space(./url) = ''"></xsl:when>
								<xsl:otherwise>
									<a
										class="{$pull}"
										title="{./title}"
									>
										<img
											class="media-object"
											src="{$image_url}{$src}"
											alt="{./title}"
										 />
									</a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>

					<div class="media-body">
						<h4 class="media-heading">
							<xsl:choose>
								<xsl:when test="normalize-space($mark) = ' '">
									<span class="badge pull-left"><xsl:value-of select="$mark" /><xsl:text> </xsl:text></span>
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="./title" />
						</h4>

						<xsl:choose>
							<xsl:when test="normalize-space(./description) = ''"></xsl:when>
							<xsl:otherwise>
								<p>
									<xsl:value-of select="./description" />
								</p>
							</xsl:otherwise>
						</xsl:choose>

						<xsl:for-each select="./value">
							<p>
								<xsl:call-template name="icon">
									<xsl:with-param name="name" select="'chevron-right'"/>
								</xsl:call-template>
								<xsl:apply-templates select="." />
							</p>
						</xsl:for-each>

						<xsl:for-each select="./*">
							<xsl:choose>
								<xsl:when test="name() = 'title'"> </xsl:when>
								<xsl:when test="name() = 'date'"> </xsl:when>
								<xsl:when test="name() = 'description'"> </xsl:when>
								<xsl:when test="name() = 'links'"> </xsl:when>
								<xsl:when test="name() = 'terms'"> </xsl:when>
								<xsl:when test="name() = 'value'"> </xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="." />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>

		<hr />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 イメージ -->
	<xsl:template match="image">
		<div class="col-xs-11">
			<xsl:choose>
				<xsl:when test="normalize-space(./title) = ''"></xsl:when>
				<xsl:otherwise>
					<h4>
						<xsl:call-template name="icon">
							<xsl:with-param name="name" select="'picture'"/>
						</xsl:call-template>
						<xsl:value-of select="./title" />
					</h4>
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

			<br />
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 サムネイル -->
	<xsl:template match="thumbnails">
		<xsl:choose>
			<xsl:when test="normalize-space(./title) = ''"></xsl:when>
			<xsl:otherwise>
				<h3>
					<xsl:call-template name="icon">
						<xsl:with-param name="name" select="'picture'"/>
					</xsl:call-template>
					<xsl:value-of select="./title" />
				</h3>
			</xsl:otherwise>
		</xsl:choose>

		<div class="row">
			<xsl:for-each select="./thumbnail">
				<div class="col-xs-3">
					<xsl:call-template name="urlimage">
						<xsl:with-param name="title" select="normalize-space(./title)" />
						<xsl:with-param name="showurl" select="0" />
						<xsl:with-param name="url" select="normalize-space(./url)" />
						<xsl:with-param name="link" select="normalize-space(./link)" />
						<xsl:with-param name="thumbnail" select="normalize-space(./thumbnail)" />
						<xsl:with-param name="size" select="normalize-space(./size)" />
					</xsl:call-template>
				</div>
			</xsl:for-each>
		</div>

		<br />
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 GoogleMap -->
	<xsl:template match="googlemap">
		 <iframe src="{./url}" width="{./width}" height="{./height}" frameborder="0" style="border:0"><xsl:text> </xsl:text></iframe>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 セパレータ -->
	<xsl:template match="separator">
		<div class="col-xs-12">
			<hr />
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 改行 -->
	<xsl:template match="newline">
		<div class="col-xs-12">
			<br />
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 コード -->
	<xsl:template match="code">
		<div class="col-xs-12">
			<xsl:call-template name="code">
				<xsl:with-param name="code" select="./text()"/>
			</xsl:call-template>
		</div>
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
			<xsl:with-param name="title" select="./title" />
			<xsl:with-param name="text" select="./text"/>
			<xsl:with-param name="css" select="'success'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メモ -->
	<xsl:template match="memo">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="'メモ'" />
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="'info'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 注意 -->
	<xsl:template match="warn">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="'注意'"/>
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="'warning'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 警告 -->
	<xsl:template match="alert">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="'警告'"/>
			<xsl:with-param name="text" select="./text()"/>
			<xsl:with-param name="css" select="'danger'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 トピック -->
	<xsl:template match="topic">
		<xsl:call-template name="uiboxtext">
			<xsl:with-param name="title" select="./title" />
			<xsl:with-param name="text" select="./text"/>
			<xsl:with-param name="css" select="'success'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 Site -->
	<xsl:template match="site">
		<h4>
			<xsl:call-template name="icon">
				<xsl:with-param name="name" select="'flag'"/>
			</xsl:call-template>
			<xsl:value-of select="normalize-space(./title)" />
		</h4>

		<div class="col-xs-offset-0 col-xs-12">
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
				<div class="col-xs-offset-0 col-xs-12">
					<xsl:call-template name="uitext">
						<xsl:with-param name="text" select="./text"/>
						<xsl:with-param name="type" select="'p'"/>
					</xsl:call-template>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 問い -->
	<xsl:template match="question">
		<xsl:variable name="number" select="normalize-space(./@number)" />
		<xsl:variable name="name" select="normalize-space(./name)" />

		<div class="panel panel-default">
			<div class="panel-heading">
				<xsl:call-template name="icon">
					<xsl:with-param name="name" select="'question-sign'"/>
				</xsl:call-template>
				<xsl:value-of select="normalize-space($number)" />
				.
				<xsl:value-of select="normalize-space(./title)" />
			</div>

			<div class="panel-body">
				<xsl:value-of select="normalize-space(./text)" />
			</div>

			<div class="panel-footer">
				<div class="form-group">
					<label for="{$name}_{$number}" class="{$name}_{$number} control-label col-xs-1">回答</label>
					<div class="controls col-xs-10">
						<div class="btn-group" data-toggle="buttons">
							<xsl:for-each select="./select">
								<button
									name="{$name}_{$number}"
									id="{$name}_{$number}{./@key}"
									class="{$name}_{$number} btn btn-default"
									onclick="mikan.form.event.select_radio('{$name}_{$number}','{$name}_{$number}{./@key}','{./@key}. {./text()}'); "
								>
									<span class="glyphicon glyphicon-unchecked"><xsl:text> </xsl:text></span>
									<xsl:value-of select="./@key" />.
									<xsl:value-of select="./text()" />
								</button>
							</xsl:for-each>
						</div>
					</div>
				</div>

				<br />
			</div>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 問い -->
	<xsl:template match="questions">
		<xsl:variable name="name" select="normalize-space(./name)" />
		<form name="{./name}">
			<div class="col-xs-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<xsl:call-template name="icon">
							<xsl:with-param name="name" select="'question-sign'"/>
						</xsl:call-template>
						<xsl:value-of select="normalize-space(./number)" />
						.
						<xsl:value-of select="normalize-space(./title)" />
					</div>

					<table class="table table-striped table-bordered">
						<tbody>
							<xsl:for-each select="/sxmlbook/item/question">
								<xsl:choose>
									<xsl:when test="normalize-space(./name) = $name">
										<tr>
											<th>
												<xsl:value-of select="normalize-space(./@number)" />.
												<xsl:value-of select="normalize-space(./title)" />
											</th>
											<td>
												<input type="text" name="{./@number}" id="{./name}_{./@number}" readonly="True" value="" />
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</div>

			<xsl:choose>
				<xsl:when test="normalize-space(./ok) != ''">
					<button
						class="{$name} btn btn-default"
						onclick="{./ok}('{$name}'); "
					>
						<span class="glyphicon glyphicon-ok"><xsl:text> </xsl:text></span> 回答
					</button>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</form>
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
					href="{$h}"
					title="{$title}"
				>
					<img
						src="{$image_url}{$src}"
						alt="{$title}"
					  />
				</a>
			</xsl:when>
			<xsl:otherwise>
				<img
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

		<div class="col-xs-10">
			<a
				target="{$t}"
				href="{$url}"
			>
				<xsl:value-of select="$text" />
			</a>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 リンク -->
	<xsl:template match="link">
		<xsl:variable name="i" select="normalize-space(./text())" />

		<xsl:choose>
			<xsl:when test="normalize-space(../../item/@id) != ''">
				<div class="container">
					<div class="col-xs-10">
						<xsl:call-template name="index_a">
							<xsl:with-param name="id" select="$i" />
							<xsl:with-param name="class" select="''" />
							<xsl:with-param name="num" select="''" />
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="index_a">
					<xsl:with-param name="id" select="$i" />
					<xsl:with-param name="class" select="''" />
					<xsl:with-param name="num" select="''" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 内容 メール -->
	<xsl:template match="mail">

		<xsl:choose>
			<xsl:when test="normalize-space(../../item/@id) != ''">
				<div class="container">
					<div class="col-xs-10">
						<a
							target="_TOP"
							onclick="location.href = 'mai' + 'lto:'+ '{normalize-space(./account)}' + '&#64;' + '{normalize-space(./domain)}';"
						>
							<xsl:value-of select="normalize-space(./account)" />の<xsl:value-of select="normalize-space(./domain)" />
						</a>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<a
					target="_TOP"
					onclick="location.href = 'mai' + 'lto:'+ '{normalize-space(./account)}' + '&#64;' + '{normalize-space(./domain)}';"
				>
					<xsl:value-of select="normalize-space(./account)" />の<xsl:value-of select="normalize-space(./domain)" />
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- ボックステキスト -->
	<xsl:template name="uiboxtext">
		<xsl:param name="title" select="''" />
		<xsl:param name="text" select="''" />
		<xsl:param name="css" select="''" />

		<div class="panel panel-{$css}">
			<div class="panel-heading">
				<h3 class="panel-title">
					<xsl:call-template name="icon">
						<xsl:with-param name="name" select="'info-sign'"/>
					</xsl:call-template>
					<xsl:value-of select="$title" />
				</h3>
			</div>

			<div class="panel-body">
				<xsl:call-template name="uitext">
					<xsl:with-param name="text" select="$text"/>
					<xsl:with-param name="type" select="'p'"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- テキスト -->
	<xsl:template name="uitext">
		<xsl:param name="type" select="'p'" />
		<xsl:param name="mark" select="''" />
		<xsl:param name="text" select="''" />
		<xsl:param name="css" select="''" />

		<xsl:variable name="t">
			<xsl:choose>
				<xsl:when test="$type = ''">p</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$type" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:element name="{$t}">
			<xsl:choose>
				<xsl:when test="$mark = ''">
						<xsl:value-of select="$text" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="icon">
						<xsl:with-param name="name" select="$mark"/>
						<xsl:with-param name="type" select="$css"/>
					</xsl:call-template>
					<xsl:value-of select="$text" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element> 
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- アイコン -->
	<xsl:template name="icon">
		<xsl:param name="name" select="'flag'" />
		<xsl:param name="type" select="'glyphicon'" />

		<xsl:variable name="t1">
			<xsl:choose>
				<xsl:when test="$type = 'mdfi'"> </xsl:when>
				<xsl:when test="$type = ''">glyphicon </xsl:when>
				<xsl:otherwise><xsl:value-of select="$type" /><xsl:text> </xsl:text></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="t2">
			<xsl:choose>
				<xsl:when test="$type = ''">glyphicon-</xsl:when>
				<xsl:when test="$type = 'mdfi'"> </xsl:when>
				<xsl:otherwise><xsl:value-of select="$type" />-</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<span class="{$t1}{$t2}{$name} {$icon.class}"><xsl:text> </xsl:text></span><xsl:text> </xsl:text>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- リンクリスト -->
	<xsl:template name="linklist">
		<xsl:param name="target" select="''" />
		<xsl:param name="id" select="''" />
		<xsl:param name="title" select="'関連'" />
		<xsl:variable name="f" select="$target/id" />

		<xsl:if test="not(count($target) = '0')">
			<div class="container">
				<div class="col-xs-12">
					<xsl:call-template name="uitext">
						<xsl:with-param name="type" select="'h4'"/>
						<xsl:with-param name="mark" select="'forward'"/>
						<xsl:with-param name="text" select="$title"/>
					</xsl:call-template>

					<xsl:for-each select="$f">
						<div class="container">
							<xsl:variable name="i" select="normalize-space(./text())" />

							<xsl:call-template name="index_a">
								<xsl:with-param name="id" select="$i" />
								<xsl:with-param name="class" select="''" />
								<xsl:with-param name="num" select="''" />
							</xsl:call-template>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- コード -->
	<xsl:template name="code">
		<xsl:param name="code" select="''" />

		<pre>
			<code class="html">
				<xsl:value-of select="$code" />
			</code>
		</pre>
	</xsl:template>
</xsl:stylesheet>
