Madefile
========

Why write a Makefile, when it's already been made?

Madefile is a module system for make. It let's you make reusable makefile
components, keep them somewhere on the internet, and share them between your
own projects and/or with others.

Using madefile
--------------

First, acquire `madefile.mk`. You can clone this repo and add it as a
submodule, or just download and copy it into your project. Then include it from
you Makefile.

After `madefile.mk` is included, you can include Madefiles like so:

```make
# download and include Madefile
$(call madefile-include,github.com/singron/madefile-hello-world)

# just download
$(call madefile,github.com/singron/madefile-hello-world)

# return path to file as string (handy for extra files or manual includes).
$(call madefile-path,github.com/singron/madefile-hello-world/Madefile)
```

`madefile-include` automatically downloads the specified repo, restarts make,
and includes a file `Madefile` in the base directory of the repo. If you just
want to download a repo, use the function `madefile`. If you want to use a file
in the repo, you can get it's path with `madefile-path`.

`madefile.mk` downloads repos into the `MADEFILE_DIR` directory (by default,
`.madefile`). This can be modified to use a shared cache (`~/.cache/madefile`
for instance), if you would like, but that would prevent different versions of 
files from being resident simultaneously.
