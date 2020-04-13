# [yesno][1]
## config
- mfcc.config
- topo_orig.proto
    - NONSILENCEPHONES
    - SILENCEPHONES
## input
- lexicon_nosil.txt
- lexicon.txt
- phones.txt
- [task.arpabo][2] : 1-gram 语言模型
## local
- create_yesno_txt.pl
- create_yesno_wav_scp.pl
- create_yesno_waves_test_train.pl
- prepare_dats.sh
- prepare_dict.sh
- prepare_lm.sh
- score.sh
## shell
- `ls -1`
- `awk '{printf("%s global\n", $1);}'`
## Reference
- [Data preparation][3]
- [**Disable optional silence**][4]
- [kaldi中FST的可视化-以yesno为例][5]
- [**kaldi-yesno-tutorial**][7]
- [**kaldi yesno example**][8]
- [**Kaldi(A4)model文件分析**][9]
- [**hand-book-of-speech-enhancement-and-recognition**][10]
- [**Some Kaldi Notes**][11]
## Question
- optional_silence.txt的作用 ?
- [extra_questions.txt][6]的作用 ?
- .fst格式文件的可视化
- .mdl格式文件的可视化
- tree文件可视化
- compile-train-graph
- .ark文件的可视化
- \<eps>:`means "no symbol here"`
- fst.1.gz : format ?
## Optional
- segments:包括每个录音的发音分段/对齐信息
- reco2file_and_channel:双声道录音情况使用到
- spk2gender:将说话人和其性别建立映射关系，用于声道长度归一化
## Kaldi IO
- [Kaldi IO][7]
## [**HCLG.fst**][12]
- G.fst : the language model FST
- L.fst : maps monophone sequences to words
- C.fst : maps triphone sequences to monophones, expands the phones into context-dependent phones
- H.fst : maps multiple HMM states(a.k.a transition-ids in Kaldi-speak) to context-dependent triphones

[1]:../../egs/yesno/README.txt
[2]:https://sourceforge.net/p/cmusphinx/discussion/help/thread/a8cff6d9/
[3]:https://kaldi-asr.org/doc/data_prep.html
[4]:https://groups.google.com/forum/#!topic/kaldi-help/IVev7biMkTw
[5]:https://blog.csdn.net/u013677156/article/details/77893661
[6]:https://www.eleanorchodroff.com/tutorial/kaldi/training-acoustic-models.html#create-files-for-datalang
[7]:https://github.com/keighrim/kaldi-yesno-tutorial
[8]:https://blog.csdn.net/shichaog/article/details/73264152
[9]:https://www.jianshu.com/p/9b6cc95668a9
[10]:https://shichaog1.gitbooks.io/hand-book-of-speech-enhancement-and-recognition/content/
[11]:http://jrmeyer.github.io/asr/2016/02/01/Kaldi-notes.html
[12]:http://jrmeyer.github.io/asr/2016/02/01/Kaldi-notes.html