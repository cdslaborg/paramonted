{% if include.pmcs == "Intel" %}
    {% assign pmcsName="Intel Parallel Studio" %}
    {% assign pmcsPath="C:\Program Files (x86)\IntelSWTools" %}
{% elsif include.pmcs == "msvc" %}
    {% assign pmcsName="Microsoft Visual Studio" %}
    {% assign pmcsPath="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community" %}
{% else %}
    {% assign pmcsName="Windows CMD" %}
    {% assign pmcsPath="C:\Users\username>" %}
{% endif %}
When you open an instance of the {{pmcsName}} command-line, the default directory is on the drive where the software is installed, typically a path like <b><code>{{pmcsPath}}</code></b>. If the directory containing the ParaMonte source files is on a drive (e.g., <b><code>D:</code></b>) other than the software installation drive (e.g., <b><code>C:</code></b>), you will have to first change the drive letter on the command line and then change the directory to your target folder. For example, to switch from a folder on the <b><code>C:</code></b> drive to a folder on the <b><code>D:</code></b> drive, you have to first change the drive like the following,  
<br>
<pre>
C:\> d:  
D:\>
</pre>