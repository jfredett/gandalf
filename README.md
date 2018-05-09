# gandalf - He's a bash-shell wizard, there's got to be a twist.

`gandalf`[1] is my little framework for managing my scripts. After a few years using
an evolved system involving a few files haphazardly sourced together, it has
become harder and harder for me to maintain changes and avoid issues related to
startup performance and consistency across machines. It is, I think, therefore
well worth driving into a new system with a more thoughtful, designed approach.

[1] so named because of an old nickname ('bash-wizard') I acquired for actually
knowing how to write shell.

## Usage

It's relatively unlikely anyone else will ever actually use `gandalf`. If you do,
you will probably find you have to alter configurations pretty heavily, gandalf
has no concept of a 'user' and contains a lot of stuff specific to my setup.
That said, if you want to use it and need to factor out those me-specific bits,
don't be afraid to submit a pull request. In the long run of `gandalf`, I hope
that it will become useful as a general starting point for many people.

The basic theory of use is simple:

1. `git clone <this repo>`
2. `cd <cloned location>`
3. `./install.sh`
4. Reload your terminal

this will load all the appropriate bits, linking configuration files and so on
into your home directory. At some point in the near future, it may require a bit
more in the way of pre-flight configuration, but for the moment this is what it
is.

## Wiki

Make sure you browse around the wiki for more details on usage, problems I've
encountered (and ideally their solutions) and so on. Check the 'pages' tab to
see everything. The wiki is cloned as a subtree under `notes/` and is maintained
inline with this repo.
