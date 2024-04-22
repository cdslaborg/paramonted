{% capture delimiterMessage %}By default, the simulation output files are assumed to be <b>comma-delimited</b> (that is, <b>Comma-Separated-Value (CSV)</b> file). If the delimiter used in the file is different from comma (<b><code>,</code></b>), we can specify the delimiter by passing it explicitly,{% endcapture %}
{% capture alternateMessage %}Alternatively, we could also specify both the filename and delimiter as attributes of the `pmpd` object and avoid passing them directly to the `pmpd.readSample()` method,{% endcapture %}

{% if include.lang == "MATLAB" %}
{% assign rootURL = "https://github.com/cdslaborg/paramontex/raw/main/MATLAB/mlx/sampling_multivariate_normal_distribution_via_paradram/out" %}
{% assign examplesURL = "../mlx" %}
{% elsif include.lang == "Python" %}
{% assign rootURL = "https://github.com/cdslaborg/paramontex/raw/main/Python/Jupyter/sampling_multivariate_normal_distribution_via_paradram/out" %}
{% assign examplesURL = "../jupyter" %}
{% endif %}

{% capture doneMessage %}**Done.** The rest of the postprocessing of the simulation data, such as statistical analysis or plotting, is identical to the {{include.lang}} examples provided on [this page]({{examplesURL}}){:target="_blank"}.{% endcapture %}

You can post-process and analyze an existing ParaMonte simulation in {{include.lang}} **irrespective of when and how this simulation was generated** by any of the available ParaMonte library interfaces (e.g., **C/C++, Fortran, MATLAB, Python, ...**). This is one of the many unique features of the ParaMonte library.  

The ParaMonte {{include.lang}} library is particularly suitable for post-processing the output of large-scale high-performance ParaMonte simulations performed in C/C++/Fortran.  

## Post-processing an existing ParaDRAM simulation  

To analyze an existing ParaDRAM simulation, all you need to do is to specify the full-filename or minimally, the prefix by which the simulation output filenames have been created. For example, suppose we want to reanalyze this output [mvn_serial_process_1_sample.txt]({{rootURL}}/mvn_serial_process_1_sample.txt){:target="_blank"} sample file from an [existing simulation]({{rootURL}}){:target="_blank"}. All that we need to do to read this file, is to pass the local path to this file on your system to an instance of the ParaDRAM class of the ParaMonte {{include.lang}} library.  

Suppose we have stored this file in `"./temp/mvn_serial_process_1_sample.txt"` locally on the system, with respect to the current working directory of the {{include.lang}} session. Then,     

{% if include.lang == "MATLAB" %}

```matlab  
addpath(genpath("./"),"-begin"); % add the ParaMonte library directories to MATLAB's list of search paths.
pm = paramonte(); % instantiate an object of class paramonte.
pmpd = pm.ParaDRAM(); % instantiate an object of class ParaDRAM.
pmpd.readSample("./temp/mvn_serial_process_1_sample.txt"); % read the downloaded sample file and store it in the newly-created pmpd.sampleList property.
head(pmpd.sampleList{1}.df) % this newly-created pmpd.sampleList MATLAB-cell property contains the contents of the sample file and other relevant tools.
```  

{% include tip.html content="The post-processing methods of the ParaMonte MATLAB library, such as **`readSample()`**, **`readChain()`**, **`readMarkovChain()`**, **`readProgress()`**, **`readRestart()`**, **`readReport()`** of the ParaDRAM sampler, can also take a URL as the input path to the file. In such case, a temporary copy of the file will be downloaded from the web and removed once its contents are parsed by the parser method." %}

{{doneMessage}}  

{{site.data.alerts.tip}}
{{delimiterMessage}}  
{% highlight matlab %}
addpath(genpath("./"),"-begin"); % add the ParaMonte library directories to MATLAB's list of search paths.
pm = paramonte(); % instantiate an object of class paramonte.
pmpd = pm.ParaDRAM(); % instantiate an object of class ParaDRAM.
ppmpd.readSample("./temp/mvn_serial_process_1_sample.txt", ","); % read the downloaded sample file by explicitly passing the delimiter used in the sample file.
{% endhighlight %}  
{{site.data.alerts.end}}

**Alternative method:**  

{{alternateMessage}}  
```matlab  
addpath(genpath("./"),"-begin"); % add the ParaMonte library directories to MATLAB's list of search paths.
pm = paramonte(); % instantiate an object of class paramonte.
pmpd = pm.ParaDRAM(); % instantiate an object of class ParaDRAM.
pmpd.spec.outputFileName = "./temp/mvn_serial_process_1_sample.txt";
pmpd.spec.outputSeparator = ",";
pmpd.readSample(); % read the downloaded sample file and store it in the newly-created pmpd.sampleList property.
head(pmpd.sampleList{1}.df) % this newly-created MATLAB-cell property now contains the contents of the sample file and other relevant tools.
```  

{% elsif include.lang == "Python" %}

```python
import paramonte as pm
pmpd = pm.ParaDRAM() # instantiate an object of class ParaDRAM.
pmpd.readSample(file = "./temp/mvn_serial_process_1_sample.txt") # read the downloaded sample file and store it in the newly-created pmpd.sampleList property.
pmpd.sampleList[0].df.head() # this newly-created pmpd.sampleList Python-list property contains the contents of the sample file and other relevant tools.
```

{{doneMessage}}  

{{site.data.alerts.tip}}
{{delimiterMessage}}  
{% highlight python %}
import paramonte as pm
pmpd = pm.ParaDRAM() # instantiate an object of class ParaDRAM.
pmpd.readSample(file = "./temp/mvn_serial_process_1_sample.txt", delimiter = ",") # read the downloaded sample file by explicitly passing the delimiter used in the sample file.
{% endhighlight %}  
{{site.data.alerts.end}}

**Alternative method:**  

{{alternateMessage}}  
```python  
import paramonte as pm
pmpd = pm.ParaDRAM() # instantiate an object of class ParaDRAM.
pmpd.spec.outputFileName = "./temp/mvn_serial_process_1_sample.txt"
pmpd.spec.outputSeparator = ","
pmpd.readSample() # read the downloaded sample file and store it in the newly-created pmpd.sampleList property.
pmpd.sampleList[0].df.head() # this newly-created pmpd.sampleList Python-list property contains the contents of the sample file and other relevant tools.
```  

{% endif %}

