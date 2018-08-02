<?xml version="1.0" encoding="utf-8"?>
<!-- apply-templates.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Using the mode attribute</title>
      </head>
      <body style="font-family: sans-serif;">
        <table style="text-align: center;" border="1">
          <tr style="font-weight: bold; font-size: 150%;">
            <td width="30%">Default mode</td>
            <td width="30%">Blue mode</td>
            <td width="30%">Red mode</td>
          </tr>
          <tr>
            <td>
              <p>
                <xsl:apply-templates mode="#default" 
                  select="/cars/manufacturer"/>
              </p>
            </td>
            <td>
              <p>
                <xsl:apply-templates mode="blue" 
                  select="/cars/manufacturer"/>
              </p>
            </td>
            <td>
              <p>
                <xsl:apply-templates mode="red" 
                  select="/cars/manufacturer"/>
              </p>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="manufacturer">
    <div style="color: green; font-style: italic; font-size: 125%;">
      <xsl:apply-templates select="car" mode="#current"/>
    </div>
  </xsl:template>

  <xsl:template match="manufacturer" mode="blue red">
    <div style="color: blue; font-weight: bold;">
      <xsl:apply-templates select="car" mode="#current"/>
    </div>
  </xsl:template>

  <xsl:template match="car" mode="#all">
    <xsl:value-of select="."/>
    <br/>
  </xsl:template>

  <xsl:template match="car" mode="red" priority="1">
    <div style="color: red; font-family: monospace; font-weight: bold;
                font-size: 150%;">
      <xsl:value-of select="."/>
      <br/>
    </div>
  </xsl:template>

</xsl:stylesheet>
