<div align="center">
    <a href="https://cdslab.org/pm" target="_blank">
        <img alt="paramonte-doxygen-documentation" src="https://github.com/cdslaborg/paramonte/blob/main/img/paramonte.png" width="80%">
    </a>
</div>

### Instructions to regenerate the documentations

To regenerate the ParaMonte documentation from source,

1.  Create a fork of the [ParaMonte project](https://github.com/cdslaborg/paramonte/)
    on your personal GitHub account and clone the forked ParaMonte repository on your system via,
    ```bash
    git clone --recurse-submodules git@github.com:cdslaborg/paramonte.git
    ```
1.  Open a Bash terminal and navigate to the root directory of the ParaMonte repository cloned on your system.

1.  Navigate from the ParaMonte root directory to the documentation repository's root folder `./external/paramonted`.

1.  See the [generic subfolder README.md file](./generic/README.md) for instructions to regenerate the ParaMonte generic documentations.

1.  See the [doxygen subfolder README.md file](./doxygen/README.md) for instructions to regenerate ParaMonte language-specific Doxygen documentations.

> **NOTE**
>
> The ParaMonte documentation builds have only been tested on Linux system.
