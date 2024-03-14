<br>
{% assign runPage = "../../../run/default/" %}
{% if pmLang == "C" %}
    {% assign progLang = "C" %}
    {% assign progHeadExt = "h" %}
    {% assign progLangExt = "c" %}
{% elsif pmLang == "C++" %}
    {% assign progLang = "C++" %}
    {% assign progHeadExt = "hpp" %}
    {% assign progLangExt = "cpp" %}
{% elsif pmLang == "Fortran" %}
    {% assign progLang = "Fortran" %}
    {% assign progLangExt = "f90" %}
{% endif %}

## Running the ParaMonte simulations  

Once you have built your application, running the simulation is as simple as calling the generated executable on the command-prompt for serial applications, or invoking the MPI/Coarray launcher on the command-prompt for MPI/Coarray parallel simulations.  Follow [the instructions and tips on this page]({{runPage}}){:target="_blank"} on how to run your {{progLang}} example on either `Windows`, `Linux`, or `macOS` / `Darwin` Operating System (OS), on either a single processor or in parallel, on multiple processors or clusters of nodes of processors.

{{site.data.alerts.tip}}
{% include tshoot.error.while.loading.shared.libraries.md %}
{{site.data.alerts.end}}

### Running the ParaMonte simulations on a single processor  

If the executable `main.exe` has been built for serial simulations (using one processor), simply call the executable on the command line. The calling method is identical on all three Operating Systems: Windows, Linux, and Darwin (macOS). Here is an example call on Windows OS,    

```text  
D:\example>main.exe

************************************************************************************************************************************
************************************************************************************************************************************
****                                                                                                                            ****
****                                                                                                                            ****
****                                                         ParaMonte                                                          ****
****                                                       Version 1.0.0                                                        ****
****                                                        May 23 2018                                                         ****
****                                                                                                                            ****
****                                                   Department of Physics                                                    ****
****                                              Computational & Data Science Lab                                              ****
****                                          Data Science Program, College of Science                                          ****
****                                            The University of Texas at Arlington                                            ****
****                                                                                                                            ****
****                                                  originally developed at                                                   ****
****                                                                                                                            ****
****                                                 Multiscale Modeling Group                                                  ****
****                                          Center for Computational Oncology (CCO)                                           ****
****                                 Oden Institute for Computational Engineering and Sciences                                  ****
****                               Department of Aerospace Engineering and Engineering Mechanics                                ****
****                                     Department of Neurology, Dell-Seton Medical School                                     ****
****                                            Department of Biomedical Engineering                                            ****
****                                             The University of Texas at Austin                                              ****
****                                                                                                                            ****
****                                   For questions and further information, please contact:                                   ****
****                                                                                                                            ****
****                                                      Amir Shahmoradi                                                       ****
****                                                                                                                            ****
****                                                   shahmoradi@utexas.edu                                                    ****
****                                                  amir.shahmoradi@uta.edu                                                   ****
****                                                   ashahmoradi@gmail.com                                                    ****
****                                                                                                                            ****
****                                                       cdslab.org/pm                                                        ****
****                                                                                                                            ****
****                                             https://www.cdslab.org/paramonte/                                              ****
****                                                                                                                            ****
****                                                                                                                            ****
************************************************************************************************************************************
************************************************************************************************************************************



************************************************************************************************************************************
****                                                                                                                            ****
****                                              Setting up ParaDRAM environment                                               ****
****                                                                                                                            ****
************************************************************************************************************************************


        ParaDRAM - NOTE: Variable outputFileName detected among the input variables to ParaDRAM:
        ParaDRAM - NOTE: ./out/
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: Absolute path to the current working directory:
        ParaDRAM - NOTE: D:\example
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: Generating the requested directory for ParaDRAM output files:
        ParaDRAM - NOTE: .\out\
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: No user-input filename prefix for ParaDRAM output files detected.
        ParaDRAM - NOTE: Generating appropriate filenames for ParaDRAM output files from the current date and time...
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: ParaDRAM output files will be prefixed with:
        ParaDRAM - NOTE: .\out\ParaDRAM_run_20240322_002335_512



        ParaDRAM - NOTE: Searching for previous runs of ParaDRAM...



        ParaDRAM - NOTE: No pre-existing ParaDRAM run detected.
        ParaDRAM - NOTE: Starting a fresh ParaDRAM run...



        ParaDRAM - NOTE: Generating the output report file:
        ParaDRAM - NOTE: .\out\ParaDRAM_run_20240322_002335_512_process_1_report.txt



        ParaDRAM - NOTE: Please see the output report and progress files for further realtime simulation details.



                         Accepted/Total Func. Call   Dynamic/Overall Acc. Rate   Elapsed/Remained Time [s]
                         =========================   =========================   =========================
                                    30000 / 130490              0.179 / 0.2291              2.2880 / 0.000



        ParaDRAM - NOTE: Computing the Markov chain's statistical properties...



        ParaDRAM - NOTE: Computing the final decorrelated sample size...



        ParaDRAM - NOTE: Generating the output sample file:
        ParaDRAM - NOTE: .\out\ParaDRAM_run_20240322_002335_512_process_1_sample.txt



        ParaDRAM - NOTE: Computing the output sample's statistical properties...





        ParaDRAM - NOTE: Mission Accomplished.
```  

### Running the ParaMonte simulations in parallel on multiple processors  

If the executable `main.exe` has been built for MPI-enabled parallel simulations (on multiple processors), you will need to invoke the MPI launcher to start the simulation.  

-   **On Windows**  
    For parallel simulations on a single node (of multiple processors), for example on a single computer, the command typically looks like the following,  
    ```text
    mpiexec -localonly -n 3 main.exe
    ```  
    where the flag `-localonly` ensures the simulation is run only on a single node. This option avoids the invocation of the Hydra service which would require prior registration. The flag `-n 3` assigns three MPI tasks to three physical processors for the simulation. To run your simulation on a cluster of nodes, follow [the guidelines and instructions provided by the Intel MPI library development team](https://software.intel.com/en-us/mpi-developer-reference-windows-global-options){:target="_blank"}.  
-   **On Linux / Darwin (Mac)**  
    The MPI launcher command for parallel simulations on Linux and Darwin are identical and look very similar to the Windows command (except for the flag `-localonly` which is not needed),  
    ```text
    mpiexec -n 3 main.exe
    ```  
    where the flag `-n 3` assigns three MPI tasks to three physical processors for the simulation.  

{% include warning.html content="Do not specify more MPI tasks than the available number of physical processors on your system. If there are fewer physical processors available on the machine than the requested MPI tasks, some processors will be assigned more than one MPI tasks. This will significantly degrade the performance of your simulation and will potentially eliminate any benefits gained from running your simulation in parallel. For example, if you are running a parallel simulation on a quad-core laptop (with four physical processors), then the maximum number of MPI tasks should not go beyond 4 under any circumstances." %}

For example, the following command will launch the simulation on 3 processors on a Windows OS,  
```text
D:\example>mpiexec -localonly -n 3 main.exe

************************************************************************************************************************************
************************************************************************************************************************************
****                                                                                                                            ****
****                                                                                                                            ****
****                                                         ParaMonte                                                          ****
****                                                       Version 1.0.0                                                        ****
****                                                        May 23 2018                                                         ****
****                                                                                                                            ****
****                                                   Department of Physics                                                    ****
****                                              Computational & Data Science Lab                                              ****
****                                          Data Science Program, College of Science                                          ****
****                                            The University of Texas at Arlington                                            ****
****                                                                                                                            ****
****                                                  originally developed at                                                   ****
****                                                                                                                            ****
****                                                 Multiscale Modeling Group                                                  ****
****                                          Center for Computational Oncology (CCO)                                           ****
****                                 Oden Institute for Computational Engineering and Sciences                                  ****
****                               Department of Aerospace Engineering and Engineering Mechanics                                ****
****                                     Department of Neurology, Dell-Seton Medical School                                     ****
****                                            Department of Biomedical Engineering                                            ****
****                                             The University of Texas at Austin                                              ****
****                                                                                                                            ****
****                                   For questions and further information, please contact:                                   ****
****                                                                                                                            ****
****                                                      Amir Shahmoradi                                                       ****
****                                                                                                                            ****
****                                                   shahmoradi@utexas.edu                                                    ****
****                                                  amir.shahmoradi@uta.edu                                                   ****
****                                                   ashahmoradi@gmail.com                                                    ****
****                                                                                                                            ****
****                                                       cdslab.org/pm                                                        ****
****                                                                                                                            ****
****                                             https://www.cdslab.org/paramonte/                                              ****
****                                                                                                                            ****
****                                                                                                                            ****
************************************************************************************************************************************
************************************************************************************************************************************



************************************************************************************************************************************
****                                                                                                                            ****
****                                              Setting up ParaDRAM environment                                               ****
****                                                                                                                            ****
************************************************************************************************************************************


        ParaDRAM - NOTE: Variable outputFileName detected among the input variables to ParaDRAM:
        ParaDRAM - NOTE: ./out/
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: Absolute path to the current working directory:
        ParaDRAM - NOTE: D:\example
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: Generating the requested directory for ParaDRAM output files:
        ParaDRAM - NOTE: .\out\
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: No user-input filename prefix for ParaDRAM output files detected.
        ParaDRAM - NOTE: Generating appropriate filenames for ParaDRAM output files from the current date and time...
        ParaDRAM - NOTE:
        ParaDRAM - NOTE: ParaDRAM output files will be prefixed with:
        ParaDRAM - NOTE: .\out\ParaDRAM_run_20240321_193047_392



        ParaDRAM - NOTE: Searching for previous runs of ParaDRAM...



        ParaDRAM - NOTE: No pre-existing ParaDRAM run detected.
        ParaDRAM - NOTE: Starting a fresh ParaDRAM run...



        ParaDRAM - NOTE: Generating the output report file:
        ParaDRAM - NOTE: .\out\ParaDRAM_run_20240321_193047_392_process_1_report.txt



        ParaDRAM - NOTE: Please see the output report and progress files for further realtime simulation details.



                         Accepted/Total Func. Call   Dynamic/Overall Acc. Rate   Elapsed/Remained Time [s]
                         =========================   =========================   =========================
                                    30000 / 130260              0.200 / 0.2298              1.3140 / 0.000



        ParaDRAM - NOTE: The time cost of calling the user-provided objective function must be at least 52.5143 times more
        ParaDRAM - NOTE: (that is, ~24.6651 microseconds) to see any performance benefits from singlechain parallelization
        ParaDRAM - NOTE: model for this simulation. Consider simulating in the serial mode in the future (if used within the
        ParaDRAM - NOTE: same computing environment and with the same configuration as used here).



        ParaDRAM - NOTE: Computing the Markov chain's statistical properties...



        ParaDRAM - NOTE: Computing the final decorrelated sample size...



        ParaDRAM - NOTE: Generating the output sample file:
        ParaDRAM - NOTE: .\out\ParaDRAM_run_20240321_193047_392_process_1_sample.txt



        ParaDRAM - NOTE: Computing the output sample's statistical properties...





        ParaDRAM - NOTE: Mission Accomplished.
```  
You may have noticed the following note in the above simulation output,  
```text
        ParaDRAM - NOTE: The time cost of calling the user-provided objective function must be at least 52.5143 times more
        ParaDRAM - NOTE: (that is, ~24.6651 microseconds) to see any performance benefits from singlechain parallelization
        ParaDRAM - NOTE: model for this simulation. Consider simulating in the serial mode in the future (if used within the
        ParaDRAM - NOTE: same computing environment and with the same configuration as used here).
```  
This indicates that the simulation in parallel does not lead to any efficiency gain. Given the computer specifications on which the above simulation is performed (a decently powerful computer), this may not be surprising. Based on the CPU power and inter-processor communication costs, our example simulation in the above seems to be a good candidate for serial simulations instead.  

{{site.data.alerts.tip}}

The optimal number of processors for parallel simulations can vary widely from one MPI-implementation, processor architecture, and simulation problem to another. For large-scale simulations, it is therefore advisable that you run a small simulation for a limited number of samples that can be specified by the appropriate input simulation variable in the input file  (e.g., <b><code>chainSize=2000</code></b> for MCMC simulations performed via ParaDRAM sampler). In general, the number of sampled points should be small enough to finish the test-simulation in a few minutes. Then, check the contents of the output file for this small simulation that has the suffix <b><code>_report.txt</code></b> and look up the part corresponding to the following simulation information near the bottom of the file,
{% highlight text %}
Average time cost of inter-process communications per used (accepted or rejected or delayed-rejection) function call, in seconds:
2.446639524998980E-005
 
 
Average pure time cost of each function call, in seconds:
4.696832225884184E-007
 
 
Number of processes (images):
3
 
 
Estimated maximum speedup gained via singlechain parallelization model compared to serial mode:
1.904244758247332E-002
 
 
Predicted optimal number of physical computing processes for singlechain parallelization model, given the current MCMC sampling efficiency:
1
 
 
Predicted optimal maximum speedup gained via singlechain parallelization model, given the current MCMC sampling efficiency:
1.00000000000000
 
        ParaDRAM - NOTE: The time cost of calling the user-provided objective function must be at least 52.5143 times more 
        ParaDRAM - NOTE: (that is, ~24.6651 microseconds) to see any performance benefits from singlechain parallelization 
        ParaDRAM - NOTE: model for this simulation. Consider simulating in the serial mode in the future (if used within the 
        ParaDRAM - NOTE: same computing environment and with the same configuration as used here).
 
 
Predicted absolute optimal number of physical computing processes for singlechain parallelization model, under any MCMC sampling efficiency:
1
 
 
Predicted absolute optimal maximum speedup gained via singlechain parallelization model, under any MCMC sampling efficiency:
1.00000000000000
 
        ParaDRAM - NOTE: This simulation will likely NOT benefit from any additional computing processor beyond the predicted 
        ParaDRAM - NOTE: absolute optimal number, 1, in the above. This is true for any value of MCMC sampling efficiency.
{% endhighlight %}  
<b>At least two numbers</b> in the information provided in the above box <b>merit your attention</b> before you go ahead to set up your full-production simulation:<br>
<b>1. The predicted optimal number of physical computing processes</b> gives the simulation's best estimate for the optimal number of processes that could give you the highest speed-up, <i>given the current sampling efficiency of your sampler</i>. This is important because if your sampler's efficiency is high, then much of the work will be performed by only the very few first processors and all the work done by the rest of processors is wasted. Therefore, if you believe that your sampler's efficiency in the production mode will remain at the same level as in the test run, you may want to set the number of MPI tasks equal to the <i>predicted optimal number</i> by your test simulation.<br>
<b>2. The predicted absolute optimal number of physical computing processes</b> gives the simulation's best estimate for the absolute-maximum number of processes that could give you the highest speed-up, <i>for any conceivable sampling efficiency of your sampler</i>. You may want to make sure that whatever number of processors you request for your production simulation, it would not go beyond this number as it will gradually become detrimental to your simulation's overall performance. Beyond this predicted absolute processor count, the cost of inter-processor communications gradually becomes comparable and eventually more than any time-savings that could be earned by simulating in parallel.<br>
Keep in mind that these predictions for the optimal number of processors are only estimates and can vary widely depending on the runtime setup of your simulation, or the topology of the inter-processor network and communications.

{{site.data.alerts.end}}

### Final notes  

**Mission accomplished**. We have now used the adaptive Markov chain sampler routine of the ParaMonte library to generate random numbers from our objective function of interest. This simulation will generate five files in a folder named `./out/` in the current directory, each of which contains some specific information about the simulation. The purpose of each file is indicated by the suffix at the end of its name: `_chain`, `_sample`, `_report`, `_progress`, `_restart`. If `multichain` parallelism is requested via the input simulation specification variable `parallelizationModel = 'multiChain'`, then there will be five simulation output files generated for each processor separately and independently of each other. This is as if we have simulated several independent but simultaneous ParaDRAM simulations of our objective function. More details about the contents of each of the ParaDRAM simulation output files can be found on [this page](../../../usage/paradram/output/){:target="_blank"}.  

{{site.data.alerts.tip}}
Self-contained examples with Multivariate Normal Distribution as the objective function are available on the <a href="{{site.currentRelease}}" target="_blank">the release page of the ParaMonte library on GitHub</a>. These examples come with build-scripts for both Windows and Linux/macOS that can seamlessly build them for you by simply calling the scripts. Depending on the programming language of your choice and your system's architecture, these self-contained examples minimally require a C/C++/Fortran compiler (e.g., Intel Parallel Studio <b>&#8805; {{site.intelVersionWindows}}</b> or Microsoft C/C++ compiler <b>&#8805; {{site.msvcVersionWindows}}</b> on Windows, or GNU C/C++/Fortran compilers <b>&#8805; {{site.gnuVersionMinimum}}</b> on Unix-like Operating Systems). If you follow the installation instructions of the ParaMonte library, then all of these build requirements will be automatically installed on your system.
{{site.data.alerts.end}}  

## Post-processing the ParaMonte simulation results  

The post-processing of the output files generated by the ParaMonte routines can be nicely and quickly done via either the [ParaMonte Python library](../../../examples/python/postprocess/){:target="_blank"} or the [ParaMonte MATLAB library](../../../examples/matlab/postprocess/){:target="_blank"}.  
