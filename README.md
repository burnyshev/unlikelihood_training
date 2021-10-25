# Implicit Unlikelihood Training: Improving Neural Text Generation with Reinforcement Learning

This repository contains a code for course project of Reinforcement Learning class at Skoltech. During our project we reimplemented paper [Implicit Unlikelihood Training: Improving Neural Text Generation with Reinforcement Learning](https://arxiv.org/abs/2101.04229) (accepted to EACL 2021)


## Table of content 

  - [Repository structure](#repository-structure)
  - [Setup](#setup)
  - [Scripts](#scripts)
  - [Results](#results)


## Repository structure

```bash
.
├── README.md
├── bin
│   ├── prepare_fairseq_and_data.sh
│   ├── run_evaluation.sh
│   └── run_training.sh
├── poetry.lock
├── pyproject.toml
└── src
    ├── alpha_entmax_training.py
    ├── once_reward_pg.py
    ├── policy_value.py
    ├── run_evaluation.py
    ├── run_gpt2.py
    ├── time_reward_pg.py
    ├── tldr.py
    ├── unlikelihood.py
    └── utils.py
```

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
Run evaluation on finetuned models, using several decoding strategies (top-k and top-p strategies)
```bash
bash bin/run_evaluation.sh
```

## Results

#TODO 
add tables/graphic