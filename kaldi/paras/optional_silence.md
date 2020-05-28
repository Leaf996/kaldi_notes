# optional silence
- Possibly during training you did not put silence in your transcripts in all the places where silence actually appears (including at the beginning and end of utterances). **This would force the non-silence phones to learn to model silence also**.
- It might be better to train the system using the optional silence, and then prepare a different lang directory where you disable optional silence, and use that one to do the final alignment; just make sure the phones.txt is the same.
- [optional-silence SIL is seen only 72% of the time at utterance begin. This may not be optimal][1]
    - 数据相关

[1]:https://github.com/i3thuan5/tai5-uan5_gian5-gi2_hok8-bu7/issues/82