# kaldi_notes
kaldi study notes

# awesome-kaldi
- [**Kaldi**][7]
- [Dan Povey's homepage][1]
- [Some Kaldi Notes][2]
- [**Kaldi 笔记**][3]
- [Kaldi(A4)model文件分析][4]
- [Kaldi-notes][5]
- [**Kaldi Tutorial**][6]
- [**Kaldi 查看不同文件用到的命令**][24]

# kaldi data augments
- [Kaldi当中语音数据增强有什么方法][8]

# open source data
- [语音行业有什么好用的开源噪声库吗][9]

# Blog
- [On lattice free MMI and Chain models in Kaldi][10]
- [position-dependent-phones][25]
- [shared, split][26]

# Install
- Tools
    - [**Atlas**][11] : a portably efficient [BLAS][12] implementation
    - [**OpenFst**][13] : OpenFst is a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs).
    - [**sctk**][14] : Speech Recognition Scoring Toolkit (SCTK)
    - [**sph2pipe**][15] : convert SPHERE files to other formats
    - [**cub**][16] : CUB is a flexible library of cooperative threadblock primitives and other utilities for CUDA kernel programming
    - [**irstlm**][17] : A toolkit for language modeling
    - [**portaudio**][18] : PortAudio is a free, cross-platform, open-source, audio I/O library
    - [**speex**][19] : A Free Codec For Free Speech
    - [**srilm**][20] : The SRI Language Modeling Toolkit
    - [**kenlm**][21] : Faster and Smaller Language Model Queries
    - [**l-bfgs**][22] : a library of Limited-memory Broyden-Fletcher-Goldfarb-Shanno (L-BFGS)
    - [*mkl*][23] : Intel® Math Kernel Library

# 填坑记
- Windows vs. Linux
    - link-file : windows不识别Linux下的软链接文件, 软连接会被替换成路径


[1]:http://www.danielpovey.com/kaldi-lectures.html
[2]:http://jrmeyer.github.io/asr/2016/02/01/Kaldi-notes.html
[3]:https://www.dazhuanlan.com/2019/11/07/5dc428c57a2f4/
[4]:https://www.jianshu.com/p/9b6cc95668a9
[5]:http://white.ucc.asn.au/Kaldi-Notes/tidigits/train
[6]:https://eleanorchodroff.com/tutorial/kaldi/index.html
[7]:http://www.kaldi-asr.org/doc/index.html
[8]:https://www.zhihu.com/question/362498376
[9]:https://www.zhihu.com/question/278918708/answer/631873989
[10]:https://desh2608.github.io/2019-05-21-chain/
[11]:http://math-atlas.sourceforge.net/
[12]:http://www.netlib.org/blas/
[13]:http://www.openfst.org/twiki/bin/view/FST/WebHome
[14]:https://github.com/usnistgov/SCTK
[15]:https://www.openslr.org/3/
[16]:https://github.com/NVlabs/cub
[17]:https://github.com/irstlm-team/irstlm
[18]:http://www.portaudio.com/
[19]:https://www.speex.org/
[20]:http://www.speech.sri.com/projects/srilm/
[21]:https://github.com/kpu/kenlm
[22]:https://github.com/chokkan/liblbfgs
[23]:https://software.intel.com/en-us/mkl
[24]:https://blog.csdn.net/qq_25867649/article/details/78356506
[25]:https://kaldi-asr.org/doc/data_prep.html
[26]:https://kaldi-asr.org/doc/tree_externals.html