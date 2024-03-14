### The output progress file  

Every {{pmSampler}} simulation generates an output progress file whose name ends with `_progress.txt`. This file contains realtime information about the runtime progress of the simulation, including,  

-   information about the number of calls the {{pmSampler}} sampler makes to the user-provided mathematical objective function,  
-   information about the overall efficiency of the {{pmSampler}} sampler,  
-   information about the dynamic efficiency of the sampler over the past [progressReportPeriod](../../{{pmSampler|downcase}}/specifications/#progressreportperiod){:target="_blank"} number of calls to the mathematical objective function,  
-   information about the timing of the simulation including,  
    -   the time spent since the start of the simulation,  
    -   the time since the last progress report,  
    -   the estimated to finish the simulation.   

{% include note.html content='**Each row** in the progress file represents **one progress report event** during the simulation. **Each column** in the progress file represents information about **the dynamics of one attribute of the simulation** listed above.' %}

{% if pmSampler == "ParaDRAM" %}

Here is a snippet from the contents of a typical progress report file in Comma-Seperated-Values (CSV) format,  

```text
NumFuncCallTotal,NumFuncCallAccepted,MeanAcceptanceRateSinceStart,MeanAcceptanceRateSinceLastReport,TimeElapsedSinceLastReportInSeconds,TimeElapsedSinceStartInSeconds,TimeRemainedToFinishInSeconds
1000,136,.13371459319922982,.13371459319922982,9.3792600631713867,9.3792600631713867,6887.1354922687306
2000,197,.98254345562296549E-01,.62794097925363279E-01,7.6144800186157227,16.993740081787109,8609.2702608253749
3000,240,.80171526534224075E-01,.44005888478079132E-01,8.3076248168945312,25.301364898681641,10516.934009552002
4000,272,.69136158920019106E-01,.36030056077404171E-01,6.8951001167297363,32.196465015411377,11804.739202415241
...
```  

{% endif %}

{% include tip.outputRealPrecision.outputDelimiter.md %}
