# Regional heterothermy in <i>Megasoma gyas</i> is not related to active heat dissipation by the horns

_Data and R code for the thermal-imaging study of cooling rates across body regions in the rhinoceros beetle_ Megasoma gyas.

Authors: Danilo Giacometti, Luiz Henrique Lima Silva, Guilherme Gomes, José Eduardo de Carvalho, Alexandre V. Palaoro <br>
Contact about code, and analyses: d.giacometti96@gmail.com or alexandre.palaoro@gmail.com

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22286508.svg)](https://doi.org/10.5281/zenodo.22286508)
[![paper](https://img.shields.io/badge/paper-10.1111%2F1744--7917.70018-blue)](https://doi.org/10.1111/1744-7917.70018)
[![code license](https://img.shields.io/badge/code%20license-MIT-green)](LICENSE)
[![data license](https://img.shields.io/badge/data%20license-CC0%201.0-brightgreen)](LICENSE-DATA)

---

### This readme has been divided in three parts. First, we will talk about file structure, then the code, the dataset.

##### File structure:

We uploaded three different folders: "code", "data", and "figures". Each folder contain the files we used to run all analyses and the output files that came from the codes (the figures). We are also uploading the Supplementary Material for those who do not have access to it.

##### Code:

The folder "code" contains an RMarkown htlm file which contains all code used in this paper. Thus, you can reproduce all analyses and figures we generated for this paper.

##### Data:

The folder "data" contains the data we used in our analyses.
The data set contains the values of each individual of <i>Megasoma gyas</i> we used in the study. All variables are contained in the same file. These data were used to run all analyses contained in the manuscript.

In the columns we have the variables, in rows we have the individuals. <br>
COLUMN A: ID – the number we gave the individual Rhinoceros beetle. <br>
COLUMN B: exp – type of experiment; either passive heating or control. <br>
COLUMN C: body.part – body region under study (cephalic horn, thoracic horn, scutellum, abdomen). Cephal.horn = cephalic horn, thorax.horn = thoracic horn. <br>
COLUMN D: cool.rate – cooling rate; slope of the linear relationship between temperature and time. Please, see the paper for the description of how this was done. <br>
COLUMN E: mass – body mass of each individual. Unit: g. <br>
COLUMN F: mass.cat – body mass category. High = relatively heavy, low = relatively light. <br>
COLUMN G: horn.ratio – proportional horn size; horn length divided by body length. Please, see the paper for the description of how this was done. <br>

The code was run with RStudio (v2023.06.2) in R software (v4.3.2). <br>
Packages used: <br>
stats v4.3.2 <br>
forecast v8.21.1 <br>
performance v0.10.8 <br>
ggplot2 v3.5.1 <br>

##### Acknowledgments:
We thank Dr. Carlos Navas for providing the FLIR C-3 thermal camera used in our study. We thank Dr. Glenn Tattersall for helpful comments about the heat exchange dynamics of regional heterothermy and guidance on thermal image analysis. We also thank Dr. Sônia Casarin, the Coleoptera curator at MZUSP, and Dr. Juares Fuhrmann, for lending us the beetles (both live and dead) and all the help provided. DG was funded by a Doris White Memorial Bursary provided by Brock University. JEC was supported by the Fundação de Amparo à Pesquisa do Estado de São Paulo (FAPESP; grant: 20/12962-5).

---

## Citation

If you use anything in this repository, please cite the paper:

> Giacometti, D., Silva, L.H.L., Gomes, G., de Carvalho, J.E. & Palaoro, A.V. (2026) Regional heterothermy in *Megasoma gyas* is not related to active heat dissipation by the horns. *Insect Science* 33(3): 1206–1210. [https://doi.org/10.1111/1744-7917.70018](https://doi.org/10.1111/1744-7917.70018)

If you reuse the code or the archived files directly, please also cite the archive:

> Giacometti, D., Silva, L.H.L., Gomes, G., de Carvalho, J.E. & Palaoro, A.V. (2026) *Data and code for: Regional heterothermy in Megasoma gyas is not related to active heat dissipation by the horns* [Data set]. Zenodo. https://doi.org/10.5281/zenodo.22286508

`CITATION.cff` in this repository holds both citations in machine-readable form — GitHub's
**Cite this repository** button (top right of the repository page) will generate APA or
BibTeX from it for you.

## License

This repository is released under two licenses, because code and data are different things.

| Content | License | File |
| --- | --- | --- |
| Analysis code — `code/Cooling rates in beetles.R` and the knitted `code/Cooling-rates-in-beetles.html` | [MIT](https://opensource.org/licenses/MIT) | [`LICENSE`](LICENSE) |
| Data, figures and stored model output — `data/cool-heat.csv` and everything in `figures/` | [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/) | [`LICENSE-DATA`](LICENSE-DATA) |

In short: do whatever you like with the data, no permission needed and no attribution
legally required; reuse the code freely as long as you keep the copyright notice. Academic
norms still apply — if the data or code are useful to you, cite the paper.

## Updating the archive

This repository is linked to Zenodo. Every new GitHub release is archived automatically and
gets its own version DOI, while the concept DOI above always resolves to the newest version —
so the DOI in this README and in `CITATION.cff` never needs changing again.

To publish an update: **Releases → Draft a new release**, bump the tag (`v1.1.0`), publish.
Zenodo picks it up within a minute or two. `.zenodo.json` supplies the title, authors, ORCIDs,
keywords and the link to the article, so there is nothing to retype in the Zenodo form.

Cite the concept DOI in papers, never a version DOI.

## Reproducibility

- Everything needed to reproduce the published analyses is in this repository.
- Preprint: [10.1101/2025.02.04.636532](https://doi.org/10.1101/2025.02.04.636532) (bioRxiv)
- The archived release on Zenodo is the version of record. GitHub history may move on; the
  DOI will not.
- Package versions used are listed above. If a result does not reproduce, check those first.
