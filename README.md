# Introduction to Julia

This repository contains the content for the [Introduction to Julia](https://scicomp.aalto.fi/training/julia/julia-introduction/) course by Aalto SciComp. Online lecture recordings can be found [here](https://www.youtube.com/playlist?list=PLZLVmS9rf3nOlvvbN9zTAFc7aujnvuFTV) at YouTube.

Julia is a new emerging high-level, high-performance programming language. It aims to be simple to write and fast to run. In this course, we will introduce the basic concepts of programming with Julia. We will also discuss selected Julia packages and give an introduction to the Julia ecosystem. The course contains both lectures and hands-on exercises. All the material is provided as interactive notebooks.

The course is aimed for everybody with beginner to intermediate level of skills in programming. However, the notebooks and exercises also contain extra material marked with **Advanced** tags that are aimed for the more experienced users. Don't feel overwhelmed by them, some of them can be very specific to some particular field of science. Instead, if you find some of them interesting, feel free to just mess around with them and have some fun. That is the whole point of programming with a high-level language anyway!


## Prerequisites
Participants are expected to have some experience in computer programming and to be familiar with the basic concepts (e.g. variables, statements, control structures, functions) but previous knowledge of Julia is not required.

## About the Materials

We recommend that you download these materials and run the Jupyter notebooks locally.
See the instructions below. If you cannot run Julia locally, but you have an Aalto account, follow the instructions for the Aalto Jupyter.

The materials are a work in progress, so expect changes and don't be surprised if you discover a bug. If you find any problems, let us know by creating an issue

<!-- You can also quickly try the notebooks on [Binder](https://mybinder.org/v2/gh/AaltoRSE/julia-introduction/HEAD). -->

Lecture material can be read directly from GitHub  using your browser. Just click yourself inside the `notebooks` directory. However, for best experience, you should open the notebooks in a notebook environment.


### Cloning the materials

Downloading these materials is useful, since that allows you to make notes and
run code directly in the notes.
You can download the materials as a
[zip file](https://github.com/AaltoRSE/julia-introduction/archive/refs/heads/master.zip)
or use your favorite git client to clone them from
[its github repository](https://github.com/AaltoRSE/julia-introduction.git).


## Installing Julia

We recommend that you install Julia on you own laptop or work computer. This way it is easy to continue using Julia after the course.

First, [download the current release of Julia](http://julialang.org/downloads/). For more details see [Julia's own installation instructions](https://julialang.org/downloads/platform/).

**Windows**: Run the installer. Then open the Julia application (double-click on it); a window with a julia> prompt will appear.

Change the julia executable to which the command `julia` points:
1. System environment variable (if you install Julia for all users):
"Control Panel\All Control Panel Items\System --> Advanced system settings --> Advanced --> Environmental Variables --> Edit in `Path`" 
    - under "User variables for `administrator_username`" only for the administrator, under "System variables" for all users)
2. User environment variable (if you install Julia for the current user): 
Search `environment variables` in the Windows taskbar --> "Edit environment variable for your account" --> Edit in `Path` under "User variables for `the_current_username`"
3. **Edit in `Path`**: Click `New` to add `X:\directory\to\Julia-x.x.x\bin` and delete the directory for old versions

*Check environment variables*: In `Command Prompt` type `path`. In normal mode, it shows the variables for the user, and in administrator mode the system variables.

If you want to use WSL, check the instructions at the end.

**Work with jupyter notebook**:

Start a Julia session.
Install the `IJulia` package by pasting the following two:

```julia
using Pkg
Pkg.add("IJulia")
```

Renew the julia kernel in notebook
```julia
using Pkg
Pkg.update()
Pkg.build("IJulia")
```

Then you can launch the notebook in your browser by running
```julia
using IJulia
notebook(dir=".")
```

The first time you run this, it will ask about installing Jupyter using conda.
Answer 'y' and after a while, the notebook environment will open in the
browser.

## Manage Julia conda environment

**Option 1**: use [Conda.jl](https://github.com/JuliaPy/Conda.jl) package.

**Option 2**: general approach of conda environment management
1. Use `Anaconda Prompt`
2. Check all info of conda: "`conda info`"
3. Check existing conda environments: "`conda info --env`" or "`conda env list`"
4. Switch between conda envs: "`activate\deactivate path/to/env`"
5. Switch to the conda environment used by Julia
6. Update the python: "`conda update python`"
For more info, also see [manage conda environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) and [manage conda python](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-python.html). 

## Acknowledgements

These materials are based on the [CSC course](https://github.com/csc-training/julia-introduction) by the same name. We have modified both the structure and the content, so we are responsible for any mistakes.

----

## References
Much of this material is based on different excellent content found around the web such as:

### General topics
- Julialang.org
- Official Julia manual: https://docs.julialang.org/en/latest/manual/
- JuliaBox.com and the excellent tutorials therein
- https://en.wikibooks.org/wiki/Introducing_Julia
- [Introduction to python](https://github.com/csc-training/python-introduction) course at CSC


### Parallellism:
- https://slides.com/valentinchuravy/julia-parallelism
- MIT course: Performance Computing in a High Level Language: https://github.com/stevengj/18S096


## Windows Subsystem Linux (WSL) installation steps

Install an X server. [Xming0](https://sourceforge.net/projects/xming/) is a good option.
On Aalto laptops, you can find `VcXsrv` in the Software Center.

Run `export DISPLAY=:0` and add it to the `.bashrc` file in your home directory.

Install a web browser using `apt`. For example, for firefox, run
```bash
sudo apt update
sudo apt upgrade
sudo apt install firefox
```

Then follow the Linux instructions.
