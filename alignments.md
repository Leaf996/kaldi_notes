# Alignments
## Problem with alignments
- [The alignments of which have no sil at beginning, and they do have a sil at the beginning in the wave][1]
    - Sometimes, the context-dependent phones eat up the adjacent silence. One way to discourage this from happening is to use the `--boost-silence-prob`, e.g. 1.25. And make sure you aren't using too many context-dependent phones (**num-leaves too large**) compared to you data.
    - The WER of sMBR model is fine, although the alignment is not optimal. Models getting best WER do not necessarily produce most precise alignment. **That's true especially for the discriminatively trained models and RNNs**.
    - `--boost-silence = 1.5`, it helps to encourage the silence model to eat up more of the data, to avoid it getting modeled inappropritely by context-dependent phones.
    - Alignments are important, use a strong GMM or DNN-based system to generate the alignments.
    - Alignments derived from clean training data also helps.
    - **Unless you have some human reference in mind there is no way to evaluate the alignment accuracy**.
- [DTW vs. HMM-GMM Forced Alignment][2]
    - DTW does not perform forced alignment, it will not tell you the HMM state corresponding to each frame, since there is no HMM involved in that algorithm.
    - [aeneas][3]
- [phoneme to grapheme alignment][4]
- [Disable optional silence][5]
    - Possibly during training you did not put silence in your transcripts in all the places where silence actually appears(including at the beginning and end of utterances). `This would force the non-silence phones to learn to model silence also`. It might be better to train the system using the optional silence, and the prepare a different lang directory where you disable optional silence, and use that one to do the final alignment. Just make sure the phones.txt is the same.
    - Sometimes, training with e.g. `--boost-silence 1.25` can help to avoid the non-silence phones modeling silence. And make sure you're extracting the alignments correctly(**should be OK if you're relying on the phoneme boundaries from the alignments, but might not be if you're relying on word labels in lattices and forgetting to do lattice-aligh-words or lattice-align-lexicion**).
- [Align transcription with pre-trained model][6]
    - `Chain models are not recommended for alignment`, and in general you are not seeing much difference between the standard-frame DNN models and SAT GMM models for the task for force alignment. Kaldi standard training framework is to train a gmm sat systems and to align with that to train a subsequent DNN model(chain or not).
- [Data Alignment][7]
    - `Indeed, it appears chain models are not the best choice for alignments`.
- [nnet3 alignment issues][8]
    - It's about the fact that `chain models are not good for alignment, since the objective function they are trained with does not force them to produce good alignments`, and (b)LSTM does not always produce good alignments. `Regardless, for force alignment i would generall recommend to use a GMM based model`.  It's much faster, and the performance of alignment is not very sensitive to how well a model performs in decoding.
- [WARNING: optional-silence SIL is seen only 69.4736842105% of the time at utterance end. This may not be optimal][9]
- [context dependency][10]
    - Thins like context dependency could in theory make the alignments different from what a human would say.
- [GMM-HMM][11]
    - GMM-HMM has its own limitation, and 1k hours data won't help much.
- [lattice for mmi training][12]


[1]:https://groups.google.com/forum/#!topic/kaldi-help/_Ij6L4uORBE
[2]:https://groups.google.com/forum/#!searchin/kaldi-help/alignment|sort:date/kaldi-help/TKDf22Skmno/IFnxnBLnBwAJ
[3]:https://github.com/readbeyond/aeneas
[4]:https://groups.google.com/forum/#!searchin/kaldi-help/alignment|sort:date/kaldi-help/7ZWJd5fEVzQ/OiIMe0fSAQAJ
[5]:https://groups.google.com/forum/#!topic/kaldi-help/IVev7biMkTw
[6]:https://groups.google.com/forum/#!searchin/kaldi-help/chain$20alignment|sort:date/kaldi-help/vPFE0drJjwA/lIRyFbTgBgAJ
[7]:https://groups.google.com/forum/#!searchin/kaldi-help/chain$20alignment|sort:date/kaldi-help/y51nL83HwJA/sjonAlkgAQAJ
[8]:https://groups.google.com/forum/#!topic/kaldi-help/cSAm5iXGhZo
[9]:https://groups.google.com/forum/#!topic/kaldi-help/V8p2LTlyjBE
[10]:https://groups.google.com/forum/#!searchin/kaldi-help/gmm-hmm$20training|sort:date/kaldi-help/BkEub9VTUmk/ZJH8wz7pCAAJ
[11]:https://groups.google.com/forum/#!searchin/kaldi-help/gmm-hmm$20training|sort:date/kaldi-help/rlQ0MIFsQJ4/ptt8_g_DAwAJ
[12]:https://groups.google.com/forum/#!searchin/kaldi-help/gmm-hmm$20training|sort:date/kaldi-help/RNUpjyKTLZk/5XqQ7mT1BAAJ