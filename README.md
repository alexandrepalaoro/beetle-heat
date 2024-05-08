# Regional heterothermy is not associated with active heat dissipation by the horns in the Rhinoceros Beetle (Megasoma gyas)

Authors: Danilo Giacometti, Luiz Henrique Lima Silva, Guilherme Gomes, José Eduardo de Carvalho, Alexandre V. Palaoro <br>
Contact about code, and analyses: d.giacometti96@gmail.com or alexandre.palaoro@gmail.com

---

### This readme has been divided in three parts. First, we will talk about file structure, then the code, the dataset.

##### File structure:

We uploaded three different folders: "code", "data", and "figures". Each folder contain the files we used to run all analyses and the output files that came from the codes (the figures). We are also uploading the Supplementary Material for those who do not have access to it.

##### Code:

The folder "code" contains an RMarkdown html file which contains all code used in this paper and an additional .R file where all raw code is given. Thus, you can reproduce all analyses and figures we generated for this paper.

##### Data:

The folder "data" contains the data we used in our analyses.
The data set contains the values of each individual of Megasoma gyas we used in the study. All variables are contained in the same file. These data were used to run all analyses contained in the manuscript.

METADATA OF cool-heat.csv
In the columns we have the variables, in rows we have the individuals. <br>
COLUMN A: ID – the number we gave the individual Rhinoceros beetle <br>
COLUMN B: exp – type of experiment; either passive heating or control <br>
COLUMN C: body.part – body region under study (cephalic horn, thoracic horn, elytra, abdomen). Cephal.horn = cephalic horn, thorax.horn = thoracic horn <br>
COLUMN D: cool.rate – cooling rate; slope of the linear relationship between temperature and time. Please, see the paper for the description of how this was done <br>
COLUMN E: mass – body mass of each individual. Unit: g <br>
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
