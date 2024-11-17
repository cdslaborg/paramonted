
        {{site.data.alerts.important}}
        If you are a <b>macOS user</b>, we <b>strongly recommend you to NOT download</b> the library directly from the library's GitHub release page and <b>NOT by clicking directly on the download links in web browsers</b>. Instead, <b>use the <code>curl</code> command line program in a Bash terminal to download the library from the GitHub release page</b>. For example, open a Bash or <code>zsh</code> terminal on your macOS and execute the following commands to both download and decompress the ParaMonte {{include.lang}} library,  
        <pre class="language-bash highlighter-rouge"><code>curl -OL {{site.githubReleaseCurrentDownload}}/libparamonte_{{include.lang|downcase}}_darwin_{{include.arch}}.tar.gz
        tar xvzf libparamonte_{{include.lang|downcase}}_darwin_{{include.arch}}.tar.gz && cd libparamonte_{{include.lang|downcase}}_darwin_{{include.arch}}
        </code></pre>
        The <b><code>curl</code></b> application is automatically installed on all macOS. If not, you can install it via <a href="https://brew.sh/" target="_blank">Homebrew</a>,
        <pre class="language-bash highlighter-rouge"><code>brew install curl
        </code></pre>
        {{site.data.alerts.end}}