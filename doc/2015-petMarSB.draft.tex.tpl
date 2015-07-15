%% BioMed_Central_Tex_Template_v1.06
%%                                      %
%  bmc_article.tex            ver: 1.06 %
%                                       %

%% For instructions on how to fill out this Tex template           %%
%% document please refer to Readme.html and the instructions for   %%
%% authors page on the biomed central website                      %%
%% http://www.biomedcentral.com/info/authors/                      %%

%%% additional documentclass options:
%  [doublespacing]
%  [linenumbers]   - put the line numbers on margins

<%
import json
import pandas as pd
with open('petmar-cross-validate.results.json') as fp:
    data = json.load(fp)
%>

%\documentclass[twocolumn]{bmcart}% uncomment this for twocolumn layout and comment line below
\documentclass{article}

%%% Load packages
\usepackage{amsthm,amsmath}
\usepackage{graphicx}
\RequirePackage{natbib}
\RequirePackage{hyperref}
\usepackage[utf8]{inputenc} %unicode support
%\usepackage[applemac]{inputenc} %applemac support if unicode package fails
%\usepackage[latin1]{inputenc} %UNIX support if unicode package fails

%\def\includegraphic{}
%\def\includegraphics{}

\title{Many-Sample de Novo Assembly and Analysis of Petromyzon marinus Transcriptome}

\author{
    Scott, Camille\\
    \texttt{camille.scott.w@gmail.com}   % email address
    \and
    Brown, C. Titus\\
    \texttt{ctbrown@ucdavis.edu}
}

%%% Begin ...
\begin{document}
\maketitle

\section*{Background}

Some biological background on sea lamprey, and why we care about them: ancestral jawed vertebrate, invasive species interest, regenerative capabilities, programmed genome rearrangement (PGR). This drives interest in a complete sea lamprey transcriptomic reference. [Cite: lamprey genome paper, more provided by weiming]

Background on NGS / RNAseq tech enabling deep mRNA sequencing. Lack of a complete reference due to PGR necessitates de novo assembly. De novo projects challenging because of difficulty in validation, data volume, data integrity. [Cite: ...]

Reproducibility crisis: many methods for pre-processing, assembly, and post-processing, but many difficult to replicate. Lack of documented tools, versions, parameters, source code for scripts. Demonstration of effective reproducible pipelines from start to finish. [Cite: assemblathon, mr-c, ...]

Goal: deeply characterize the sea lamprey transcriptome; produce a valuable resource for researchers; demonstrate efficacy of de novo approach for many-sample data; show open, reproducible pipelines.

\section*{Data Description}

Section should include information on sea lamprey sample prep where available, table of sample descriptions including read lengths, insert sizes, sequencing technology, tissue type, and conditions. Also includes accessions.

[Table 1, samples]

\section*{Analyses}

\subsection*{Assembly}

%The assembly was produced using the Trinity assembler \cite{haas_novo_2013} after pre-processing with an in-house pipeline, described further in the methods.

%Go over assembly metrics. [Cite: assessing denovo trans metrics]. Metrics to include are transcript count, percent reads mapping [Sup. Table, perc reads per sample], number ORFs, transcripts mapping to genome, transcripts annotated, transcripts mapping to genome but not annotated, average unigene OHR \cite{t_oneil_assessing_2013}, accuracy, contiguity, and completeness \cite{martin_next-generation_2011}.

%Discuss annotation: use of trinotate, blast databases, recipricol best-hits \citep{moreno-hagelsieb_choosing_2008}. 

We find <% print '{}'.format(data['lamp10_prop']) %> of annotations to be covered by a transcript from lamp10. When we break this down by feature, we find that the the proportion is brought down by features of types transcript and gene, both of which include introns.

<< echo=False results='tex'>>=
print pd.DataFrame(data['feature_props']).to_latex()
@

 while 73%[dubious] of transcripts cover an annotation. Futher, []% of the genome is covered by annotations, while [%] is covered by alignments from lamp10; []% of transcripts have any alignment to the genome.

We also find that []% of transcript alignments entirely contain an annotation, increasing the annotation size by [blah]%. []% of extensions are supported by homology to a known protein. []% of transcipt alignments are entirely contained by an annotation.


\subsection*{Pooled Assembly Discovers Novel Transcripts}

\subsection*{Many-Sample Comparison}

Include heatmaps, bar charts of unique gene content.

\section*{Discussion}

\section*{Methods}

%We consider the assembly approach divisible into three logical stages: pre-processing, assembling, and post-processing. Here we describe each in detail. All scripts are available at github.com/camillescott/2013-lamprey and github.com/camillescott/peasoup. We have found that the commonly used GNU make becomes unwieldy with many input samples and complex processing steps; thus, we have opted to implement our pipelines using pydoit \cite{pydoit}, an automation tool written in python.

In order to assess the completeness of our de Novo transcriptome assembly (lamp10), we have compared the alignment of the generated transcripts against the existing genome annotations released with Pmarinus v7.0.75. First, we use blastn to align transcripts to the genome, using parameters `-evalue 1e-6`. Then, we use the coordinates from the annotation and the corresponding coordinates from the alignments to calculate the proportion of annotated sequence overlapped, proportion of transcripts overlapped, and the respective proportions of non-overlapped sequence and transcripts. We consider an annotated region to be overlapped by a trancript if it is at least 90% covered, with at least 98% identity [TODO: get better justification for these cutoffs other than "things Camille remembers reading"].

We give particular attention to alignments which entirely contain annotated regions, as these suggest extensions to existing annotations. When these alignments are from transcripts with homology evidence from other species, we consider them to represent putative extensions [note: maybe not necessary to establish validity, instead just report the numbers]. Further, alignments which are entirely contained within an annotation suggest either an overly aggressive prediction in the genome, or an incompletely assembled transcript. 



\subsection*{Pre-processing}

%Prior to assembly, reads need to be filtered for quality, length, and adapter sequence. In order to facilitate assembly of large data, further pre-processing is required to reduce data redundancy.

\subsection*{Trinity Assembly}

\subsection*{Post-processing}

% if your bibliography is in bibtex format, use those commands:
\bibliographystyle{bmc-mathphys} % Style BST file
\bibliography{2015-petMarSB}      % Bibliography file (usually '*.bib' )

% or include bibliography directly:
% \begin{thebibliography}
% \bibitem{b1}
% \end{thebibliography}

\end{document}
