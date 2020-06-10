# boost-silence
- Normally you shouldn’t have to set it. It helps to encourage the silence model to eat up more of the data, to avoid it getting modeled inappropriately by context-dependent phones. It is helpful on some setups, but not always.
- Sometimes training with e.g. **--boost-silence 1.25** can help to avoid the non-silence phones modeling silence.  And make sure you're extracting the alignments correctly (should be OK if you're relying on the phoneme boundaries from the alignments, but might not be if you're relying on word labels in lattices and forgetting to do lattice-align-words or lattice-align-words-lexicon).
## [Dealing with silence files][1]
- add silence uttrences
## [Speech Activate Detection (SAD) for Diarization][2]
- energy-based


[1]:https://groups.google.com/forum/#!topic/kaldi-help/GyYCiv6gQ8o
[2]:https://groups.google.com/forum/#!topic/kaldi-help/XOConkLKKcQ