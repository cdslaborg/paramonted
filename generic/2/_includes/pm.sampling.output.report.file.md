### The output report file  

Every {{pmSampler}} simulation generates an output report file whose name ends with `_report.txt`. This file contains all the details about the simulation setup in the following order,  
-   the {{pmSampler}} banner and version specifications,  
-   the specifications of the processor on which the current simulation is being performed,  
-   the specifications of the current {{pmSampler}} simulation being performed along with their values and descriptions,  
-   the relevant details about the simulation timing and performance, if the simulation finishes successfully, along with,  
-   the statistics of the simulation results, and,  
-   the final message: "**Mission Accomplished.**" indicating the successful ending of the simulation.
    {{site.data.alerts.tip}}
    This "<b>Mission Accomplished.</b>" message is the <b>last piece of information</b> to appear in a report file. If you do not see this message, your simulation likely did not end properly, or the simulation was likely interrupted at runtime. The latter often happens when you schedule your simulation on a supercomputer with a limited preallocated time, while the simulation takes longer than the prespecified time and ends prematurely. In such cases, you can <a href="../../{{pmSampler|downcase}}/restart/" target="_blank"><b>seamlessly</b> restart your simulation</a> to continue from where it left off upon interruption.
    {{site.data.alerts.end}}
    
