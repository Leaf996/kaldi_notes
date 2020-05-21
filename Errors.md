# Questions
## LDA + MLLT training
- [Estimate():lda-estimate.cc:91) Assertion failed: (target_dim <= Dim() && (target_dim < NumClasses() || opts.allow_large_dim))][1]
    - target-dim : lda output-dim
    - Dim() : lda input-dim
    - NumClasses() : number of phone class
    - [More][2]



[1]:https://groups.google.com/forum/#!topic/kaldi-help/GtfiO0Hd5c0
[2]:https://sourceforge.net/p/kaldi/discussion/1355348/thread/b601e22d/