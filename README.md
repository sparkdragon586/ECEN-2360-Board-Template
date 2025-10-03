# Repo Goals
> [!NOTE] 
> This repo is very opinionated to my specific development workflows. This is evident by the use of NeoVim, nix develop, and command line based usage of pio.
> Even with this I will say this is not the development environment I personally am using. My personal development environement "requires" the usage of nix-os. DM me if you are interested in the proper environment.
This repo is meant to create a unified config for working with the (CU-Boulder) ECEN-2360 board. (longan nano)
This is accomplished by the following. 
1. The usage of nix develop allows consistant tools to be used by any party.
2. A simple NeoVim config allows consistent editor completions.
3. Pio allows consistent compilation<sup>*</sup>.

# Usage
> [!NOTE]
> In order to use this repo there are 2-ish requirements. First, you need to have git setup (obvious). Second, you need to have Nix. Third, you need to have udev setup properly for dfu-util.

The main crux of this repo is that it's built around a Nix flake. This allows you to install most of the needed packages in a temporary dev-shell with one command.
Once you have the git-repo cloned and Nix setup go to any point in the repo and run the following command.
```bash
nix develop
```

This should install a number of required packages and drop you into a dev shell.

From this point you have a couple more things to do to get things fully functioning. First you can copy the template-project directory to make a new project. This can be done with the following command.

```bash
cp -r $PROJECT_ROOT/template-project $PROJECT_ROOT/{whatever-name-you-want}
cd $PROJECT_ROOT/{whatever-you-named-it}
```

Once you do this you have to ensure you have the pio project properly installed with the following.
```bash
pio pkg install
```

After that you need to build a compile command database in order to get proper completions. This can be done with the following.
```bash
pio run -t compiledb
```

I have also bundled a number of helper shell scripts. The above can be accomplished by the following as well.
```bash
new-project.sh {whatever-name-you-want}
```

# TODO:
- [ ] Neovim documentation and how to.
- [ ] More helper scripts (with nvim integration)
    - [ ] build directly from nvim
    - [ ] upload directly from nvim
    - [ ] auto git commits on upload
- [ ] nvim debugging
