
### outputchainsize 

```text
outputChainSize determines the number of non-refined, potentially auto-correlated, but unique, samples 
drawn by the MCMC sampler before stopping {{include.sampler}}. For example, if you specify outputChainSize = 10000, 
then 10000 unique sample points (with no duplicates) will be drawn from the target objective function 
that the user has provided. The input value for outputChainSize must be a positive integer of a minimum value 
ndim + 1 or larger, where ndim is the number of dimensions of the domain of the objective function to be sampled. 
Note that outputChainSize is different from and always smaller than the length of the constructed MCMC chain. 
The default value is 100000.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[sampleSize](#samplesize).  
{% endif %}
<br>

### proposalStartDomainCubeLimitLower  

```text
proposalStartDomainCubeLimitLower represents the lower boundaries of the cubical domain from which 
the starting point(s) of the MCMC chain(s) will be initialized randomly (only if requested via the 
input variable proposalStartRandomized. This happens only when some or all of the elements of the 
input variable StartPoint are missing. In such cases, every missing value of input StartPoint will 
be set to the center point between proposalStartDomainCubeLimitLower and RandomStartPointDomainUpperLimit 
in the corresponding dimension. If proposalStartRandomized=TRUE (or True, true, t, all case-INsensitive), 
then the missing elements of StartPoint will be initialized to values drawn randomly from within the 
corresponding ranges specified by the input variable proposalStartDomainCubeLimitLower. As an input 
variable, proposalStartDomainCubeLimitLower is an ndim-dimensional vector of 64-bit real numbers, 
where ndim is the number of variables of the objective function. It is also possible to assign only 
select values of proposalStartDomainCubeLimitLower and leave the rest of the components to be 
assigned the default value. This is POSSIBLE ONLY when proposalStartDomainCubeLimitLower is defined 
inside the input file to {{include.sampler}}. For example, having the following inside the input file, 

    proposalStartDomainCubeLimitLower(3:5) = -100

            will only set the lower limits of the third, fourth, and the fifth dimensions to -100, 
            or,

    proposalStartDomainCubeLimitLower(1) = -100, proposalStartDomainCubeLimitLower(2) = -1.e6 

            will set the lower limit on the first dimension to -100, and 1.e6 on the second dimension, 
            or,

    proposalStartDomainCubeLimitLower = 3*-2.5e100

            will only set the lower limits on the first, second, and the third dimensions to -2.5*10^100, 
            while the rest of the lower limits for the missing dimensions will be automatically set 
            to the default value.

The default values for all elements of proposalStartDomainCubeLimitLower are taken from the 
corresponding values in the input variable domainCubeLimitLower.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[proposalStartDomainCubeLimitUpper](#randomstartpointdomainupperlimitvec), 
[proposalStartRandomized](#randomstartpointrequested).  
{% endif %}
<br>

### proposalStartDomainCubeLimitUpper  

```text
proposalStartDomainCubeLimitUpper represents the upper boundaries of the cubical domain from which 
the starting point(s) of the MCMC chain(s) will be initialized randomly (only if requested via the 
input variable proposalStartRandomized. This happens only when some or all of the elements of the 
input variable StartPoint are missing. In such cases, every missing value of input StartPoint will 
be set to the center point between proposalStartDomainCubeLimitUpper and proposalStartDomainCubeLimitLower 
in the corresponding dimension. If proposalStartRandomized=TRUE (or True, true, t, all case-INsensitive), 
then the missing elements of StartPoint will be initialized to values drawn randomly from within the 
corresponding ranges specified by the input variable proposalStartDomainCubeLimitUpper. As an input 
variable, proposalStartDomainCubeLimitUpper is an ndim-dimensional vector of 64-bit real numbers, 
where ndim is the number of variables of the objective function. It is also possible to assign only 
select values of proposalStartDomainCubeLimitUpper and leave the rest of the components to be 
assigned the default value. This is POSSIBLE ONLY when proposalStartDomainCubeLimitUpper is defined 
inside the input file to {{include.sampler}}. For example, having the following inside the input file, 

    proposalStartDomainCubeLimitUpper(3:5) = -100

            will only set the upper limits of the third, fourth, and the fifth dimensions to -100, 
            or,

    proposalStartDomainCubeLimitUpper(1) = -100, proposalStartDomainCubeLimitUpper(2) = -1.e6 

            will set the upper limit on the first dimension to -100, and 1.e6 on the second dimension, 
            or,

    proposalStartDomainCubeLimitUpper = 3*-2.5e100

            will only set the upper limits on the first, second, and the third dimensions to -2.5*10^100, 
            while the rest of the upper limits for the missing dimensions will be automatically set 
            to the default value.

The default values for all elements of proposalStartDomainCubeLimitUpper are taken from the 
corresponding values in the input variable domainCubeLimitUpper.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[proposalStartDomainCubeLimitLower](#randomstartpointdomainlowerlimitvec), 
[proposalStartRandomized](#randomstartpointrequested).  
{% endif %}
<br>

### proposalStart  

```text
proposalStart is a 64bit real-valued vector of length ndim (the dimension of the domain of the input 
objective function). For every element of proposalStart that is not provided as input, the default 
value will be the center of the domain of proposalStart as specified by domainCubeLimitLower 
and domainCubeLimitUpper input variables. If the input variable proposalStartRandomized=TRUE 
(or true or t, all case-INsensitive), then the missing elements of proposalStart will be initialized 
to values drawn randomly from within the corresponding ranges specified by the input variables 
proposalStartDomainCubeLimitLower and proposalStartDomainCubeLimitUpper.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[proposalStartRandomized](#randomstartpointrequested).  
{% endif %}
<br>

### proposalStartRandomized  

```text
A logical (boolean) variable. If true (or .true. or TRUE or .t. from within an input file), then the 
variable proposalStart will be initialized randomly for each MCMC chain that is to be generated by 
the sampler. The random values will be drawn from the specified or the default domain of proposalStart, 
given by RandomStartPointDomain variable. Note that the value of proposalStart, if provided, has precedence 
over random initialization. In other words, for every element of proposalStart that is not provided 
as input only that element will initialized randomly if proposalStartRandomized=TRUE. Also, note 
that even if proposalStart is randomly initialized, its random value will be deterministic between 
different independent runs of {{include.sampler}} if the input variable randomSeed is provided by the user. The 
default value is FALSE.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[proposalStart](#startpointvec), 
[proposalStartDomainCubeLimitLower](#randomstartpointdomainlowerlimitvec), 
[proposalStartDomainCubeLimitUpper](#randomstartpointdomainupperlimitvec).  
{% endif %}
<br>

### sampleRefinementCount  

```text
When sampleSize < 0, the integer variable sampleRefinementCount dictates the maximum number of 
times the MCMC chain will be refined to remove the autocorrelation within the output MCMC sample. 
For example,

    if sampleRefinementCount = 0,

            no refinement of the output MCMC chain will be performed, the resulting MCMC sample will 
            simply correspond to the full MCMC chain in verbose format (i.e., each sampled state has 
            a weight of one).

    if sampleRefinementCount = 1,

            the refinement of the output MCMC chain will be done only once if needed, and no more, 
            even though there may still exist some residual autocorrelation in the output MCMC sample. 
            In practice, only one refinement of the final output MCMC Chain should be enough to remove 
            the existing autocorrelations in the final output sample. Exceptions occur when the 
            Integrated Autocorrelation (IAC) of the output MCMC chain is comparable to or larger than 
            the length of the chain. In such cases, neither the BatchMeans method nor any other method 
            of IAC computation will be able to accurately compute the IAC. Consequently, the samples 
            generated based on the computed IAC values will likely not be i.i.d. and will still be 
            significantly autocorrelated. In such scenarios, more than one refinement of the MCMC 
            chain will be necessary. Very small sample size resulting from multiple refinements of 
            the sample could be a strong indication of the bad mixing of the MCMC chain and the output 
            chain may not contain true i.i.d. samples from the target objective function.

    if sampleRefinementCount > 1,

            the refinement of the output MCMC chain will be done for a maximum sampleRefinementCount 
            number of times, even though there may still exist some residual autocorrelation in the 
            final output MCMC sample.

    if sampleRefinementCount >> 1 (e.g., comparable to or larger than the length of the MCMC chain),

            the refinement of the output MCMC chain will continue until the integrated autocorrelation 
            of the resulting final sample is less than 2, virtually implying that an independent 
            identically-distributed (i.i.d.) sample has finally been obtained.

Note that to obtain i.i.d. samples from a multidimensional chain, {{include.sampler}} will, by default, use the 
maximum of Integrated Autocorrelation (IAC) among all dimensions of the chain to refine the chain. Note that 
the value specified for sampleRefinementCount is used only when the variable sampleSize < 0, otherwise, 
it will be ignored. The default value is sampleRefinementCount = 1073741823.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[sampleRefinementMethod](#outputsamplerefinementmethod).  
{% endif %}
<br>

### sampleRefinementMethod  

```text
sampleRefinementMethod is a string variable that represents the method of computing the Integrated 
Autocorrelation Time (IAC) to be used in {{include.sampler}} for refining the final output MCMC chain and sample. 
The string value must be enclosed by either single or double quotation marks when provided as input. 
Options that are currently supported include:

    sampleRefinementMethod = 'BatchMeans'

            This method of computing the Integrated Autocorrelation Time is based on the approach 
            described in SCHMEISER, B., 1982, Batch size effects in the analysis of simulation output, 
            Oper. Res. 30 556-568. The batch sizes in the BatchMeans method are chosen to be int(N^(2/3)) 
            where N is the length of the MCMC chain. As long as the batch size is larger than the 
            IAC of the chain and there are significantly more than 10 batches, the BatchMeans method 
            will provide reliable estimates of the IAC. 
            Note that the refinement strategy involves two separate phases of sample decorrelation. At the first stage, 
            the Markov chain is decorrelated recursively (for as long as needed) based on the IAC of its compact format, 
            where only the uniquely-visited states are kept in the (compact) chain. Once the Markov chain is refined 
            such that its compact format is fully decorrelated, the second phase of the decorrelation begins during which 
            the Markov chain is decorrelated based on the IAC of the chain in its verbose (Markov) format. This process 
            is repeated recursively for as long as there is any residual autocorrelation in the refined sample.

    sampleRefinementMethod = 'BatchMeans-compact'

            This is the same as the first case in the above, except that only the first phase of the sample refinement 
            described in the above will be performed, that is, the (verbose) Markov chain is refined only based on the 
            IAC computed from the compact format of the Markov chain. This will lead to a larger final refined sample. 
            However, the final sample will likely not be fully decorrelated. 

    sampleRefinementMethod = 'BatchMeans-verbose'

            This is the same as the first case in the above, except that only the second phase of the sample refinement 
            described in the above will be performed, that is, the (verbose) Markov chain is refined only based on the 
            IAC computed from the verbose format of the Markov chain. While the resulting refined sample will be fully 
            decorrelated, the size of the refined sample may be smaller than the default choice in the first case in the 
            above.

Note that in order to obtain i.i.d. samples from a multidimensional chain, the MCMC sampler will use the average of 
IAC among all dimensions of the chain to refine the chain. If the maximum, minimum, or the median of IACs is preferred 
add '-max' (or '-maximum'), '-min' (or '-minimum'), '-med' (or '-median'), respectively, to the value of 
sampleRefinementMethod. For example, 

    sampleRefinementMethod = 'BatchMeans-max'
or, 

    sampleRefinementMethod = 'BatchMeans-compact-max'

or, 

    sampleRefinementMethod = 'BatchMeans-max-compact'

Also, note that the value specified for sampleRefinementCount is used only when the variable sampleSize < 0, 
otherwise, it will be ignored. The default value is sampleRefinementMethod = 'BatchMeans'. 
Note that the input values are case-INsensitive and white-space characters are ignored.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[sampleRefinementCount](#outputsamplerefinementcount).  
{% endif %}
<br>

### proposalScale  

```text
proposalScale is a real-valued positive number (which must be given as string), by the square of which 
the covariance matrix of the proposal distribution of MCMC sampler is scaled. In other words, the 
proposal distribution will be scaled in every direction by the value of proposalScale. It can also be 
given in units of the string keyword 'gelman' (which is case-INsensitive) after the paper:

    Gelman, Roberts, and Gilks (1996): 'Efficient Metropolis Jumping Rules'.

The paper finds that the optimal scaling factor for a Multivariate Gaussian proposal distribution 
for the Metropolis-Hastings Markov Chain Monte Carlo sampling of a target Multivariate Normal 
Distribution of dimension ndim is given by:

    proposalScale = 2.38/sqrt(ndim)  ,  in the limit of ndim -> Infinity.

Multiples of the gelman scale factors are also acceptable as input and can be specified like the 
following examples:

    proposalScale = '1'

            multiplies the ndim-dimensional proposal covariance matrix by 1, essentially no change 
            occurs to the covariance matrix.

    proposalScale = "1"

            same as the previous example. The double-quotation marks act the same way as single-quotation 
            marks.

    proposalScale = '2.5'

            multiplies the ndim-dimensional proposal covariance matrix by 2.5.

    proposalScale = '2.5*Gelman'

            multiplies the ndim-dimensional proposal covariance matrix by 2.5 * 2.38/sqrt(ndim).

    proposalScale = "2.5 * gelman"

            same as the previous example, but with double-quotation marks. space characters are 
            ignored.

    proposalScale = "2.5 * gelman*gelman*2"

            equivalent to gelmanFactor-squared multiplied by 5.

Note, however, that the result of Gelman et al. paper applies only to multivariate normal proposal 
distributions, in the limit of infinite dimensions. Therefore, care must be taken when using Gelman's 
scaling factor with non-Gaussian proposals and target objective functions. Note that only the product 
symbol (*) can be parsed in the string value of proposalScale. The presence of other mathematical symbols 
or multiple appearances of the product symbol will lead to a simulation crash. Also, note that the 
prescription of an acceptance range specified by the input variable 'targetAcceptanceRate' will lead to 
the dynamic modification of the initial input value of proposalScale throughout sampling for 
proposalAdaptationCount times. The default proposalScale string-value is 'gelman' (for all proposals), 
which is subsequently converted to 2.38/sqrt(ndim).
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[targetAcceptanceRate](#targetacceptancerate).  
{% endif %}
<br>

### proposal  

```text
proposal is a string variable containing the name of the proposal distribution for the MCMC 
sampler. The string value must be enclosed by either single or double quotation marks when provided 
as input. Options that are currently supported include:

    proposal = 'normal'

            This is equivalent to the multivariate normal distribution, which is the most widely-used 
            proposal model along with MCMC samplers.

    proposal = 'uniform'

            The proposals will be drawn uniformly from within a ndim-dimensional ellipsoid whose 
            covariance matrix and scale are initialized by the user and optionally adaptively updated 
            throughout the simulation.

The default value is 'normal'.
```  
See also the input simulation specification 
[proposalCov](#proposalstartcovmat), 
[proposalCor](#proposalstartcormat), 
[proposalStd](#proposalstartstdvec).  
<br>

### proposalCov  

```text
proposalCov is a real-valued positive-definite matrix of size (ndim,ndim), where ndim is the 
dimension of the sampling space. It serves as the best-guess starting covariance matrix of the proposal 
distribution. To bring the sampling efficiency of {{include.sampler}} to within the desired requested range, 
the covariance matrix will be adaptively updated throughout the simulation, according to the user's 
requested schedule. If proposalCov is not provided by the user or it is completely missing 
from the input file, its value will be automatically computed via the input variables proposalCor 
and proposalStd (or via their default values, if not provided). 
The default value of proposalCov is an ndim-by-ndim Identity matrix.
```  
See also the input simulation specification 
[proposal](#proposalmodel), 
[proposalCor](#proposalstartcormat), 
[proposalStd](#proposalstartstdvec).  
<br>

### proposalCor  

```text
proposalCor is a real-valued positive-definite matrix of size (ndim,ndim), where ndim is the 
dimension of the sampling space. It serves as the best-guess starting correlation matrix of the 
proposal distribution used by {{include.sampler}}. It is used (along with the input vector proposalStd) 
to construct the covariance matrix of the proposal distribution when the input covariance matrix is 
missing in the input list of variables. If the covariance matrix is given as input to {{include.sampler}}, any 
input values for proposalCor, as well as proposalStd, will be automatically ignored 
by {{include.sampler}}. As input to {{include.sampler}}, the variable proposalCor along with proposalStd 
is especially useful in situations where obtaining the best-guess covariance matrix is not trivial. 
The default value of proposalCor is an ndim-by-ndim Identity matrix.
```  
See also the input simulation specification 
[proposal](#proposalmodel), 
[proposalCov](#proposalstartcovmat), 
[proposalStd](#proposalstartstdvec).  
<br>

### proposalStd  

```text
proposalStd is a real-valued positive vector of length ndim, where ndim is the dimension of 
the sampling space. It serves as the best-guess starting Standard Deviation of each of the components 
of the proposal distribution. If the initial covariance matrix (proposalCov) is missing as 
an input variable to {{include.sampler}}, then proposalStd (along with the input variable proposalCor) 
will be used to construct the initial covariance matrix of the proposal distribution of the MCMC 
sampler. However, if proposalCov is present as an input argument to {{include.sampler}}, then the input 
proposalStd along with the input proposalCor will be completely ignored and the input 
value for proposalCov will be used to construct the initial covariance matrix of the proposal 
distribution of {{include.sampler}}. The default value of proposalStd is a vector of unit values (i.e., 
ones) of length ndim.
```  
See also the input simulation specification 
[proposal](#proposalmodel), 
[proposalCov](#proposalstartcovmat), 
[proposalCor](#proposalstartcormat).  
<br>
