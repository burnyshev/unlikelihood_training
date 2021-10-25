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
├── get_result_table.py
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
+ comment tensorflow import fairseq/fairseq/custom/evaluation.py:18 if you don't want to have problems with tensorflow!!!
+ log into [wandb](https://wandb.ai/home) for tracking training process
```bash
wandb login
```

Package management
```bash
poetry install
poetry shell
```

## Scripts

Run training, using: 
1. standard MLE mode (mle)
2. Unlikelihood Training variant (ut)
3. Implicit Unlikelihood Training (iut)
4. Alpha-entmax sampling 
5. Token Loss Dynamic Reweighting

```bash
bash run_training.sh
```
Run evaluation on finetuned models, using several decoding strategies (top-k and top-p strategies)
```bash
bash bin/run_evaluation.sh
```
Get table with metrics of generated texts
```bash
python get_result_table.py
```

## Results
All training graphics are recorded [here](https://wandb.ai/burnyshev/unlikelihood_training?workspace=user-burnyshev)

Evaluation results

method                    |   top_k |   top_p |   bpe_1grams |   bpe_2grams |   bpe_3grams |   bpe_4grams |   word_1grams |   word_2grams |   word_3grams |   word_4grams |
|:--------------------------|--------:|--------:|-------------:|-------------:|-------------:|-------------:|--------------:|--------------:|--------------:|--------------:|
| mle                       |       0 |     0.3 |       0.6269 |       0.4379 |       0.3471 |       0.2845 |        0.6153 |        0.4092 |        0.3167 |        0.2625 |
| ut                        |       0 |     0.3 |       0.4168 |       0.1398 |       0.0603 |       0.0275 |        0.4134 |        0.113  |        0.0363 |        0.0127 |
| iut                       |       0 |     0.3 |       0.4476 |       0.1695 |       0.0744 |       0.0321 |        0.4418 |        0.138  |        0.0453 |        0.0144 |
| mle                       |       0 |     0.9 |       0.3405 |       0.0999 |       0.0481 |       0.0243 |        0.3442 |        0.08   |        0.0294 |        0.0121 |
| ut                        |       0 |     0.9 |       0.3202 |       0.0812 |       0.0349 |       0.015  |        0.3266 |        0.0636 |        0.0193 |        0.0056 |
| iut                       |       0 |     0.9 |       0.324  |       0.0818 |       0.0341 |       0.0145 |        0.3295 |        0.0644 |        0.0189 |        0.0056 |
| mle                       |       1 |     0   |       0.7418 |       0.6292 |       0.571  |       0.5241 |        0.7368 |        0.6182 |        0.5616 |        0.5236 |
| ut                        |       1 |     0   |       0.4625 |       0.1961 |       0.0875 |       0.0408 |        0.4729 |        0.1853 |        0.0781 |        0.0367 |
| iut                       |       1 |     0   |       0.4662 |       0.1891 |       0.0819 |       0.0301 |        0.4735 |        0.1686 |        0.0655 |        0.0227 |
| mle                       |       3 |     0   |       0.5781 |       0.3413 |       0.2361 |       0.1689 |        0.567  |        0.313  |        0.2055 |        0.1457 |
| ut                        |       3 |     0   |       0.4155 |       0.1217 |       0.0401 |       0.0129 |        0.4223 |        0.1106 |        0.0315 |        0.009  |
| iut                       |       3 |     0   |       0.44   |       0.1491 |       0.0571 |       0.0204 |        0.4434 |        0.1311 |        0.0429 |        0.0135 |
| mle                       |       8 |     0   |       0.4868 |       0.2188 |       0.1271 |       0.0785 |        0.4773 |        0.1909 |        0.099  |        0.0582 |
| ut                        |       8 |     0   |       0.3911 |       0.1036 |       0.036  |       0.0125 |        0.3936 |        0.0898 |        0.0256 |        0.0075 |
| iut                       |       8 |     0   |       0.4138 |       0.1244 |       0.0465 |       0.0169 |        0.4139 |        0.1069 |        0.0326 |        0.0101 |
| alpha_entmax, alpha = 1.2 |     nan |   nan   |       0.324  |       0.0818 |       0.0341 |       0.0145 |        0.3295 |        0.0644 |        0.0189 |        0.0056 |