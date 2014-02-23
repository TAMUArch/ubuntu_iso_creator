VMWare Template
===============

Using these generated cd's require that you have a web server
serving the bootstrap files.

Random stuffs to build a custom Ubuntu iso inside a vagrant box.

```bash
# Setup the env (downloads iso and runs vagrant up)
./setup_env.sh

vagrant ssh
sudo su
./iso/build_iso.sh
```

Currently only has seed file for installing Ubuntu with Chef 11.8.

Vagrant
-------

Why does this require vagrant to work?  Using Vagrant to build the iso
ensures a consistent environment to run the appropriate steps.  Also I
run Fedora as my primary desktop sooo there is that too.

TODO
----
* Would be nice if you could pass parameters to drop in bootstrap files
* Add support for a network install
