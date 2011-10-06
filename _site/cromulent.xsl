<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/>
  
  <xsl:variable name="font-size">12pt</xsl:variable>
  <xsl:variable name="page-width">108.0mm</xsl:variable>
  <xsl:variable name="page-height">174.5mm</xsl:variable>
  <xsl:variable name="page-margin">6.35mm</xsl:variable>


  <xsl:template match="doc">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:attribute name="font-size">
        <xsl:value-of select="$font-size"/>
      </xsl:attribute>

      <fo:layout-master-set>
        <fo:simple-page-master master-name="PageMaster-Left">
          <xsl:attribute name="page-height">
            <xsl:value-of select="$page-height"/>
          </xsl:attribute>
          <xsl:attribute name="page-width">
            <xsl:value-of select="$page-width"/>
          </xsl:attribute>
          <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>
          <xsl:attribute name="margin-left">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>
          <xsl:attribute name="margin-right">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>
          <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>

          <fo:region-body margin="0mm 0mm 0mm 0mm"/>

          <fo:region-before region-name="Left-header" extent="10mm" display-align="after"/>
          <fo:region-after region-name="Left-footer" extent="10mm" display-align="before"/>
          <fo:region-start region-name="Left-start" extent="25mm"/>
          <fo:region-end region-name="Left-end" extent="25mm"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="PageMaster-Right">
          <xsl:attribute name="page-height">
            <xsl:value-of select="$page-height"/>
          </xsl:attribute>
          <xsl:attribute name="page-width">
            <xsl:value-of select="$page-width"/>
          </xsl:attribute>
          <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>
          <xsl:attribute name="margin-left">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>
          <xsl:attribute name="margin-right">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>
          <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin"/>
          </xsl:attribute>

          <fo:region-body margin="0mm 0mm 0mm 0mm"/>
          
          <fo:region-before region-name="Right-header" extent="10mm" display-align="after"/>
          <fo:region-after region-name="Right-footer" extent="10mm" display-align="before"/>
          <fo:region-start region-name="Right-start" extent="25mm"/>
          <fo:region-end region-name="Right-end" extent="25mm"/>
        </fo:simple-page-master>

        <fo:page-sequence-master master-name="PageMaster">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="PageMaster-Left" odd-or-even="even"/>
            <fo:conditional-page-master-reference master-reference="PageMaster-Right" odd-or-even="odd"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>

      <xsl:apply-templates select="body"/>
    </fo:root>
  </xsl:template>


  <xsl:template match="body">
    <fo:page-sequence master-reference="PageMaster" initial-page-number="1">
      <fo:flow flow-name="xsl-region-body">
        <fo:block>
          <xsl:apply-templates/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <xsl:template match="intro">
    <!-- blank page at start of book -->
    <fo:block page-break-before="always">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="section">
    <fo:block page-break-before="always">
      <xsl:value-of select="title"/>
    </fo:block>

    <fo:block page-break-before="always">
      <xsl:for-each select="articles/article/title">
        <xsl:call-template name="section.toc.line"/>
      </xsl:for-each>
    </fo:block>

    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template name="section.toc.line">
    <fo:block>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="article">
    <fo:block page-break-before="left">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="article/title">
    <fo:block font-weight="bold">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="p">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="strong">
    <fo:inline font-weight="bold">
      <xsl:value-of select="."/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="em">
    <fo:inline font-style="italic">
      <xsl:value-of select="."/>
    </fo:inline>
  </xsl:template>

</xsl:stylesheet>