# Data Preparation
## Introduction
- This page will assume that you are using the latest version of the example scripts(typically named "s5" in the example directories, e.g. egs/rm/s5/). The top-level `run.sh` scripts have a few commands at the top of them that related to various phases of data preparation. The parts in the sub-directory named `local/` are always specific to the database.
- The output of the data preparation stage consists of two sets of things. One relates to **the data** (directories like data/train/) and one relates to **the language** (directories like data/lang/).  The data part relates to the specific recordings you have, and the lang part contains things that relate more to the language itself, such as the lexicon, the phone set, and various extra information about the phone set that kaldi needs. If you want to prepare data which you will decode with an already existing system and an already existing language model, the data is all you need to touch.
## Data preparation -- the data part
- The specific example we'll look at the Switchboard recipe in egs/swbd/s5.
    ```
    s5# ls data/train
    cmvn.scp  feats.scp  reco2file_and_channel  segments  spk2utt  text  utt2spk  wav.scp
    ```
    Not all of the files are equally important. For a simple setup where there is no **segmentation** information(i.e. each utterance corresponds to a singlefile), the only files you **have to create yourself are utt2spk, text and wav.scp**, and **possibly segments and reco2file_and_channel**, and the rest will be created by standard scripts.
### Files you need to create yourself
- text
    - The file text contains the transcriptions of each utterance.
    ```
    s5# head -3 data/train/text
    sw02001-A_000098-001156 HI UM YEAH I'D LIKE TO TALK ABOUT HOW YOU DRESS FOR WORK AND
    sw02001-A_001980-002131 UM-HUM
    sw02001-A_002736-002893 AND IS
    ```
    - The first element on each line is the `utterance-id`, which is an arbitrary text string, **but if you have speaker information in your setup, you should make the speaker-id a prefix of the utterance id**; this is important for reasons relating to the sorting of these files. The rest of the line is the transcription of each sentence. You don't have to make sure that all words in this file are in your vocabulary; out of vacabulary words will get mapped to a word specified in the file data/lang/oov.txt.
    - It needs to be the case that when you sort both the utt2spk and spk2utt files, the orders **agree**,  e.g. the list of speaker-ids extracted from the utt2spk is the same as the string sorted order. **The easiest way to make this happen is to make the speaker-ids a prefix of the utterance**. Alghough, in this particular example we have used an underscore to separate the speaker and utterance parts of the utterance-id, in general it's probably safer to use a dash(-). `This is because it has a lower ASCII value, if the speaker-ids vary in length, in certain cases the speaker-ids and their corresponding utterance ids can end up being sorted in different orders when using the standard C-style ordering on strings, which will lead to a crash.

- wav.scp
    - follow
        ```
        s5# head -3 data/train/wav.scp
        sw02001-A /home/dpovey/kaldi-trunk/tools/sph2pipe_v2.5/sph2pipe -f wav -p -c 1 /export/corpora3/LDC/LDC97S62/swb1/sw02001.sph |
        sw02001-B /home/dpovey/kaldi-trunk/tools/sph2pipe_v2.5/sph2pipe -f wav -p -c 2 /export/corpora3/LDC/LDC97S62/swb1/sw02001.sph |
        ```
    - The format of this file is
        ```
        <recording-id> <extended-filename>
        ```
        where the **extended-filename** may be an actual filename,or as in this case, a command that extracts a wav-format file. The pipe symbol on the end of the extended-filename specifies that it is to be interpreted as a pipe. We will explain what **recording-id** is below, but we would first like to point out that if the **segments** file does not exist, the first token on each line of wav.scp file is just the utterance id. **The files in wav.scp must e single-channel(mono), if the underlying wav files have multiple channels, then a sox command must be used in the wav.scp to extract a particular channel**.

- segments
    - In Switchboard setup we have the segments file, so we'll discuss this next.
        ```
        s5# head -3 data/train/segments
        sw02001-A_000098-001156 sw02001-A 0.98 11.56
        sw02001-A_001980-002131 sw02001-A 19.8 21.31
        sw02001-A_002736-002893 sw02001-A 27.36 28.93
        ```
    - The format of the segments file is:
        ```
        <utterance-id> <recording-id> <segment-begin> <segment-end>
        ```
        where the segment-begin and segment-end are measured in seconds. These specify time offsets into a recording. The **recording-id** is the same identifier as is used in the wav.scp file, this is an arbitrary identifier that you can choose.
- reco2file_and_channel
    - The file **reco2file_and_channel** is only used when scoring(measuring error rates) with NIST's **sclite** tool:
        ```
        s5# head -3 data/train/reco2file_and_channel
        sw02001-A sw02001 A
        sw02001-B sw02001 B
        sw02005-A sw02005 A
        ```
    - The format is:
        ```
        <recording-id> <filename> <recording-side (A or B)>
        ```
        The filename is typically the name of the .sph file, without the suffix, but in general it's whatever identifier you have in your "stm" file. The recording side is a concept that relates to telephone conversations where there are two channels, and if not, it's probably safe to use "A". If you don't have an "stm" file or you have no idea what this is all about, then you don't need the "reco2file_and_channel" file.
- utt2spk
    - The last file you need to create yourself is the "utt2spk" file. This says, for each utterance, which speaker spoke it. 
        ```
        s5# head -3 data/train/utt2spk
        sw02001-A_000098-001156 2001-A
        sw02001-A_001980-002131 2001-A
        sw02001-A_002736-002893 2001-A
        ```
    - The format is:
        ```
        <utterance-id> <speaker-id>
        ```
        **If you have no information at all about the speaker identities, you can just make the aspeaker-ids the same asn the utterance-ids**. We have made the previous sentence bold because we have encountered people creating a **global spekaer-id**, this is a bad idea because it makes cepstral mean normalization ineffective in raining, and because itwill create problems when you use utils/split_data_dir.sh to split your data into pieces.
- spk2gender
    - There is another file that exists in some setups, it is used only occasionally and not in the kaldi system build.
        ```
        s5# head -3 ../../rm/s5/data/train/spk2gender
        adg0 f
        ahh0 m
        ajp0 m
        ```
        This file maps from speaker-id to either "m" or "f" depending on the speaker gender.
- **ALL of these files should be sorted**. If they are not sorted, you will get errors when you run the scripts. In the table concept we explain why this is needed. It has to do with the I/O framework, the ultimate reason for the sorting is to enable something equivalent to random-access lookup on a streamthat doesn't support fseek(), such as a piped command. Many kaldi programs are reading multiple pipes from other kaldi commands, reading different types of object, and are doing something roughly comparable to merge-sort on the different inputs, merge-sort, of course, requires that the inputs be sorted. **Be careful when you sort that you have the shell variable LC_ALL defined as "C"**, for example (in bash):
    ```
    export LC_ALL=C
    ```
    If you don't do this, the files will be sorted in an order that's different from how C++ sorts strings, and kaldi will crash.
- If your data consists of a test set from NIST that has an "stm" and a "glm" file provided so that you can measure WER, then you can put these files in the data directory with the names "stm" and "glm". Note that we put the scoring script (which measures WER) in `local/score.sh`, which means it is specific to the setup; not all of the scoring scripts in all of the setups will recognize the stm and glm file. An example of a scoring script that uses those files is the one the Switchboard setup, i.e. `egs/swbd/s5/local/score_sclite.sh`, which is invoked by the top-level scoring script `egs/swbd/s5/local/score.sh` if it notices that your test set has the stm and glm files.