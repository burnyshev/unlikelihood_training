import pandas as pd
import argparse

def main(args):
    result = []
    pairs = [(1, 0.0), (3, 0.0), (8, 0.0), (0, 0.3), (0, 0.9)]
    initial_path = 'wikitext-103-bpe_v0/checkpoints/'
    for method in ['mle', 'ut', 'iut']:
        for (topk, topp) in pairs:
            try:
                s = f'{initial_path}/{method}/completion__gpt2__spl_valid__topk_{topk}__topp_{topp}__pfl_50__cnl_100.json'
                data = json.load(Path(s).open('r'))
                res = {'method': method, 'top_k': topk, 'top_p': topp}
                for i, j in data['bpe_metrics'].items():
                    res['bpe_' + i.split('_')[-1]] = j
                for i, j in data['word_metrics'].items():
                    res['word_' + i.split('_')[-1]] = j
                result.append(res)
            except:
                continue
    d = json.load(Path('wikitext-103-bpe_v0/checkpoints/alpha_entmax/completion__gpt2__spl_valid__topk_1__topp_0.0__pfl_50__cnl_100.json').open('r'))
    res = {'method': "alpha_entmax, alpha = 1.2", 'top_k': None, 'top_p': None}
    for i, j in data['bpe_metrics'].items():
        res['bpe_' + i.split('_')[-1]] = j
    for i, j in data['word_metrics'].items():
        res['word_' + i.split('_')[-1]] = j
    result.append(res)
    
    pd.DataFrame(result).to_csv(args.output)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', type=str, default='result.csv')
    args = parse_args()
    main(args)