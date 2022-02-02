#!/bin/bash
pip install notebook
pip install ipykernel
python -m ipykernel install --user --name=env
pip install -r ~/domain_classifier/requirements.txt
jupyter notebook

