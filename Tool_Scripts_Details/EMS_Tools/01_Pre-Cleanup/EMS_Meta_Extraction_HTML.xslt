<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<xsl:template match="node()|@*">
	<xsl:copy>
		<xsl:apply-templates select="node()|@*"/>
	</xsl:copy>
</xsl:template>

<xsl:template match="email">
    <a href="mailto:{.}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
<xsl:template match="italic">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="front">
<html>
<head>
<title>EMS Meta Extraction
</title>
<script type='text/javascript' src='http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>
<script id="MathJax-script" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>
<style>
table, th, td {
    border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}
a:visited {
  color: blue
  }
i{
   color: red;
   }
</style>
<body>
	<!-- <xsl:copy>
		<xsl:apply-templates select="node()|@*"/>
	</xsl:copy> -->
	
	<table>	
		<caption><b>journal-meta</b></caption>
		<xsl:for-each select="journal-meta/journal-id[@journal-id-type]">	
		<tr>		
			<td>journal-id-type = <xsl:value-of select="@journal-id-type"/></td>
			<td><xsl:value-of select="."/></td>
		</tr>
		</xsl:for-each>
		<tr>
			<td>journal-title</td>
			<td><xsl:value-of select="journal-meta/journal-title-group/journal-title"/></td>
		</tr>
		<tr>
			<td>abbrev-journal-title</td>
			<td><xsl:value-of select="journal-meta/journal-title-group/abbrev-journal-title"/></td>
		</tr>
		<tr>
			<td>ISSN:</td>
			<td><xsl:value-of select="journal-meta/issn"/></td>
		</tr>
		<tr>
			<td>publisher-name:</td>
			<td><xsl:value-of select="journal-meta/publisher/publisher-name"/></td>
		</tr>
	</table>
	
	<table width="100%">
	<caption><b>article-meta</b></caption>
	<xsl:for-each select="article-meta/article-id[@pub-id-type]">
		<tr>		
			<td width="10%">article-id = <xsl:value-of select="@pub-id-type"/></td>
			<td width="90%"><xsl:value-of select="."/></td>
		</tr>
	</xsl:for-each>
	<tr>
		<td><xsl:value-of select="article-meta/article-categories/subj-group[position()=1]/@subj-group-type"/></td>
		<td>
			<xsl:for-each select="article-meta/article-categories/subj-group[position()=1]/subject">
				<xsl:if test="position()=last()">
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="not(position()=last())">
					<xsl:value-of select="."/><xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</td>
	</tr>
	<tr>
		<td><xsl:value-of select="article-meta/article-categories/subj-group[position()=2]/@subj-group-type"/></td>
		<td>
			<xsl:for-each select="article-meta/article-categories/subj-group[position()=2]/subject">
				<xsl:if test="position()=last()">
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="not(position()=last())">
					<xsl:value-of select="."/><xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="yellow"><b>ARTICLE TITLE DETAIL'S</b></td>
	</tr>	
	<tr>
		<td><b>Title:</b></td>	
		<td><b><xsl:value-of select="article-meta/title-group/article-title"/></b></td>
	</tr>
	<tr>
		<td><b>Alt-title:</b></td>	
		<td><xsl:value-of select="article-meta/title-group/alt-title"/></td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="yellow"><b>ARTICLE AUTHOR'S DETAIL</b></td>
	</tr>	
	<xsl:for-each select="article-meta/contrib-group[position()=1]/contrib">
		<tr>
			<td colspan="2" bgcolor="lightblue"><b><xsl:value-of select="position()"/>: <xsl:value-of select="name-alternatives/string-name"/>
			<xsl:choose>
				<xsl:when test="@corresp='yes'">
					<xsl:text> (Correspondence)</xsl:text>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>			
			</b></td>
		</tr>
		<tr>
			<td><b>SURNAME</b></td>
			<td><xsl:value-of select="name/surname"/></td>
		</tr>
		<tr>
			<td><b>GIVEN NAME</b></td>
			<td><xsl:value-of select="name/given-names"/></td>
		</tr>
		<xsl:for-each select="contrib-id[@contrib-id-type]">
			<tr>
				<td><xsl:value-of select="@contrib-id-type"/></td>
				<td><xsl:value-of select="."/></td>
			</tr>	
		</xsl:for-each>
		<xsl:for-each select="address">
			<tr>
				<td colspan="2"><b>ADDRESS: <xsl:value-of select="position()"/></b></td>
			</tr>
			<xsl:for-each select="*">
				<tr>
					<td><xsl:value-of select="name(.)"/></td>
					<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
		<tr>
			<td>E-mail</td>
			<td><xsl:value-of select="email"/></td>
		</tr>
		<tr>
			<td>URI</td>
			<td><xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="uri"/>
					</xsl:attribute>
				<xsl:value-of select="uri"/>
				</xsl:element></td>
		</tr>
	</xsl:for-each>
	<tr>
		<td colspan="2" bgcolor="yellow"><b>ARTICLE HISTORY DETAIL</b></td>
	</tr>
	<xsl:for-each select="article-meta/history/date">
		<tr>
			<td><xsl:value-of select="@date-type"/></td>
			<td><xsl:value-of select="day"/>/<xsl:value-of select="month"/>/<xsl:value-of select="year"/></td>
		</tr>
	</xsl:for-each>
	<tr>
		<td colspan="2" bgcolor="yellow"><b>ARTICLE ABSTRACT &amp; KEYWORDS</b></td>
	</tr>
	<tr>
		<td>Abstract</td>
		<td><xsl:value-of select="article-meta/abstract"/></td>
	</tr>
	<tr>
		<td>Keywords</td>
		<td><xsl:value-of select="article-meta/kwd-group/kwd"/></td>
	</tr>
		</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>