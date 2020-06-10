#  num leaves and total number of gaussians best ratio
- [is there a rule of thumb type ratio between number of leaves of total number of Gaussian components in hmm/gmm models][1]
    - It will not matter much, but just increase the num-Gauss just a little faster than the num-leaves.
    - Aim for maybe between 10 and 30 Gaussians per leaf, or maybe less if data is very small.
- [Relationship Between Number of hours of training data and number of gaussians in the mixture][2]
    - The num-leaves and the gauss-per-leaf (ratio between guassians and leaves) should change very slowly with the amount of training data. E.g. **one-fourth power of even less**
    - The number of Gaussians is the total over all leaves, so the average num-gauss per pdf/leaf is num-gauss/num-leaves, but leaves with more data will get somewhat more Gaussians.
- [-power]
    - exponent to determine number of gaussians from occurrence counts (出现次数)
- 【-cluster_thresh]
    - for build-tree control final bottom-up clustering of leaves

[1]:https://groups.google.com/forum/#!searchin/kaldi-help/num-leaves|sort:date/kaldi-help/S8_JJDBvIZE/WD9boenaAAAJ
[2]:https://groups.google.com/forum/#!searchin/kaldi-help/num-leaves|sort:date/kaldi-help/Qw3YBtvMRVo/c7p7-Uy0BwAJ