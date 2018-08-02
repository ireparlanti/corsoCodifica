<?xml version="1.0"?>
<!-- sum2.xsl -->
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:variable name="seq1" select="(3, 5, 18)"/>
    <xsl:variable name="seq2" select="(3, 5, 48.273, 2.9e3)"/>

    <xsl:variable name="value1" as="xs:integer" select="42"/>
    <xsl:variable name="value2" as="xs:double" select="2718.28E-3"/>
    <xsl:variable name="value3" as="xs:float" select="98.6"/>
    <xsl:variable name="value4" as="xs:decimal" select="2.54"/>
    <xsl:variable name="seq3" 
      select="($value1, $value2, $value3, $value4)"/>

    <xsl:variable name="seq4" 
      select="(xs:yearMonthDuration('P3Y8M'), 
              xs:yearMonthDuration('P4Y2M'), 
              xs:yearMonthDuration('P6Y4M'))"/>
    <xsl:variable name="seq5"
      select="(xs:dayTimeDuration('P2DT4H23M12.2S'),
              xs:dayTimeDuration('P3DT8H17M'),
              xs:dayTimeDuration('P3D'))"/>

    <xsl:text>Here are some tests of the sum() function:&#xA;</xsl:text>

    <xsl:text>&#xA;  sum(</xsl:text>
    <xsl:value-of select="$seq1" separator=", "/>
    <xsl:text>) = </xsl:text>
    <xsl:value-of select="format-number(sum($seq1), '#.###')"/>

    <xsl:text>&#xA;&#xA;  sum(</xsl:text>
    <xsl:value-of select="$seq2" separator=", "/>
    <xsl:text>) = </xsl:text>
    <xsl:value-of select="format-number(sum($seq2), '#.###')"/>

    <xsl:text>&#xA;&#xA;  sum(</xsl:text>
    <xsl:value-of select="$seq3" separator=", "/>
    <xsl:text>) = </xsl:text>
    <xsl:value-of select="format-number(sum($seq3), '#.###')"/>

    <xsl:text>&#xA;&#xA;  sum(</xsl:text>
    <xsl:value-of select="$seq4" separator=", "/>
    <xsl:text>) = </xsl:text>
    <xsl:value-of select="sum($seq4)"/>

    <xsl:text>&#xA;&#xA;    In text, the sum of</xsl:text> 
    <xsl:for-each select="$seq4">
      <xsl:text>&#xA;      </xsl:text>
      <xsl:value-of select="years-from-duration(.)"/>
      <xsl:text> years and </xsl:text>
      <xsl:value-of select="months-from-duration(.)"/>
      <xsl:text> months (</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>)</xsl:text>
    </xsl:for-each>

    <xsl:text>&#xA;    is </xsl:text>
    <xsl:value-of select="years-from-duration(sum($seq4))"/>
    <xsl:text> years and </xsl:text>
    <xsl:value-of select="months-from-duration(sum($seq4))"/>
    <xsl:text> months (</xsl:text>
    <xsl:value-of select="sum($seq4)"/>
    <xsl:text>).</xsl:text>

    <xsl:text>&#xA;&#xA;  sum(</xsl:text>
    <xsl:value-of select="$seq5" separator=", "/>
    <xsl:text>) = </xsl:text>
    <xsl:variable name="sum5" select="sum($seq5)"/>
    <xsl:value-of select="$sum5"/>

    <xsl:text>&#xA;&#xA;    In text, the sum of</xsl:text>
    <xsl:for-each select="$seq5">
      <xsl:text>&#xA;      </xsl:text>
      <xsl:value-of select="days-from-duration(.)"/>
      <xsl:text> days, </xsl:text>
      <xsl:value-of select="hours-from-duration(.)"/>
      <xsl:text> hours, </xsl:text>
      <xsl:value-of select="minutes-from-duration(.)"/>
      <xsl:text> minutes and </xsl:text>
      <xsl:value-of 
        select="format-number(seconds-from-duration(.), '#.##')"/>
      <xsl:text> seconds (</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>)</xsl:text>
    </xsl:for-each>

    <xsl:text>&#xA;    is </xsl:text>
    <xsl:value-of select="days-from-duration($sum5)"/>
    <xsl:text> days, </xsl:text>
    <xsl:value-of select="hours-from-duration($sum5)"/>
    <xsl:text> hours, </xsl:text>
    <xsl:value-of select="minutes-from-duration($sum5)"/>
    <xsl:text> minutes and </xsl:text>
    <xsl:value-of 
      select="format-number(seconds-from-duration($sum5), '#.##')"/>
    <xsl:text> seconds.</xsl:text>

    <xsl:text>&#xA;&#xA;  sum(()) = </xsl:text>
    <xsl:value-of select="sum(())"/>

    <xsl:text>&#xA;&#xA;  sum((), 'Not applicable') = </xsl:text>
    <xsl:value-of select="sum((), 'Not applicable')"/>

    <xsl:text>&#xA;&#xA;  sum((3, -3), 'Not applicable') = </xsl:text>
    <xsl:value-of select="sum((3, -3), 'Not applicable')"/>
    
  </xsl:template>

</xsl:stylesheet>
