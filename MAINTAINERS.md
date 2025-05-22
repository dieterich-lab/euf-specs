## Specification maintainers

The development of the bedRMod format is supported by the [Human RNome Project](https://humanrnomeproject.org) and currently financially
enabled by the [Transregio 319 RMaP](https://www.trr319-rmap.de). The latest specification has been developed jointly with the [modkit](https://github.com/nanoporetech/modkit) contributors at Oxford Nanopore Technologies. Current maintainers are listed below.

### bedRMod

* Etienne Boileau (@eboileau)


## Updating the specifications

We aim to follow the same guidelines as [SAM/BAM specification maintainers guidelines](https://github.com/samtools/hts-specs/blob/master/MAINTAINERS.md), consult this documentation for details.

## Generating PDF specification documents

1. Edit _bedRModv2.tex_, and type `make new/bedRModv2.pdf` to generate a working PDF to preview your work. This is typically done in a separate branch.

2. When you are ready, commit your _.tex_ source changes (but don't commit any changed PDF files yet). Open a pull request.

3. Type `make clean bedRModv2.pdf` to regenerate the PDF and copy it to the main directory. Optionally, verify that it contains the correct commit hash for your source changes. (Be sure to build the PDF using the commits on **master**; building the final PDF from a pull request is not recommended as its commits may be further rebased or otherwise amended before they appear on **master**, particularly if web UI merge buttons are used.)

4. Commit your _.pdf_ changes, separately from any source changes.

The _Makefile_ can also generate PDFs highlighting the typeset differences between TeX source versions, invoked by typing `make [OLD=commit [NEW=commit]] diff/SPEC.pdf`. By default, this compares the working _SPEC.tex_ file to the checked-out **HEAD**. Specify `OLD` to compare the working file to a different commit, or specify both `OLD` and `NEW` to show changes in _SPEC_ between two commits.

