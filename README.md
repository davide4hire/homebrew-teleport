# Version Specific Teleport Tap

homebrew-core only has formula for latest versions of teleport.  This Tap allows the installs previous versions

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

_**Note:** Teleport 4.0 is the current stable version installed by default through Homebrew.
