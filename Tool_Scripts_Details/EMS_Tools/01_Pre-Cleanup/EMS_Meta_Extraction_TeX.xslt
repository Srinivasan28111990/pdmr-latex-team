<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" indent="no"/>
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

<xsl:template match="front"><xsl:text>\documentclass{article}

\usepackage[
journal=,
mode = work,
%openaccess,
lang = american,
paper = default,
]{ems-journal}

%\usepackage{refcheck}
\usepackage{showframe}	
\usepackage{query}	

\allowdisplaybreaks[2]

\begin{document}
\editflow{</xsl:text><xsl:value-of select="article-meta/article-id[@pub-id-type='editflow']"/><xsl:text>}
\firstpage{5555}
\doinumber{}
%\volume{?}
%\issue{?}
%\volumeyear{?}
\copyrightyear{</xsl:text><xsl:value-of select="year-from-date(fn:current-date())"/><xsl:text>}

\received{</xsl:text><xsl:value-of select="article-meta/history/date[@date-type='submitted']/day"/><xsl:text> </xsl:text><xsl:value-of select="article-meta/history/date[@date-type='submitted']/month"/><xsl:text> </xsl:text><xsl:value-of select="article-meta/history/date[@date-type='submitted']/year"/><xsl:text>}
\revised{</xsl:text><xsl:value-of select="article-meta/history/date[@date-type='revised']/day"/><xsl:text> </xsl:text><xsl:value-of select="article-meta/history/date[@date-type='revised']/month"/><xsl:text> </xsl:text><xsl:value-of select="article-meta/history/date[@date-type='revised']/year"/><xsl:text>}
\accepted{</xsl:text><xsl:value-of select="article-meta/history/date[@date-type='decision']/day"/><xsl:text> </xsl:text><xsl:value-of select="article-meta/history/date[@date-type='decision']/month"/><xsl:text> </xsl:text><xsl:value-of select="article-meta/history/date[@date-type='decision']/year"/><xsl:text>}

\title{}

</xsl:text>
<xsl:for-each select="article-meta/contrib-group[position()=1]/contrib">
<xsl:text>\emsauthor{}{
	\givenname{}
	\surname{}
	\mrid{</xsl:text><xsl:value-of select="contrib-id[@contrib-id-type='mr-author-id']"/><xsl:text>}
	\zblid{}
	\orcid{</xsl:text><xsl:value-of select="contrib-id[@contrib-id-type='orcid']"/><xsl:text>}}{}

\Emsaffil{}{
	\department{}
	\organisation{}
    \address{}
	\rorid{}
	\zip{}
	\city{}
	\country{}
	\affemail{}
}

</xsl:text>
</xsl:for-each>

<xsl:text>\classification[</xsl:text>
<xsl:for-each select="article-meta/article-categories/subj-group[position()=2]/subject">
	<xsl:if test="position()=last()">
		<xsl:value-of select="."/>
	</xsl:if>
	<xsl:if test="not(position()=last())">
		<xsl:value-of select="."/><xsl:text>, </xsl:text>
	</xsl:if>
</xsl:for-each>
<xsl:text>]{</xsl:text>
<xsl:for-each select="article-meta/article-categories/subj-group[position()=1]/subject">
	<xsl:if test="position()=last()">
		<xsl:value-of select="."/>
	</xsl:if>
	<xsl:if test="not(position()=last())">
		<xsl:value-of select="."/><xsl:text>, </xsl:text>
	</xsl:if>
</xsl:for-each>
<xsl:text>}

\keywords{}

\begin{abstract}

\end{abstract}

\maketitle
</xsl:text>
</xsl:template>

</xsl:stylesheet>
