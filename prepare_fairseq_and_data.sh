cd ..
git clone https://github.com/pytorch/fairseq.git
cd fairseq
git checkout 2b68e91f231a2b7997664e1418f30b808d889963
cd ..
git clone https://github.com/facebookresearch/unlikelihood_training.git
cp -r unlikelihood_training/custom fairseq/fairseq
cd unlikelyhood_training
wget https://dl.fbaipublicfiles.com/unlikelihood/wikitext-103-bpe_v0.tar.gz
tar -xzvf wikitext-103-bpe_v0.tar.gz