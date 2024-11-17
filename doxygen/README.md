### The ParaMonte C, C++, Fortran, MATLAB, Python API Documentation Source

This folder contains the source codes for the ParaMonte Doxygen documentations.

### Instructions to regenerate the documentation

To regenerate the ParaMonte documentation from source,

1.  If you have not done so already, follow the instructions given in the parent folder [README.md](../README.md).

1.  Install [Doxygen](https://www.doxygen.nl/download.html) on your system.
    Alternatively, install [this version of Doxygen](https://github.com/cdslaborg/doxygen)
    that is specifically customized by the ParaMonte developers for the
    documentation needs of the ParaMonte library.

1.  Navigate to the folder where this README.md file is located.

1.  Rebuild the documentations for the current version of the ParaMonte source in the
    library's root directory by calling the following script on the Bash command-line,
    ```bash
    ./build.sh --lang TARGET_LANG --exam all --bench all
    ```
    where `TARGET_LANG` must be replaced by target programming language: `c`, `cpp`, `fortran`, `matlab`, `python`.
    1.  If the library examples and benchmarks have been already built, you can drop the flags ` --exam all --bench all`.
    1.  Alternative, if you intend to generate only the documentation without the additional examples, benchmarks, and images, try
        ```bash
        ./build.sh --lang TARGET_LANG --dryrun
        ```
        This will avoid building the library entirely and will only build the library's documentation.

1.  The Doxygen documenter is instructed to redirect all documentation build errors and
    warnings to a file named `READ_THESE_BUILD_WARNINGS.txt` in the same folder as this `README.md` file is located.
    Inspect the message warning log of Doxygen in the output file `READ_THESE_BUILD_WARNINGS.txt` for any potential documentation errors.

1.  Inspect the generated documentation by opening the HTML file located at `../paramonte/TARGET_LANG/MAJOR_VERSION/index.html`
    where you must replace `TARGET_LANG` with the language name for which the library was built and
    replace `MAJOR_VERSION` with the language source file major version in the ParaMonte repository.

1.  Once the documentation is built for all target programming languages, rerun the build script once more for all languages.
    Before rerunning the documentation builds, ensure the [generic documentations](../generic/README.md) are up to date.
    This second documentation rebuild is required for proper linking of different language documentations.
    To speed up the second runs, you can specify the optional `--dryrun` flag as,
    ```bash
    ./build.sh --lang TARGET_LANG --dryrun
    ```

1.  If everything looks good, then navigate to the folder [../paramonte](../paramonte) and stage, commit,
    and push the new documentations to the `ParaMonte` documentation repository on GitHub.
    ```bash
    git add --all
    git commit -m"latest documentation build"
    git push --all
    ```

> **NOTE**
>
> To generate new header, footer, or css stylesheet, follow the
> [Doxygen instructions here](https://www.doxygen.nl/manual/config.html#cfg_html_header).
> The regeneration command is the following:
> ```bash
> doxygen -w html new_header.html new_footer.html new_stylesheet.css config.txt
> ```

> **NOTE**
>
> The ParaMonte documentation builds have only been tested on Linux system.
