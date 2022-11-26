# domain-classifier

## Preface

This domain classifier was written in Python over Notebooks, the process of creating this AI solution to classify malicious domains without it's [TLDs](https://en.wikipedia.org/wiki/Top-level_domain) followed the process of an academic research. The paper that guided the steps in which one should partake to make an AI solution was beatifully layout at [1] and it served as the guide for this work. As per KOTSIANTIS steps, the last iteration of trying to achieve a solution that works was done as follow:
<br>
<br>
- Data was gathered based on popular sources of public domains lists [[3]](#3).<br>
- Domains were cleaned and it's TLDs remove based on [IANAs TLD](https://www.iana.org/domains/root/db) and resonable deduction.<br>
- Feature extraction was based on papers on [[2]](#2) which have three sets of features, lexical, ngram and imitation; On this repository, only lexical is used.<br>
- Training was initially done with [SKLearn](https://scikit-learn.org/), changing hiperparameters by hand, then, I discover [TPOT](https://epistasislab.github.io/tpot/), which is an AutoML that in essence, is a wrapper for scikit learn that preprocess and explore the grid of possibilities through tree based pipelining and genetic programming.<br>
Finally, the evaluation of the predictors is done through commom metrics but, trained the TPOT uses the most appropriate for unbalanced data, balanced accuracy [[3]](#3).<br>
<br>
The conclusion unfortunetly was not promising, even if throughly explored, the results are not good since the distinction between classes cannot be achieve with so little information.<br>


## Installation

Use [Python3](https://www.python.org/), package manager [pip](https://pip.pypa.io/en/stable/) and virtual environment with [VirtualEnv](https://virtualenv.pypa.io/en/latest/)

```bash
# run.sh
sudo apt install python3
python3 -m pip install --user --upgrade pip
pip install virtualenv
python3 -m venv env
```

Activate venv with:
```bash
source ~/env/bin/activate
```

Install notebook or preferable IDE, kernel and all necessary libraries with:
```bash
# run_env.sh
pip install notebook
pip install ipykernel
python -m ipykernel install --user --name=env
pip install -r ~/domain_classifier/requirements.txt
jupyter notebook
```
Warning: Only run run_env.sh commands over an activated venv, change paths if necessary.

## Usage

The files are numbered and represent the order in which should be executed. <br>
The data/lists/legitimate/domaincurler was used for ground truth, only HTTP 200 sites were used over the process. <br>

## References
<a name="1"></a>[1] KOTSIANTIS, S. B. Supervised Machine Learning: A Review of Classification Techniques. Computing, v. 31, p. 249–268, 2007. ISSN 09226389<br>
<a name="2"></a>[2] ZHANG, P.; LIU, T.; ZHANG, Y.; YA, J.; SHI, J.; WANG, Y. Domain watcher: Detecting malicious domains based on local and global textual features. Procedia Computer Science, v. 108, p. 2408 – 2412, 2017. ISSN 1877-0509. International Conference on Computational Science, ICCS 2017, 12-14 June 2017, Zurich, Switzerland.<br>
<a name="3"></a>[3] DAS, A.; BAKI, S.; AASSAL, A. E.; VERMA, R. M.; DUNBAR, A. SOK: A comprehensive reexamination of phishing research from the security perspective. CoRR, abs/1911.00953, 2019 <br>

## License
[MIT](https://choosealicense.com/licenses/mit/)
