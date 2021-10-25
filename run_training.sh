#!/usr/bin/env bash
TRAIN_STEPS=4000
MODE=train
OUTPUT_DIR="wikitext-103-bpe_v0/checkpoints"

#MLE:

python src/run_gpt2.py --output-dir ${OUTPUT_DIR}/mle --mode ${MODE}
    
#Unlikelihood Training:

python src/run_gpt2.py --output-dir ${OUTPUT_DIR}/ut --ul-tune-rate 0.5 --mode ${MODE}
    
#Implicit Unlikelihood Training:

python src/run_gpt2.py --output-dir ${OUTPUT_DIR}/iut --mode train --pg-tune-rate 0.25 --ul-tune-rate 0.25 --mode ${MODE}
    
#Alpha-entmax training:

python src/run_gpt2.py --output-dir ${OUTPUT_DIR}/alpha_entmax --mode ${MODE} --token-loss alpha_entmax_loss --alpha-entmax

#Running TLDR:

python src/run_gpt2.py --output-dir ${OUTPUT_DIR}/TLDR --mode ${MODE} --token-loss tldr 