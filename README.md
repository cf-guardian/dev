dev
===

Development environment setup for Cloud Foundry Guardian-backend project.

The following procedure should get a development and test environment set up:

1.  Obtain [VirtualBox](https://www.virtualbox.org/).
2.  Obtain [vagrant](https://www.vagrantup.com/).
3.  Enter the root of this repository (`cd`).
4.  Execute `vagrant up`.
    This should give you a virtual box with no GUI front-end,
    into which you can `vagrant ssh` to perform all the go stuff you want.

On first execution vagrant should build the first machine image (with
increased RAM, multiple cpus and default hard drive), load an ubuntu image,
populate this image with the latest system packages and include *Git*,
*Mercurial*, and *Go* (version 1.3.1), copy ssh keys from the host, and link
in `.profile` from the `vagrant_setup` folder.

The `Vagrantfile` sets up most of this and includes shared folders to the
hosts GOPATH and to the repository's `vagrant_setup` folder.

The `.profile` in `vagrant_setup` replaces the (default) one created by
vagrant, and sets a link to `vagrant_go` in `~/go` (unless it's there already)
and sets up the required `GOPATH` variable.

`vagrant provision` will re-issue the configuration steps starting at system
packages update, and these are designed to be (relatively) idempotent, except
for the fact that the versions of the dependencies will be bumped.
