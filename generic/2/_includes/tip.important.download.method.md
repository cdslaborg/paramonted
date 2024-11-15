
        {{site.data.alerts.important}}
        If you are a <b>macOS user</b>, we <b>strongly recommend you to NOT download</b> the library directly from the library's GitHub release page and <b>NOT by clicking directly on the above link</b>. Instead, <b>use the <code>curl</code> command line program in a Bash terminal to download the library from the GitHub release page</b>. For example, open a Bash or zsh terminal on your macOS and type the following,  
        <pre class="language-shell highlighter-rouge">
        curl -OL {{site.githubReleaseCurrentDownload}}/libparamonte_{{include.lang|downcase}}_darwin_{{include.arch}}.tar.gz
        tar xvzf libparamonte_{{include.lang|downcase}}_darwin_{{include.arch}}.tar.gz && cd libparamonte_{{include.lang|downcase}}_darwin_{{include.arch}}
        </pre>
        The <b><code>curl</code></b> application is automatically installed on all macOS. If not, you can install it via <a href="https://brew.sh/" target="_blank">Homebrew</a>,
        <pre class="language-shell highlighter-rouge">brew install curl</pre>
        {{site.data.alerts.end}}