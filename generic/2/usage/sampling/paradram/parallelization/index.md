---
title: "The ParaDRAM simulation parallelization tips"
#tags: [C, C++, Fortran, MATLAB, python, interoperation, ParaDRAM, API, parallel, parallelization]
keywords: 
    Python
    ParaDRAM
    Fortran
    C
    C++
    output
    sample
    chain
    report
    restart
    progress
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: April 1, 2021
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>

{% assign pmSampler = "ParaDRAM" %}

## General parallelization tips  

1.  Regardless of the programming language, always code your simulations for single-core serial runs first.  
1.  Once you test your program's functionality and results accuracy in serial mode, inspect your simulations' runtime for potential speedup benefits via parallel computing.  
1.  The runtime of a single objective function call in your simulation problem must be significantly more than the average inter-process communication time to see any benefits from going parallel.  
    {% include tip.html content="Given the available contemporary technologies, parallel communications typically require $1-1000\mu s$. This estimate depends heavily on the CPU, network architecture, and the number of cores involved in the inter-process communications. Therefore, the cost of the objective function call must be significantly more than $1-1000\mu s$ to see any benefits from parallelization of the simulation." %}  

## ParaDRAM parallelization tips  

By default, the ParaDRAM sampler utilizes a Fork-Join parallelism paradigm where multiple proposals are generated and inspected for acceptance at each MCMC iteration. This is in addition to and different from the **perfect-parallelism** paradigm whereby multiple MCMC chains are simulated simultaneously in parallel independently of each other. The choice of parallelism paradigm can be changed from the default Fork-Join via the input simulation specification [parallelism](../specifications/#parallelism){:target="_blank"}.  

### Running in parallel to check for MCMC convergence  

Use the **perfect parallelism** paradigm (corresponding to the input specification `parallelism = "multi chain"`) if you worry the objective function might be multi-modal. Upon concluding the simulation, the sampler will automatically perform and report the results of a series of [Kolmogorov-Smirnov (KS) tests](https://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test){:target="_blank"} for lack of convergence of the multiple chains to the same global mode (peak) of the objective function. The evidence for multi-modality will show itself as tiny KS-test probabilities. Typically, [KS-test probabilities larger than $\sim0.01$](https://github.com/cdslaborg/paramontex/blob/f4f02fc9bde5407d9348984f2762a3fd05cee6f7/Python/Jupyter/sampling_multivariate_normal_distribution_via_paradram_parallel/out/mvn_parallel_multiChain_process_1_report.txt#L1616){:target="_blank"} indicate no evidence for lack of convergence of the multiple parallel chains to the same global peak in the domain of the objective function: The smaller the probabilities, the more substantial the evidence for lack of convergence.  

### Running in parallel for simulation speedup  

Use the **fork-join parallelism** paradigm (corresponding to the input specification `parallelism = "single chain"`) to reduce the simulation runtime. For this to happen, the runtime of a single objective function call must be significantly longer than inter-process communications. If you are unsure of the runtime cost of an objective function call, you can run a short simulation with the ParaDRAM sampler to generate the desired information for production decision-making. Upon concluding each simulation, the ParaDRAM sampler generates a [comprehensive analysis](https://github.com/cdslaborg/paramontex/blob/f4f02fc9bde5407d9348984f2762a3fd05cee6f7/Python/Jupyter/sampling_multivariate_normal_distribution_via_paradram_parallel/out/mvn_parallel_singleChain_process_1_report.txt#L1256){:target="_blank"} of the parallel performance of the simulation in the [output report file](https://github.com/cdslaborg/paramontex/blob/main/Python/Jupyter/sampling_multivariate_normal_distribution_via_paradram_parallel/out/mvn_parallel_singleChain_process_1_report.txt){:target="_blank"} of the simulation.  

The output simulation performance analysis contains the predicted optimal number of processors for the parallel simulation under the given simulation setup and objective function. Run a short trial simulation with your best guess for the optimal number of processors. Then use [the predictions in the simulation output](https://github.com/cdslaborg/paramontex/blob/f4f02fc9bde5407d9348984f2762a3fd05cee6f7/Python/Jupyter/sampling_multivariate_normal_distribution_via_paradram_parallel/out/mvn_parallel_singleChain_process_1_report.txt#L1338){:target="_blank"} to adjust the number of processors for the optimal efficiency in the production run.  

#### Factors affecting the parallel runtime efficiency  

The efficiency of a parallel ParaDRAM simulation depends heavily on two factors:  
1.  The time cost of the objective function call (as compared to the inter-process communication cost).  
1.  The efficiency of the MCMC sampler (i.e., the average acceptance rate). **As a rule of thumb for maximum efficiency**, the number of processors should be set to a number roughly equal to or less than the inverse of the mean efficiency (i.e., the mean acceptance rate) of the MCMC sampler. This holds only if a single objective function call costs significantly more than the inter-process communication cost. In other words, this is the ideal scenario.  
    {% include tip.html content = "Although the optimal average MCMC acceptance rate is generally around $0.234$, lowering the efficiency to increase the number of parallel cores -- and therefore, the parallelization efficiency -- is often a reasonably good strategy. The average MCMC acceptance rate of a given ParaDRAM simulation can be controlled via the input simulation specification [targetAcceptanceRate](../specifications/#targetacceptancerate){:target='_blank'} or more appropriately, adjusted by varying the value of [proposalScale](../specifications/#proposalscale){:target='_blank'} property of the simulation." %}

{% include askme.html %}
{% include links.html %}
