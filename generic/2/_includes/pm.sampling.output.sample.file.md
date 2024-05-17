### The output sample file  

Every {{pmSampler}} simulation generates an output sample file whose name ends with `_sample.txt`. **This is the final gem** produced by the {{pmSampler}} sampler routine and contains a refined, decorrelated, [independent and identically-distributed (i.i.d.)](https://en.wikipedia.org/wiki/Independent_and_identically_distributed_random_variables){:target="_blank"} set of random states (points) sampled from the user-provided mathematical objective function. This file contains only two pieces of information,  

-   `sampleLogFunc` -- the value of the user-provided mathematical objective function at the currently-sampled state on each row of the file,  
-   **the sampled state** -- a row-wise vector of values that represents the current state that has been sampled. The variable names corresponding to each of these state values can be specified via the input specification attribute `domainAxisName` as described [here](../../{{pmSampler|downcase}}/specifications/#domainaxisname){:target="_blank"}.  

{% include note.html content='**Each row** in the output sample file represents information about a **visited state** during the simulation. **Each column** in the sample file represents information about **one attribute of the visited state**.' %}  


{% if pmSampler == "ParaDRAM" %}

{{site.data.alerts.tip}}
The user can set the number of <b>i.i.d.</b> randomly-sampled states by the ParaDRAM routine to a prespecified value prior to the simulation start. Alternatively, the user can request the sample size to be automatically set to the inferred optimal sample size at the end of the simulation or a fraction or multiple of this optimal value. All of this can be done by setting a single input simulation specification attribute named <b><code>sampleSize</code></b> according to the rules described <a href="../../{{pmSampler|downcase}}/specifications/#samplesize" target=":_blank">here</a>.
{{site.data.alerts.end}}  

Here is an example snippet from the contents of a typical ParaDRAM sample file,  

```text
sampleLogFunc,sampleVariable1,sampleVariable2,sampleVariable3
-6653.7715446294633,118.66335229170707,5.8564153719573948,119.27086100863379
-6659.0698939324593,118.64302952747666,5.7628529654206142,119.26241800320899
-6653.3444041667954,119.38362793323084,6.0383527991454482,120.12283908646494
-6653.0709752975054,118.60160131367854,5.8469733471466157,119.23856706244642
...
``` 

{% endif %}

{% include tip.outputPrecision.outputSeparator.md %}
