dev
===

Development environment setup for Cloud Foundry Guardian-backend project.

The following procedure should get a development and test environment set up:

1.  Obtain [VirtualBox](https://www.virtualbox.org/) (tested with 4.3.12).
2.  Obtain [vagrant](https://www.vagrantup.com/) (tested with 1.6.5).
3.  Enter the root of this repository (`cd`).
4.  Set `$GOHOME` to point at your go directory (usually the first item in your `$GOPATH`).
5.  Execute `vagrant up`.
    This should give you a virtual box with no GUI front-end,
    into which you can `vagrant ssh` to perform all the go stuff you want.

On first execution vagrant should build the first machine image (with
increased RAM, multiple cpus and default hard drive), load an ubuntu image,
populate this image with the latest system packages and include *Git*,
*Mercurial*, and *Go* (version 1.3.1).

By copying rsa keyfiles from the host's `.ssh` into the machine's `.ssh`
directory we can include the host system's identities.

We link to the `.profile` file in the `vagrant_setup` folder replacing any
`.profile` that might already exist in the machine.

The `Vagrantfile` sets up shared folders to `vagrant_setup`, `vagrant_go_src`,
`vagrant_go_pkg` and `vagrant_ssh` which point to the host's directories
`vagrant_setup`, `$GOHOME/src`, `$GOHOME/pkg` and `~/.ssh` respectively. The
links are created in `setup.sh`, and the environment variables are set in
`.profile`.

The `.profile` in `vagrant_setup` replaces the (default) one created by
vagrant, and sets the required `GOPATH` variable.

`vagrant provision` will re-issue the configuration steps starting at system
packages update, and these are designed to be (relatively) idempotent, except
for the fact that the versions of the dependencies will be bumped.

Usage notes
-----------

It was unfortunate that the exectables installed in `$GOHOME/bin` were shared
between the  target machine and the host.  This meant that the binaries (of
`godep` and `ginkgo`, for example) needed to be cleared out and rebuilt before
use on the target machine.

The compiled fragments, however, are stored in a `GOOS/GOARCH` combination
under pkg.

The solution is to have a local `$GOHOME/bin` for each machine, and to
redirect `pkg` and `src` to the host.  This is achieved by creating the `go`
directory with an empty subdirectory `bin` and setting links therein to `src`
and `pkg` on the host.  This is done once in `setup.sh`.

`.profile` merely sets the environment variables to use these.
