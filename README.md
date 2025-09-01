# Working with ProVerif

## Using Docker
We provide a Docker image that comes with an instance of VS Code Server
preconfigured for ProVerif.

To build the docker image run:
```
docker build -f ./Dockerfile . -t proverif-docker
```

Then run the image as follows:
```
docker run -it --init -p 3000:3000 -v "$(pwd)/models:/home/workspace/models" proverif-docker
```

You should then be able to access the VS Code interface in your browser under `http://localhost:3000`.

To verify that everything is set up correctly, open the file under
`/home/workspace/models/hello.pv` and run ProVerif on it using `Ctrl +
Shift + b`.
You should now see the output of the ProVerif tool in the terminal.

## Installing ProVerif locally

First, install the OPAM OCaml package manager. Using Homebrew:

```sh
brew install opam
```

Then, ProVerif can be installed with

```sh
opam depext conf-graphviz
opam depext proverif
opam install proverif
```

### Editor Support
There are plugins and extensions for several editors, which make working with ProVerif
developments more comfortable.

#### Visual Studio Code
There is a [VS Code extension](https://marketplace.visualstudio.com/items?itemName=ProVerif.vscode-proverif)
for ProVerif, which offers among other things syntax highlighting,
goto-definition, and item renaming.

#### Emacs
ProVerif comes with a rudimentary Emacs mode. To install it, download
the file
[proverif.el](https://gitlab.inria.fr/bblanche/proverif/-/blob/master/proverif/emacs/proverif.el?ref_type=heads)
from the ProVerif development repository and place it somewhere on you
`load-path`. Then, include the following in your emacs configuration:
```elisp
        (setq auto-mode-alist
	      (cons '("\\.horn$" . proverif-horn-mode) 
	      (cons '("\\.horntype$" . proverif-horntype-mode) 
	      (cons '("\\.pv[l]?$" . proverif-pv-mode) 
              (cons '("\\.pi$" . proverif-pi-mode) auto-mode-alist)))))
        (autoload 'proverif-pv-mode "proverif" "Major mode for editing ProVerif code." t)
        (autoload 'proverif-pi-mode "proverif" "Major mode for editing ProVerif code." t)
        (autoload 'proverif-horn-mode "proverif" "Major mode for editing ProVerif code." t)
        (autoload 'proverif-horntype-mode "proverif" "Major mode for editing ProVerif code." t)
```

#### Vim
There is a [Vim plugin](https://github.com/lifepillar/vim-formal-package) which include support for ProVerif.
