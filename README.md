# Introduction to Julia

This repository contains the content for the [Introduction to Julia](https://scicomp.aalto.fi/training/julia/julia-introduction/) by Aalto SciComp.

Julia is a new emerging high-level, high-performance programming language. It aims to be simple to write and fast to run. In this course, we will introduce the basic concepts of programming with Julia. We will also discuss selected Julia packages and give an introduction to the Julia ecosystem. The course contains both lectures and hands-on exercises. All the material is provided as interactive notebooks.

The course is aimed for everybody with beginner to intermediate level of skills in programming. However, the notebooks and exercises also contain extra material marked with **Advanced** tags that are aimed for the more experienced users. Don't feel overwhelmed by them, some of them can be very specific to some particular field of science. Instead, if you find some of them interesting, feel free to just mess around with them and have some fun. That is the whole point of programming with a high-level language anyway!



## Prerequisites
Participants are expected to have some experience in computer programming and to be familiar with the basic concepts (e.g. variables, statements, control structures, functions) but previous knowledge of Julia is not required.


## Timetable
|       |        | Tuesday         |  Wednesday
| ----- |--------| -------------- | -----------
| 09:00 | 45min  | Intro          |  Development practices
| 09:45 | 45min  | **Exercises**  |  **Exercises**          
| 10:30 | 15min  | Coffee break   |  Coffee break          
| 10:45 | 30min  | Control flow   |  Julia ecosystem
| 11:15 | 60min  | **Exercises**  |  **Exercises**   
| 12:15 | 60min  | *Lunch*        |  *Lunch*
| 13:15 | 30min  | Functions      |  Performance tips
| 13:45 | 45min  | **Exercises**  |  **Exercises**
| 14:30 | 15min  | Coffee break   |  Coffee break
| 14:45 | 30min  | IO             |  Julia ecosystem II
| 15:15 | 60min  | **Exercises**  |  End of course
| 16:15 |        | End of day     |  



## Lecture material usage

We recommend that you download these materials and run the Jupyter notebooks locally.

You can also quickly try the notebooks on [Binder](https://mybinder.org/v2/gh/AaltoRSE/julia-introduction/HEAD). 

Lecture material can be read directly from GitHub  using your browser. Just click yourself inside the `notebooks` directory. However, for best experience, you should open the notebooks in the notebook environment. Installation of `Jupyter` notebooks and IJulia for this is described below.


## Installing Julia

We recommend that you install Julia on you own laptop or work computer. This way it is easy to continue using Julia after the course.

First, [download the current release of Julia](http://julialang.org/downloads/) and run the installer. Then open the Julia application (double-click on it); a window with a julia> prompt will appear. At the prompt, type:

```julia
using Pkg
Pkg.add("IJulia")
```
You may also want to install these packages, which we tend to use in a lot of the lecture materials
```julia
Pkg.add("Plots")
Pkg.add("PlotlyJS")
Pkg.add("PyPlot")
```


Then you can launch the notebook in your browser by running
```julia
using IJulia
notebook(dir=".")
```

### Cloning the materials

Downloading these materials is useful, since that allows you to make notes and
run code directly in the notes.
You can download the materials as a
[zip file](https://github.com/AaltoRSE/julia-introduction/archive/refs/heads/master.zip)
or use your favorite git client to clone them from
"https://github.com/AaltoRSE/julia-introduction.git".

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
