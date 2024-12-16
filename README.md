bedRMod and related specifications
==================================

The bedRMod format originated in the [Transregio 319 RMaP](https://www.trr319-rmap.de) to support the [Human RNome Project](https://humanrnomeproject.org), and is used as the main data format in the [Sci-ModoM](https://scimodom.dieterichlab.org/) database. 

The bedRMod format, similar to the [ENCODE bedMethyl](https://www.encodeproject.org/data-standards/wgbs) or the [extended bedMethyl](https://nanoporetech.github.io/modkit) format proposed by Oxford Nanopre Technologies, aims to formalize the representation of RNA modifications. 
This format is compatible with the BED (Browser Extensible Data) format, and most of the specifications are directly derived from the offical 
BED specifications, available under the [SAM/BAM and related specifications](http://samtools.github.io/hts-specs).

This repository provides the official specifications for the header and data sections of the bedRMod format. It is structured as the 
official [hts-specs](https://github.com/samtools/hts-specs/) repository, and some of its content is also taken from that repository.

To request improvements, changes in specifications, or to report issues, use this repository. Consult [the list of maintainers](MAINTAINERS.md) to 
contact them directly.


Discrete genomic feature data files
-----------------------------------

**[bedRModv1.8.tex]** is the official specification for the bedRMod format.


[bedRModv1.8.tex]:    https://dieterich-lab.github.io/euf-specs/bedRModv1.8.pdf
