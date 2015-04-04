<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XSLT ID                                                              -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- ID -->
	<xsl:key name="itemid" match="item" use="@id" />
	<xsl:key name="name" match="index" use="@indexid" />
	<xsl:key name="termid" match="termitem" use="@termid" />
</xsl:stylesheet>
