# Alignments
## Problem with alignments
- [The alignments of which have no sil at beginning, and they do have a sil at the beginning in the wave][1]
    - Sometimes, the context-dependent phones eat up the adjacent silence. One way to discourage this from happening is to use the `--boost-silence-prob`, e.g. 1.25. And make sure you aren't using too many context-dependent phones(num-leaves too large) compared to you data.
    - The WER of sMBR model is fine, although the alignment is not optimal. Models getting best WER do not necessarily produce most precise alignment. **That's true especially for the discriminatively trained models and RNNs**.
    - `--boost-silence = 1.5`, it helps to encourage the silence model to eat up more of the data, to avoid it getting modeled inappropritely by context-dependent phones.
    - Alignments are important, use a strong GMM or DNN-based system to generate the alignments.
    - Alignments derived from clean training data also helps.
    - **Unless you have some human reference in mind there is no way to evaluate the alignment accuracy**.
- [DTW vs. HMM-GMM Forced Alignment][2]
    - DTW does not perform forced alignment, it will not tell you the HMM state corresponding to each frame, since there is no HMM involved in that algorithm.
    - [aeneas][3]
- [phoneme to grapheme alignment][4]

[1]:https://groups.google.com/forum/#!topic/kaldi-help/_Ij6L4uORBE
[2]:https://groups.google.com/forum/#!searchin/kaldi-help/alignment|sort:date/kaldi-help/TKDf22Skmno/IFnxnBLnBwAJ
[3]:https://github.com/readbeyond/aeneas
[4]:https://groups.google.com/forum/#!searchin/kaldi-help/alignment|sort:date/kaldi-help/7ZWJd5fEVzQ/OiIMe0fSAQAJ