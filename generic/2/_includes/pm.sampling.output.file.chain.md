### The output chain file  

Every {{pmSampler}} simulation generates an output chain file whose name ends with either `_chain.txt` (the default suffix) or  `_chain.bin`. When the file extension is `.bin`, the file has been generated in binary format and is unreadable to humans. The output chain file's format can be specified via the input specification variable `outputChainFileFormat` described [here](../../{{pmSampler|downcase}}/specifications/#outputchainfileformat){:target="_blank"}.  

The output chain file contains information about all of the useful, non-rejected calls that the {{pmSampler}} routine makes to the user-provided mathematical objective function during the simulation, including,  

{% if pmSampler == "ParaDRAM" %}

-   `processID` -- the ID of the processor that has successfully sampled the current state (point) from the user-provided mathematical objective function,  
    {% include note.html content='This information is only relevant for parallel simulations. However, to keep the contents of the chain files consistent with each other, this information is also reported in the output chain files of serial simulations.' %}  
-   `delayedRejectionStage` -- the delayed-rejection stage at which the newly sampled state has been accepted,  
-   `meanAcceptanceRate` -- the mean acceptance rate of the sampler up to the newly-sampled state at a given row,  
-   `proposalAdaptation` -- the amount of adaptation performed on the sampler's proposal distribution, which is **a number between zero and one**, with one indicating extreme adaptation being performed at that stage in the simulation on the proposal distribution and, a value of zero indicating absolutely no adaptation being performed since the last sampled state,  
    {% include tip.html content='A well-behaving ParaDRAM simulation should exhibit an adaptation measure that starts at large values close to one and decays fast (within a few hundreds or thousands of newly-sampled points) to tiny values ($\ll0.01$) comparable to the precision of a 32-bit real/float and less ( $\lessapprox10^{-3}$ ). Ideally, this continuous decrease should resemble a power-law decay.' %}  
-   `burninLocation` -- the runtime estimate of the number of sampled states (from the beginning of the simulation) that are potentially non-useful and must be discarded as the **burnin period**,  
-   `sampleWeight` -- the number of times each newly-sampled point is repeated in the Markov chain before the next candidate state is accepted,  
    {% include tip.html content='The value represented by `sampleWeight` is, by definition, always an integer $\ge1$.' %}  
-   `sampleLogFunc` -- the value of the user-provided mathematical objective function at the currently-sampled state,  
-   followed by a row-wise vector of values that represent the current state that has been sampled. The variable names corresponding to each of these state values can be specified via the input specification attribute `domainAxisName` as described [here](../../{{pmSampler|downcase}}/specifications/#domainaxisname){:target="_blank"}.  

Here is an example snippet from the contents of a typical ParaDRAM chain file,  

```text
processID,delayedRejectionStage,meanAcceptanceRate,proposalAdaptation,burninLocation,sampleWeight,sampleLogFunc,sampleVariable1,sampleVariable2
1,0,.88253409849043021E-01,.0000000000000000,1,18,-6661.3317058445919,118.01753854159099,5.5487917511652096,118.80997505960300
3,0,.80642984387170699E-01,.0000000000000000,1,11,-6662.0952096861010,117.79618249468358,5.4936144718729913,118.57124540688957
11,0,.61746061174130930E-01,.0000000000000000,1,21,-6663.8532414945439,118.18713338111942,5.5828295535451078,118.97803516340616
6,0,.81607474204830915E-01,.0000000000000000,1,5,-6663.4173242973156,118.24855055054523,5.6551168673789398,119.04257546168272
...
```

{% include pm.sampling.precision.tip.md %}

{% endif %}

{% include note.html content='**Each row** in the output chain file represents information about a **uniquely-sampled point** during the simulation. **Each column** in the chain file represents information about **one attribute of the sampled point**.' %}  


