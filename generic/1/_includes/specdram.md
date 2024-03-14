
### adaptiveUpdatePeriod  

```text
Every adaptiveUpdatePeriod calls to the objective function, the parameters of the proposal distribution 
will be updated. The variable adaptiveUpdatePeriod must be a positive non-zero integer. The smaller the 
value of adaptiveUpdatePeriod, the easier it will be for the {{include.sampler}} kernel to adapt the proposal 
distribution to the covariance structure of the objective function. However, this will happen at the 
expense of slower simulation runtime as the adaptation process can become computationally expensive, 
in particular, for very high dimensional objective functions (ndim >> 1). The larger the value of 
adaptiveUpdatePeriod, the easier it will be for the {{include.sampler}} kernel to keep the sampling efficiency 
close to the requested target acceptance rate range (if specified via the input variable 
targetAcceptanceRate). However, too large values for adaptiveUpdatePeriod will only delay the adaptation 
of the proposal distribution to the global structure of the objective function that is being sampled. 
If adaptiveUpdatePeriod >= chainSize, then no adaptive updates to the proposal distribution will be 
made. The default value is 4 * ndim, where ndim is the dimension of the domain of the objective 
function to be sampled.
```  
See also the input simulation specification 
[adaptiveUpdateCount](#adaptiveupdatecount), 
[greedyAdaptationCount](#greedyadaptationcount).  
<br>

### adaptiveUpdateCount  

```text
adaptiveUpdateCount represents the total number of adaptive updates that will be made to the parameters 
of the proposal distribution, to increase the efficiency of the sampler thus increasing the sampling 
efficiency of {{include.sampler}}. Every adaptiveUpdatePeriod number of calls to the objective function, the 
parameters of the proposal distribution will be updated until either the total number of adaptive 
updates reaches the value of adaptiveUpdateCount. This variable must be a non-negative integer. As 
a rule of thumb, it may be appropriate to set the input variable chainSize > 2 * adaptiveUpdatePeriod 
* adaptiveUpdateCount, to ensure ergodicity and stationarity of the MCMC sampler. If adaptiveUpdateCount=0, 
then the proposal distribution parameters will be fixed to the initial input values throughout the 
entire MCMC sampling. The default value is 1073741823.
```  
See also the input simulation specification 
[adaptiveUpdatePeriod](#adaptiveupdateperiod), 
[greedyAdaptationCount](#greedyadaptationcount).  
<br>

### greedyAdaptationCount  

```text
If greedyAdaptationCount is set to a positive integer then the first greedyAdaptationCount number of 
the adaptive updates of the sampler will be made using only the 'unique' accepted points in the MCMC 
chain. This is useful, for example, when the function to be sampled by {{include.sampler}} is high dimensional, in 
which case, the adaptive updates to {{include.sampler}}'s sampler distribution will less likely lead to numerical 
instabilities, for example, a singular covariance matrix for the multivariate proposal sampler. The 
variable greedyAdaptationCount must be a non-negative integer, and not larger than the value of 
adaptiveUpdateCount. If it is larger, it will be automatically set to adaptiveUpdateCount for the 
simulation. The default value is 0.
```  
See also the input simulation specification 
[adaptiveUpdatePeriod](#adaptiveupdateperiod), 
[adaptiveUpdateCount](#adaptiveupdatecount).  
<br>

### burninAdaptationMeasure  

```text
burninAdaptationMeasure is a 64-bit real number between 0 and 1, representing the adaptation measure 
threshold below which the simulated Markov chain will be used to generate the output {{include.sampler}} sample. 
In other words, any point in the output Markov Chain that has been sampled during significant adaptation 
of the proposal distribution (as determined by burninAdaptationMeasure) will not be included in the 
construction of the final {{include.sampler}} output sample. This is to ensure that the generation of the output 
sample will be based on the part of the simulated chain that is practically guaranteed to be Markovian 
and ergodic. If this variable is set to 0, then the output sample will be generated from the part of 
the chain where no proposal adaptation has occurred. This non-adaptive or minimally-adaptive part of 
the chain may not even exist if the total adaptation period of the simulation (as determined by 
adaptiveUpdateCount and adaptiveUpdatePeriod input variables) is longer than the total length of the 
output MCMC chain. In such cases, the resulting output sample may have a zero size. In general, when 
good mixing occurs (e.g., when the input variable chainSize is very large) any specific value of 
burninAdaptationMeasure becomes practically irrelevant. The default value for burninAdaptationMeasure 
is 1.00000000000000, implying that the entire chain (with the exclusion of an initial automatically-determined 
burnin period) will be used to generate the final output sample.
```
<br>

### delayedRejectionCount  

```text
0 <= delayedRejectionCount <= 1000 is an integer that represents the total number of stages for which 
rejections of new proposals will be tolerated by {{include.sampler}} before going back to the previously accepted 
point (state). Possible values are:

    delayedRejectionCount = 0

            indicating no deployment of the delayed rejection algorithm.

    delayedRejectionCount > 0

            which implies a maximum delayedRejectionCount number of rejections will be tolerated.

For example, delayedRejectionCount = 1, means that at any point during the sampling, if a proposal 
is rejected, {{include.sampler}} will not go back to the last sampled state. Instead, it will continue to 
propose a new state from the last rejected proposal. If the new state is again rejected based on the rules of 
{{include.sampler}}, then the algorithm will not tolerate further rejections, because the maximum number of 
rejections to be tolerated has been set by the user to be delayedRejectionCount = 1. The algorithm 
then goes back to the original last-accepted state and will begin proposing new states from that 
location. The default value is delayedRejectionCount = 0.
```  
See also the input simulation specification 
[delayedRejectionScaleFactorVec](#delayedrejectionscalefactorvec).  
<br>

### delayedRejectionScaleFactorVec  

```text
delayedRejectionScaleFactorVec is a real-valued positive vector of length (1:delayedRejectionCount) 
by which the covariance matrix of the proposal distribution of {{include.sampler}} sampler is scaled when the 
Delayed Rejection (DR) scheme is activated (by setting delayedRejectionCount>0). At each ith stage 
of the DR process, the proposal distribution from the last stage is scaled by the factor 
delayedRejectionScaleFactorVec(i). Missing elements of the delayedRejectionScaleFactorVec in the 
input to {{include.sampler}} will be set to the default value. The default value at all stages is 0.5^(1/ndim) 
where ndim is the number of dimensions of the domain of the objective function. This default value effectively 
reduces the volume of the covariance matrix of the proposal distribution by half compared to the last DR stage.
```  
See also the input simulation specification 
[delayedRejectionCount](#delayedrejectioncount).  
<br>
