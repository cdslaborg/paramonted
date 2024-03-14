Every {{pmSampler}} simulation generates an output restart file whose name ends with either `_restart.bin` (the default suffix) or `_restart.txt`. When the file extension is `.bin`, the contents of the file are written in binary format. Although the binary format is NOT human-readable, it has several advantages to the human-readable ASCII-formatted file suffixed by `_restart.txt`. The format of the output restart file can be specified via the input specification variable `restartFileFormat` described [here](../../{{pmSampler|downcase}}/specifications/#restartfileformat){:target="_blank"}.  

The output restart file contains all information that is needed to restart a simulation should runtime interruptions happen.

{{site.data.alerts.important}}

The restart functionality of the {{pmSampler}} routine is one of the most powerful and unique features of this sampler. If any runtime interruptions happen at any stage during a {{pmSampler}} simulation, whether in <b>serial or parallel</b> mode, the sampler will be able to restart from where it left off and <b>produce the same results, up to 16 digits of precision</b> that it was supposed to produce in the previous run if it remained uninterrupted. In other words, <b>the restart mode is fully-deterministic into the future and accurate up to 16 digits of real/float precision, despite the inherently stochastic nature of the Monte Carlo simulations.</b>.
<br>
For this to happen, make sure to set the random seed of the ParaMonte sampler's random number generator (<a href="../specifications/#randomseed" target="_blank"><b><code>randomSeed</code></b></a>) before the simulation, and fix the prefix of the output file names via the simulation specification <a href="../specifications/#outputfilename" target="_blank"><b><code>outputFileName</code></b></a>.

{{site.data.alerts.end}}

{% if pmSampler == "ParaDRAM" %}

{{site.data.alerts.tip}}
When the user requests the restart file to be written in ASCII format, the {{pmSampler}} sampler will write additional redundant data to the restart file. Although this data is not required for the simulation restart, it can be useful information for the users who are interested in exploring the dynamic evolution of the adaptation of the properties of the proposal distribution of the ParaDRAM sampler.
{{site.data.alerts.end}}

{% endif %}
