<?xml version="1.0" encoding="UTF-8"?>
<!--
 ============================================================
  SimpleDoc to XSL-FO Stylesheet
 ============================================================
  File Name : article.xsl
 ============================================================
  Copyright (c) 2003-2007 Antenna House, Inc. All rights reserved.
  Antenna House is a trademark of Antenna House, Inc.
  URL    : http://www.antennahouse.com/
  E-mail : info@antennahouse.com
 ============================================================
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions">
  <!-- Article mode -->
  <xsl:template match="doc[@class='article']">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master margin="30mm 25mm 20mm 25mm" master-name="PageMaster-Article-Rest">
          <xsl:attribute name="page-height">
            <xsl:value-of select="$paper-height-default"/>
          </xsl:attribute>
          <xsl:attribute name="page-width">
            <xsl:value-of select="$paper-width-default"/>
          </xsl:attribute>
          <fo:region-body margin="0mm 0mm 10mm 0mm"/>
          <fo:region-after extent="10mm" display-align="center"/>
        </fo:simple-page-master>
        <fo:simple-page-master margin="30mm 25mm 20mm 25mm" master-name="PageMaster-Article-Last">
          <xsl:attribute name="page-height">
            <xsl:value-of select="$paper-height-default"/>
          </xsl:attribute>
          <xsl:attribute name="page-width">
            <xsl:value-of select="$paper-width-default"/>
          </xsl:attribute>
          <fo:region-body margin="0mm 0mm 10mm 0mm"/>
          <fo:region-after region-name="last-footer" extent="10mm" display-align="center"/>
        </fo:simple-page-master>
        <fo:page-sequence-master master-name="PageMaster-Article">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference page-position="first" master-reference="PageMaster-Article-Rest"/>
            <fo:conditional-page-master-reference page-position="rest" master-reference="PageMaster-Article-Rest"/>
            <fo:conditional-page-master-reference page-position="last" master-reference="PageMaster-Article-Last"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>
      <!-- Head and body flow to same page-sequence. -->
      <fo:page-sequence master-reference="PageMaster-Article">
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center" font-size="small"> - <fo:page-number/> - </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="last-footer">
          <fo:block text-align="center" font-size="small"> - <fo:page-number/> -E </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <xsl:apply-templates select="head" mode="article"/>
          <xsl:apply-templates select="body" mode="article"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="doc/head" mode="article">
    <fo:block>
      <xsl:apply-templates select="/doc/head/title[not(@lang='en')]" mode="article.ja"/>
      <xsl:apply-templates select="/doc/head/author[not(@lang='en')]" mode="article.ja"/>
      <xsl:apply-templates select="/doc/head/position[not(@lang='en')]" mode="article.ja"/>
      <xsl:apply-templates select="/doc/head/abstract[not(@lang='en')]" mode="article.ja"/>
    </fo:block>
    <fo:block space-before="2em">
      <xsl:apply-templates select="/doc/head/title[@lang='en']" mode="article.en"/>
      <xsl:apply-templates select="/doc/head/author[@lang='en']" mode="article.en"/>
      <xsl:apply-templates select="/doc/head/position[@lang='en']" mode="article.en"/>
      <xsl:apply-templates select="/doc/head/abstract[@lang='en']" mode="article.en"/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/title" mode="article.ja">
    <fo:block xsl:use-attribute-sets="article.title.ja">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/title" mode="article.en">
    <fo:block xsl:use-attribute-sets="article.title.en">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/author" mode="article.ja">
    <fo:block xsl:use-attribute-sets="article.author.ja">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/author" mode="article.en">
    <fo:block xsl:use-attribute-sets="article.author.en">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/position" mode="article.ja">
    <fo:block xsl:use-attribute-sets="article.author.ja">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/position" mode="article.en">
    <fo:block xsl:use-attribute-sets="article.author.ja">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/abstract" mode="article.ja">
    <fo:block xsl:use-attribute-sets="article.abstract.ja">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="doc/head/abstract" mode="article.en">
    <fo:block xsl:use-attribute-sets="article.abstract.en">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="body" mode="article">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
</xsl:stylesheet>
