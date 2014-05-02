arrayfire_r
==============

This repository contains the files required to use ArrayFire from R.

Prerequisites
---------------

- The latest version of ArrayFire. You can [download here](http://www.arrayfire.com/docs/installation.htm)
    - All the pre-requisites for ArrayFire still apply.

- **make**

- **Linux**.
    - **Windows** and **OSX** support coming soon.

Contents
---------------

- **src/**: Contains the cpp source files interfacing with arrayfire
- **R/**: Contains the R source files wrapping the C interface
- **examples/**: contains a few examples demonstrating the usage

Usage
----------------

After you the necessary pre-requisites, edit the following paramets

- Open **src/Makevars** and change **AF_PATH** and **CUDA_PATH** to the right location
- Change **AFCL** to 1 if you are using OpenCL

### Linux

- To install the package as root, run the following command from the root of arrayfire_r
    - `sudo R CMD INSTALL arrayfire_r`

- To install the packages for the local user do the following
    - Create `R_libs` in your home directory: `mkdir ~/R_libs`
    - add `export R_LIBS=~/R_libs` to your **.bashrc**
    - You may need to do **source ~/.bashrc** if you are in the same session
    - Run `R CMD INSTALL arrayfire_r` (`sudo` is not needed)

You should be good to go!

Documentation
---------------
- TODO

License
---------------

- Please check the LICENSE file in the root directory
