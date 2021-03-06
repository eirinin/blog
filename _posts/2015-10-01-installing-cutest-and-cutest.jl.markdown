---
layout:      post
title:       Installing CUTEst and CUTEst.jl
date:        2015-10-01
name:        2015-10-01-installing-cutest-and-cutest.jl
tags: cutest julia
---

This post will tell you how to install CUTEst using a different tool that makes
it much easier. Also, I'll install CUTEst.jl, the CUTEst interface for Julia.

**Edit:** *Now, CUTEst.jl install CUTEst by itself. Check [this
post](https://abelsiqueira.github.io/blog/nlpmodelsjl-cutestjl-and-other-nonlinear-optimization-packages-on-julia/).
Also, for Linux, I've created [this CUTEst
installer](https://github.com/abelsiqueira/linux-cutest), which should be
easier to use. February, 11, 2017*.

**Edit:** *Some corrections were made on February, 15, 2016*.

**Edit:** *Some corrections were made on November, 11, 2015*.

By now you probably know
[CUTEst](http://ccpforge.cse.rl.ac.uk/gf/project/cutest/wiki),
the repository for testing and comparing nonlinear programming algorithms.
It's widely used in the community for some time (considering CUTE and CUTEr,
the previous versions).
If not, this is a good change to test it, using
[Julia](http://www.julialang.org) to play around.
This is a not a post to convince you to use Julia, but I have to say that it is
much easier to use CUTEst on Julia than on MatLab.
So, if you are starting on it, I suggest you take a look.

We will use Homebrew to install CUTEst, for two reasons:
  - It's much easier (when you learn it)
  - Julia requires shared libraries, that the original installation did not
  provide.

Homebrew is a kind of package manager (such as apt-get, pip, etc.).
For linux, there are many things that we don't need from Homebrew, because you
normally already have a package manager. However, Homebrew is widely used by OSX
users, so it has a lot of packages.
The linux version is [Linuxbrew](https://github.com/Homebrew/linuxbrew).

The installation is quite simple:

  - Install brew
  - Install CUTEst
  - Install CUTEst.jl

I just made these steps and record my terminal, so you can check
[Asciinema](https://asciinema.org/a/27127), or the embedded version on the
bottom of the page. Be warned, though, that I was "cold running" them, so some
parts are very slow.

To install brew, I recommend you check the page. For the impatient,

{% highlight bash %}
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> $HOME/.bashrc
source $HOME/.bashrc
sudo apt-get install build-essential subversion
brew doctor
{% endhighlight %}

To install CUTEst, read the
[tap cutest](https://github.com/optimizers/homebrew-cutest).
Again, for the impatient

{% highlight bash %}
brew tap optimizers/cutest
brew install cutest
brew install mastsif
for f in archdefs mastsif sifdecode cutest; do \
  echo "source $(brew --prefix $f)/$f.bashrc" >> \
  $HOME/.bashrc; \
done
echo 'export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"' >> $HOME/.bashrc
source $HOME/.bashrc
{% endhighlight %}

This should get CUTEst installed.
Notice the `LD_LIBRARY_PATH` variable, which points to where the CUTEst library
will be.

Test it with

{% highlight bash %}
brew test sifdecode
brew test cutest
{% endhighlight %}

That's it. You have CUTEst installed to use with Fortran or C.
A can't provide a simple example, because they aren't simple (enough).
I'll now go to Julia, and I recommend you try it.

To install Julia, go to their page, then downloads, then download the
static version of the stable release (or do what you want, I'm not your boss).
Then, in julia, to install
[CUTEst.jl](https://github.com/abelsiqueira/CUTEst.jl),
issue the commands

{% highlight julia %}
Pkg.clone("https://github.com/abelsiqueira/CUTEst.jl")
Pkg.checkout("CUTEst", "fix/issue4")
{% endhighlight %}

If nothing goes wrong, then you can play around.
For instance, to open problem HS32 and get the objective function value at point
(2,3), we do

{% highlight julia %}
using CUTEst
nlp = CUTEstModel("HS32")
f = obj(nlp, [2.0;3.0])
{% endhighlight %}

If you're familiar with CUTEst, you can use the classic functions `cfn` and
`ufn` too, in the default way (as called from C) or a more Julian way.
This would become too long to explain now, so I'll make a post in a few days (or
months).
If you need it, please contact me.

This concludes the new installation of CUTEst.

**Warning**: Due to current limitations we cannot open two problems at the same
time in CUTEst without the possibility of a segmentation fault.
So, if you need to run cutest for a list of problems, I suggest you use a bash
script to loop over each problem and call your Julia code passing the problem as
an input argument.

Ths embedded Asciinema video is below.

<script type="text/javascript" src="https://asciinema.org/a/27127.js"
id="asciicast-27127" async></script>
