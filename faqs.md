---
layout: page
title: FAQs
permalink: /faqs/
---

### Frequently Asked Questions

- [What is bedRMod?](#q-what-is-bedrmod)
- [Why bedRMod?](#q-why-bedrmod)
- [How to work with bedRMod?](#q-how-to-work-with-bedrmod)
- [What tools produce bedRMod files?](#q-what-tools-produce-bedrmod-files)

#### Q: What is bedRMod?

A: The bedRMod format formalizes the [ENCODE bedMethyl](https://www.encodeproject.org/data-standards/wgbs) format to represent RNA modifications.

#### Q: Why bedRMod?

A: Because standards and guidelines are foundational to open science, data sharing, and reuse; they support sustainable, data-driven method development.

#### Q: How to work with bedRMod?

A: As you would with BED files. The bedRMod format is generally compatible with the BED format.

#### Q: What tools produce bedRMod files?

A: So far, only [modkit](https://nanoporetech.github.io/modkit/intro_pileup.html) reliably converts modBAM to bedRMod-formatted files *out of the box*. A number of tools can parse modified base tags from sequence alignments to generate BED-like files, each with its own flavor. This hampers interoperability and limits data reuse across fields. 

To use modkit, you need **v0.6.1** or higher, and your modBAM file needs a read group tag `@RG` with a description `DS` for basecalling and modification models. If you align unmapped modBAM files separately, you may have to re-header them *e.g.* using `samtools addreplacerg`. Apart from that, you are completely free to use any modBAM files. You can specify any modification or [ChEBI](https://www.ebi.ac.uk/chebi/) code, if it can't be inferred from the model names, by using the `--modomics-code` option. 

```bash
# example modkit command to generate a bedRMod file
modkit pileup --ref GRCh38_102.fa --modified-bases A:a T:17802 --mod-threshold a:0.95 --mod-threshold 17802:0.99 \
    --bedrmod --organism 9606 --assembly GRCh38 --annotation-source Ensembl --annotation-version 102 \
    --experiment "100_WT_0_IVT_RTA" --external-source "ENA:ERR12772618" \
    dorado_mapped.bam dorado_mapped.bedrmod.gz
```


