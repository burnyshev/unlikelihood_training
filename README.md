# Implicit Unlikelihood Training: Improving Neural Text Generation with Reinforcement Learning

This repository contains a code for course project of Reinforcement Learning class at Skoltech. During our project we reimplemented paper [Implicit Unlikelihood Training: Improving Neural Text Generation with Reinforcement Learning](https://arxiv.org/abs/2101.04229) (accepted to EACL 2021)

## Setup
Get custom version of fairseq + load data

```bash
bash prepare_fairseq_and_data.sh
```
comment tensorflow import fairseq/fairseq/custom/evaluation.py:18 if you don't want to have problems with tensorflow!!!

```bash
poetry install
poetry shell
```

## Scripts

Run training, using: 
1. standard MLE mode
2. Unlikelihood Training variant
3. Implicit Unlikelihood Training
4. Alpha-entmax sampling
5. Token Loss Dynamic Reweighting

```bash
bash run_training.sh
```

## Results