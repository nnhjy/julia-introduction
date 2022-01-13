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
"https://github.com/AaltoRSE/julia-introduction.git".


## Installing Julia

We recommend that you install Julia on you own laptop or work computer. This way it is easy to continue using Julia after the course.

First, [download the current release of Julia](http://julialang.org/downloads/). For more details see [Julia's own installation instructions](https://julialang.org/downloads/platform/).

**Windows**: Run the installer. Then open the Julia application (double-click on it); a window with a julia> prompt will appear.

If you want to use WSL, check the instructions at the end.

**MacOS**: Open the dmg file and dragg the Julia app `Applications`. Run the application and a window with a julia> prompt will appear.

**Linux**: Open a terminal window and run the following commands to
download and extract the necessary files:

```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.5-linux-x86_64.tar.gz
tar zxvf julia-1.6.5-linux-x86_64.tar.gz
export PATH="$PATH:~/julia-1.6.5/bin"
```

To use Julia later, you will need to add the following line to the `.bashrc` file in your home folder.
```bash
export PATH="$PATH:~/julia-1.6.5/bin"
```

**All systems**:

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


## Using the Aalto Jupyter server

Aalto employees and students who have trouble installing Julia can also use the [Jupyter Hub](https://jupyter.cs.aalto.fi/). Click on the link and sign in using your Aalto account.

To clone this repository on the Jupyter Hub, navigate to `git -> Clone a Repository` in
the menu on the top of the page. Paste "https://github.com/AaltoRSE/julia-introduction.git"
into the popup window and click `CLONE`.


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
