
## Your Arch Packages
I have really liked having my own [PPA](https://launchpad.net/~moonsdad/+archive/ubuntu/ppa) for distributing my personal packages while using [Ubuntu](https://ubuntu.com/). Now that I have switched to using [Arch](https://www.archlinux.org/), I wanted the same sort of availability for my pacman packages. The [AUR](https://aur.archlinux.org/) is great! And, when I have a single computer that needs a package, I'll just build and install it locally. But, while administering multiple systems, I have found it quite easy to create my own custom repository. Easy enough that I figured others might want to take advantage of my workflow.

Also, I have some packages that aren't quite ready for widespread distribution, and so shouldn't go into the AUR just yet. So, they are only available in [my custom repository](https://hildigerr.github.io/arch-repo/). And, I'm hoping that others--who have similar things to share--will use my workflow and then I'll be able to find something new and interesting or useful.

### Setup
Once you fork this, there is some things that you'll need to do to enable your own custom repository. But once it's set up, it will be mostly automated.

#### Build
The `build` directory is where you will keep the various packages that you want to distribute. You can clone from the AUR in there or create directories for your own [PKGBUILD](https://wiki.archlinux.org/index.php/Arch_package_guidelines)s. The `Makefile` in that directory has a target for creating an arch chroot in your home directory. You can override the location with the command `make CHROOT=/wherever/you/want chroot`. There are template targets for both local and aur builds.

I have found that I don't need to use make anymore. I just go into the directory, do a `git pull` if it's an aur build, and then reverse search in my command history for `makechrootpkg -c -r ${CHROOT} -- PACKAGER="${PACKAGER}"`. That being said, you must have the `$CHROOT` and `$PACKAGER` environment variables set.

There is also a `sign` function available, which uses your `$GPGKEY` environment variable. You can use this to sign your packages.

#### GitHub Pages
You'll need to enable your [GitHub Pages](https://pages.github.com/) page for the repository, and edit the `index.html` and this `readme.md`. The readme and html index files are meant to be synchronized. The readme is what people see when coming to your GitHub project via `https://github.com/yourname/arch-repo` and the index is what they see when viewing the GitHub Page via `https://yourname.github.io/arch-repo`.

You should be able to update `yourname` with the command `sed -i s/yourname/yourrealname/ readme.md index.html Makefile`. You will probably want to remove this `setup` section from the readme too. I highly recommend reviewing the diffs for your changes to make sure everything is how you want it.

#### Deployment
With your packages built and everything else properly configured, all you need to do is move the packages into the `x86_64` directory (I am assuming the packages are built for 64-bit processors). Then, execute the `make add` target to add the packages to the repo database, and `make hardlink` to change the symlinks that the `repo-add` command creates into hard links. Note that the `add` target expects that you have signed each of the packages and have your `$GPGKEY` environment variable set.

With this done, run `make index` and then adjust the spacing in the `x86_64/index.html` file so that the timestamps are uniformly spaced relative to the package filenames. Also, move the links up into the html body and remove any that are not for the packages.

#### Updating
Whenever you update a package replace the old files in the `x86_64` with the new ones and execute the deployment make targets again. I use the [MeldMerge](http://meldmerge.org/) graphical diff utility to update my `x86_64/index.html` file. I highly recommend it for ensuring you always push clean git commits.

Be sure to update the `readme.md` and `index.html` files to list your available packages for people who may decide to enable your repository on their machines.

To avoid the repository from getting too large too quick, you should always only have three commits: `02ebeb7 init`, `1edf383 build template`, and the final one with your deployment. After you fork this, delete the master branch. Then make a new master branch based on the `forkme` branch. On your new master branch `reset HEAD~`. Then make all the changes for your first deployment.

After getting everything set, add all the new files and changes and make a new commit. Once you force push it up to GitHub, your repository will be available. You will have to use `git push -f origin master` each time you update.

For updates, you don't have to reset the HEAD again. Simply add the changes to a new commit (I usually commit it as `"squash this"`). Then run the `make squash` target. Note that it relies on the [ed](https://www.archlinux.org/packages/core/x86_64/ed/) editor just because that is what I use. If you don't want to install ed, then just [squash](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History) it however you normally would.

### Description

This is my [custom repository](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Custom_local_repository) for packages that I use on my [Arch Linux](https://www.archlinux.org/) systems.

### Enable This Repository

To use this repository add the following to your `/etc/pacman.conf` file:

```markdown
[yourname]
SigLevel = Optional TrustAll
Server = https://yourname.github.io/arch-repo/x86_64
```

### Available Packages

 - [**template**](www.example.com) Describe the packages here
