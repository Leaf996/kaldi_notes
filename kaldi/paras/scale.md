# scale
## acoustic-scale
- The acoustic scale is the scale applied to the `acoustics`(i.e. to the log-likelihood of a frame given an acoustic state).
## transition-scale
- The transition scale is the scale on the `transition probabilities`, but this only applies to HMM states that have multiple transitions out of them; it applies to the relative weight between such transitions. It does not have any effect for typical topologoes.
## self-loop-scale
- The self-loop scale is the scale that we apply to the `self-loops`. More specifically, when we add the self-loop, let the probability mass given to the self-loop be p and the mass given to the rest be (1-p). We add a self-loop with log-probability self_loop_scale * log(p), and add (self_loop_scale * log(1-p)) to all the other log transition probabilities out of that state. (Note: in the initial stage of graph creation we create a graph without self-loops, and with the non-self-loop transition probabilities renormalized to sum to one). In typical topologies, the self-loop scale is the only scale that matters.