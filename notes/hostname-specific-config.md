# Hostname specific configuration

One problem I seem to be running into is needing separate configuration for
different hostnames/machines. For instance, on Ramanujan (my laptop), Mensch
doesn't seem to render correctly. This is perhaps because I'm running KDE, which
might cause weirdness. On my desktop (Grothendieck), Mensch works fine. Because
this choice is configured in a `.Xresources`/`.Xdefaults` file, it's difficult
to simply add some conditional logic based on something that, e.g., `lib/info`
could suss out (maybe by setting some variable `$HOSTNAME` if one doesn't
already exist).

Ideally I could spread this into other configs too (`vim` configs being the
natural choice). Indeed, the gandalf project might be well suited to setting up
not just the shell/terminal emulator/cli tools configuration, but also bigger
things like `vim`'s config (which could be tracked using a subtree).

The long an short of it is that I need a way to configure things/link things
based on which machine I'm on. It may be valuable to have a 'real' configure
stage, which sets some of these options dynamically w/o tying it to a specific
machine-name. Or it may suffice to simply have a `<filename>.<hostname>`
convention. Both options are outlined below.

## Naming convention

Simply add hostname introspection to `lib/info`, and then have either 1 or 2
config files for each config, with the property that -- if there is a config
file called `foo`, then create an object config file with the contents of `foo`
followed by the contents of `foo.<hostname>`.

### Problem

Since it's not a link anymore (but a generated file), updates to it would
require that the object file be rebuilt. This could be monitored by a cronjob
that watched for changes in the sourcefiles and rebuilt them (heck, if I used
make/rake or something, it could even just re-run the build step every `n`
minutes or w/e).

## configure script

Presently, `lib/info` generates some information at load time which -- really --
is just static data about the system you're on, there's no reason not to set
this statically (ie, without the dynamic calculation, just a hardcoded value).
This would improve load times a bit, but at the cost of some configure-step.
This could also be a path to set options when installing gandalf.

Essentially, this would take the form of a configure script that either takes
options or interactively asks for information about what settings to use -- eg,
what font should be used for urxvt, what names to use for gitconfig, etc. Though
gandalf is primarily a tool for me to manage my config, it ideally would be
agnostic to the user. If only because that makes scaling it (for me) to more
machines easier. Presently I have at least 3 local, and 1 remote machine that
needs managing.

This script could also alleviate a bit of the [Cyclic Dependency
Problem][cyclic-dependency-problem], by writing the bootstrapping code in as a
compile step, or something.

