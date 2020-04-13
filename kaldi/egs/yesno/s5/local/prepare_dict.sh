#!/usr/bin/env bash

mkdir -p data/local/dict

cp input/lexicon_nosil.txt data/local/dict/lexicon_words.txt                # word-phone pairs

cp input/lexicon.txt data/local/dict/lexicon.txt                            # 完整的word-phone pairs

cat input/phones.txt | grep -v SIL > data/local/dict/nonsilence_phones.txt  # 语言学发音

echo "SIL" > data/local/dict/silence_phones.txt                             # 非语言学发音

echo "SIL" > data/local/dict/optional_silence.txt                           # 可选非语言学发音

echo "Dictionary preparation succeeded"
