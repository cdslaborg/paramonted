### The ParaMonte Generic API Documentation Source

This folder contains the source codes for the generic ParaMonte documentations.

### Instructions to regenerate the documentation

To regenerate the ParaMonte generic documentation from source,

1.  If you have not done so already, follow the instructions given in the parent folder [README.md](../README.md).

1.  Navigate to the folder where this README.md file is located.

1.  Ensure all current and past versions of the language-specific ParaMonte
    documentations are in place in [../paramonte](../paramonte) folder.

1.  Install [Jekyll](https://jekyllrb.com/) on your system.
    Alternatively, install [this version of Doxygen](https://github.com/cdslaborg/doxygen)
    that is specifically customized by the ParaMonte developers for the
    documentation needs of the ParaMonte library.

1.  Navigate to the specific generic library version you wish to edit.

1.  On the command line, ensure the Jekyll bundler has installed all
    required Ruby gems listed in `Gemfile.lock` on your system via,
    ```bash
    bundle install
    ```
    If you wish to recreate the `Gemfile.lock` file, try instead,
    ```bash
    bundle check
    ```

1.  Navigate again back to the parent folder where this `README.md` file is located.

1.  Rebuild the generic documentations for the current and past major ParaMonte
    versions by calling the following script on the Bash command-line,
    ```bash
    ./build.sh
    ```

1.  Inspect the generated documentation by opening the HTML file located at `../paramonte/generic/MAJOR_VERSION/index.html`
    where you must replace `MAJOR_VERSION` with the generic ParaMonte library's major version in the ParaMonte repository.
    This is the version found in the root directory of the ParaMonte repository.

1.  Once the generic documentation is built, rerun the build script once more for all languages.
    However, before rerunning the documentation builds, ensure the [generic documentations](../generic/README.md) 
    are up to date and exist in [../paramonte](../paramonte).
    This second documentation rebuild is required for proper linking of different language documentations.

1.  If everything looks good, then navigate to the folder [../paramonte](../paramonte) and stage, commit,
    and push the new documentations to the `ParaMonte` documentation repository on GitHub.
    ```bash
    git add --all
    git commit -m"latest documentation build"
    git push --all
    ```

> **NOTE**
>
> The ParaMonte documentation builds have only been tested on Linux system.
