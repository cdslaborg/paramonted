---
title: "The ParaMonte :: MATLAB API documentation"
#tags: [matlab, api, documentation]
keywords: 
        matlab
        api
        documentation
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: October 17, 2020
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>

+   All functions, classes, and their arguments, attributes, and methods within the ParaMonte :: MATLAB library are well documented in the source files.  
+   Unlike Python, no high-quality MATLAB documentation generator currently exists for MATLAB applications.  
+   However, the MATLAB software provides a minimal builtin documentation generator (i.e., `doc` command) for individual MATLAB functions and classes.  

<br>
**Accessing the ParaMonte :: MATLAB API documentation from within MATLAB**  
<br>

The easiest way to get help for any entity within the ParaMonte :: MATLAB library is the to use MATLAB's intrinsic function `doc` followed by the name of the object.  

For example, to get help on the `paramonte` class, try,  

```matlab  
doc paramonte
```  

or simply open the source file to read the source code documentation,  

```matlab  
open paramonte
```  

Note that the path to the root directory of ParaMonte :: MATLAB should be added to your MATLAB path before using the above command.

<br>
**Accessing the ParaMonte samplers' documentation**  
<br>

To see the documentation for the ParaMonte sampler classes or their attributes or methods, for example, the `ParaDRAM` sampler, try,  

```matlab  
pm = paramonte();
pmpd = pm.ParaDRAM();
% access ParaDRAM sampler's documentation
doc pmpd
% access ParaDRAM sampler's documentation for the attribute buildMode
doc pmpd.buildMode
```  

<br>
**Accessing the ParaMonte postprocessing tools' documentation**  
<br>

To see the documentation for the ParaMonte postprocessing tools, for example, the `readChain()` parser method of the `ParaDRAM` sampler, try,  

```matlab  
pm = paramonte();
pmpd = pm.ParaDRAM();
doc pmpd.readChain
doc pmpd.readSample
doc pmpd.readReport
doc pmpd.readRestart
doc pmpd.readProgress
doc pmpd.readMarkovChain
```  

or simply open the source file to read the source code documentation,  

```matlab  
open readChain
open readSample
open readReport
open readRestart
open readProgress
open readMarkovChain
```  

<br>
**Accessing the ParaMonte visualization tools' documentation**  
<br>

Suppose you have read the contents of a ParaDRAM sampler's output chain file via its `readChain` method. To access the documentation for the output of this method, try,  

```matlab  
pm = paramonte();
pmpd = pm.ParaDRAM();
pmpd.readChain("./thisChainFile_chain.txt"); % read the contents of the specified file.
chain = pmpd.chainList{1}; % store the output of readChain in the variable `chain`.
% get help on the `readChain()` output
doc chain
```  

To get help on the visualization tools attached to chain, for example `lineScatter3` or `grid` plot, try,  

```matlab  
lineScatter3 = chain.plot.lineScatter3;
doc lineScatter3
grid = chain.plot.grid;
doc grid
```  

{% include askme.html %}
{% include links.html %}

