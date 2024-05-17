---
title: "The ParaDRAM simulation restart functionality"
#tags: [C, C++, Fortran, python, input_file, ParaDRAM, API]
keywords: 
    restart
    ParaDRAM
    C
    C++
    Fortran
    Python
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: March 14, 2024
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{{site.data.alerts.tip}}
{{site.data.alerts.end}}
{% endcomment %}
<br>

{% assign pmSampler = "ParaDRAM" %}

{% include pm.sampling.restart.functionality.md %}

## How to restart an interrupted {{pmSampler}} simulation?  


### **Short answer**  

Simply **rerun the simulation with the same configuration** (i.e., the same input specifications). Most importantly, ensure the value of the input variable `outputFileName` is set to **the same output filename's prefix** by which the simulation output files are generated.  

{% include important.html content="We recommend that you always set a value for the input specification variable **`outputFileName`**. If you do so and the simulation gets interrupted for any reason, **all you need to do to restart your simulation is to rerun it**." %}

{% include warning.html content="If your simulation is in parallel, make sure to **restart the simulation with the same number of processors** as you used in the old simulation. Otherwise, there is no guarantee to obtain fully-deterministic or accurate results." %}

### **Long answer**  

To understand the mechanism behind the restart functionality of the {{pmSampler}} sampler, you need to know the following facts about its inner workings:  

-   Every time a {{pmSampler}} simulation begins, the sampler checks for the value of the simulation specification variable [outputFileName](../../{{pmSampler|downcase}}/specifications/#outputfilename){:target="_blank"} provided by the user. This serves as **the common prefix in the names of all files** that are output by the {{pmSampler}} sampler.  
    -   For example, a user-input value of `outputFileName=./out/temp` will lead to the generation of a set of {{pmSampler}} output files with the following names (by the first processor in the simulation),  
        ```
        temp_run1_pid1_progress.txt
        temp_run1_pid1_restart.txt
        temp_run1_pid1_report.txt
        temp_run1_pid1_sample.txt
        temp_run1_pid1_chain.txt
        ```  
        which are all stored in the folder `./out/` relative to the current working directory from which you called the {{pmSamapler}} sampler.  
    -   If the value of `outputFileName` ends with a forward- (`/`) or backward- (`\`) slash on Windows OS or with a forward-slash (`/`) on Linux and Darwin (Mac) OS, then the user-provided value will be treated as the folder name in which the output files will have to be stored. In this case, the {{pmSampler}} sampler will assign a common random filename-prefix to all of the generated output files (which always starts with `ParaDRAM_`), for example, `ParaDRAM_20240312_060333_408` in the following filenames,  
        ```
        ParaDRAM_20240312_060333_408_run1_pid1_progress.txt
        ParaDRAM_20240312_060333_408_run1_pid1_restart.txt
        ParaDRAM_20240312_060333_408_run1_pid1_report.txt
        ParaDRAM_20240312_060333_408_run1_pid1_sample.txt
        ParaDRAM_20240312_060333_408_run1_pid1_chain.txt
        ```  
-   Every time a {{pmSampler}} simulation begins, the sampler either gets the output files' prefix from the user or generates a fresh new prefix as described above. Then, it checks for the existence of any collection of output files with this prefix in the simulation's working directory. Then,  
    -   **Fresh simulation** -- If **none of the output files already exist**, the simulation begins as a fresh new simulation.  
    -   **Simulation crash** -- If **all** of the **output files** with the given prefix **already exist** in the output path, the simulation will abruptly stop with an error message stating that it cannot overwrite an already existing simulation.  
    -   **Restart mode** -- If **all output files exist** with the given prefix **except the sample file** (suffixed with `_sample.txt`), then the {{pmSampler}} sampler assumes that this simulation has prematurely ended in the past and that it must restart this unfinished simulation. The reason for this assumption is the following,    
        {{site.data.alerts.tip}}
        When a {{pmSampler}} simulation ends prematurely, the interruption virtually always happens before the {{pmSampler}} sampler reaches the final stage of generating the <a href="../../{{pmSampler|downcase}}/output/#the-output-sample-file" target="_blank">output sample file</a>.
        {{site.data.alerts.end}}
    <br>
    **Scenario 1** -- Suppose you set the specification variable `outputFileName = "./output/MyRestartSimulation"`. Upon starting the simulation, the sampler will generate the following output files ( there will be more than one group of files if [parallelism](../../{{pmSampler|downcase}}/specifications/#parallelism){:target="_blank"} = `"multiChain"` ),  
    ```
    MyRestartSimulation_run1_pid1_progress.txt
    MyRestartSimulation_run1_pid1_restart.txt
    MyRestartSimulation_run1_pid1_report.txt
    MyRestartSimulation_run1_pid1_sample.txt
    MyRestartSimulation_run1_pid1_chain.txt
    ```  
    Then, the simulation gets interrupted and ends prematurely for some reason. **To restart this simulation, just rerun the simulation as done the first time**.   
    <br>
    **Scenario 2** -- Suppose you do not provide an input value for the specification variable `outputFileName`, in which case, the sampler will assign a random prefix to the output files, like the following,  
    ```
    ParaDRAM_20240312_060333_408_run1_pid1_progress.txt
    ParaDRAM_20240312_060333_408_run1_pid1_restart.txt
    ParaDRAM_20240312_060333_408_run1_pid1_report.txt
    ParaDRAM_20240312_060333_408_run1_pid1_sample.txt
    ParaDRAM_20240312_060333_408_run1_pid1_chain.txt
    ```  
    You run the simulation which is then interrupted and ends prematurely. In these filenames, anything that appears before `_run` is part of the common prefix that the sampler randomly generates: `ParaDRAM_20240312_060333_408`. Thus, to restart the simulation you will have to set `outputFileName = "./ParaDRAM_20240312_060333_408"` in your restart-simulation-specifications so that the old output files can be found by the sampler upon the simulation restart.  

{% include askme.html %}
{% include links.html %}
