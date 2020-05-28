# HMM state
## emmitting state
- states that have pdfs associated with them and emit feature vectors
## non-emmitting state
- there is no pdf for it, which has no transitions out of it. Implicitly, it connects to the next phone in the sequence.
## pdf-classes
- Each numbered state of a **prototype HMM** has two variables **forward_pdf_class** and **self_loop_pdf_class**. The **self_loop_pdf_class** is a kind of pdf-class that associated with self-loop transition. It is by default identical to forward_pdf_class, but it can be used to define less-conventional HMM topologies where they are different.
- concepts
    - transition-state : (phone, hmm-state, forward-pdf, self-loop-pdf)
    - transition-id : (transition-state, transition-index)