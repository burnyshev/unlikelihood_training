#!/usr/bin/env bash
MODE=eval-completion
OUTPUT_DIR="wikitext-103-bpe_v0/checkpoints"


for method in "mle" "ut" "iut"; do
    echo $method
    for i in 1,0.0 3,0.0 8,0.0 0,0.3 0,0.9; do
        IFS=',' read item1 item2 <<< "${i}"
        topk=$item1
        topp=${item2}
        echo topk "${topk}"  topp "${topp}"
        
        python src/run_gpt2.py \
            --mode ${MODE} \
            --model-load-dir ${OUTPUT_DIR}/${method}/best/pytorch_model.bin \
            --output-dir ${OUTPUT_DIR}/${method} \
            --top-k ${topk} \
            --top-p ${topp}
        
    done
done


for method in "alpha_entmax"; do
    echo $method
    python src/run_gpt2.py \
        --mode ${MODE} \
        --model-load-dir ${OUTPUT_DIR}/${method}/best/pytorch_model.bin \
        --output-dir ${OUTPUT_DIR}/${method} \
        --alpha-entmax
done

