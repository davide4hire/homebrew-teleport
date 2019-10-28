# Version Specific Teleport Tap

homebrew-core only has formula for latest versions of teleport.  This Tap allows the installs of previous major versions of Teleport.

```bash
brew tap jmoney8080/teleport
brew install teleport@<version>
```

You can either update your `$PATH` for the version of Teleport installed, or you can tell Homebrew to link a version for you:

```bash
brew link --force teleport@<version>
```

If the above command is scary then the following command will print what is going to be changed

```bash
brew link --force --dry-run teleport@<version>
```

## Versions

- [Teleport 2.7](https://gravitational.com/teleport/docs/ver/2.7/)
- [Teleport 3.0](https://gravitational.com/teleport/docs/ver/3.0)
- [Teleport 3.1](https://gravitational.com/teleport/docs/ver/3.1)
- [Teleport 3.2](https://gravitational.com/teleport/docs/ver/3.2)
- [Teleport 4.0](https://gravitational.com/teleport/docs/ver/4.0)
- [Teleport 4.1](https://gravitational.com/teleport/docs/ver/4.1)

=======

# Adding New Versions
Adding another version is fairly straightforward. Technically, it is
adding a file into the `Formula` subdirectory with the proper
information for the version. Realisticly, it's better to copy an
existing file and make the changes to it.

There are three changes - the name of the class (on first line), the
URL to the archive file, the sha256 hash of the archive
file. Computing the sha256 hash requires the archive file. So it must
be downloaded locally and then run the `shasum -a 256` command on a
Mac.
