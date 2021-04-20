# Version Specific Teleport Tap

This repo can be used as a [Homebrew](https://brew.sh/) `tap` to facilitate the
installation of a specific `major.minor` version of the
[Teleport](https://github.com/gravitational/teleport) client for Mac
OSX. Why? Because homebrew-core only has formula for the latest
version of teleport. As [Gravitational](https://gravitational.com/)
updates [Teleport](https://gravitational.com/teleport/), the
homebrew-core version of teleport is updated. And sometimes newer
versions of the client are not compatible with older versions of the
Teleport servers available to you.

## How to Use this Tap

It is easy to add this repo as a `tap` for Homebrew. The following
command can be used:

    brew tap davide4hire/teleport

And, once the tap is available the following command will install a
version: 

    brew install teleport@<version>

Where `<version>` is a major.minor version like 3.1 or 4.2. The patch
version is controlled by the formula in this repo. If a patch update
is required or available, it can be installed via the standard
Homebrew command:

    brew upgrade teleport@<version>

Below is the transcript of a `brew install` command:
````/bin/bash
$ brew install teleport@5.2
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 2 taps (davide4hire/teleport and homebrew/cask).
==> New Formulae
davide4hire/teleport/teleport@5.2                            davide4hire/teleport/teleport@6.1
==> Updated Casks
Updated 4 casks.

==> Installing teleport@5.2 from davide4hire/teleport
==> Downloading https://ghcr.io/v2/homebrew/core/go/manifests/1.16.3
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/go/blobs/sha256:69c28f5e60612801c66e51e93d32068f822b245ab83246cb6cb3745
==> Downloading from https://pkg-containers-az.githubusercontent.com/ghcr1/blobs/sha256:69c28f5e60612801c66e51e93d32068f
######################################################################## 100.0%
==> Downloading https://get.gravitational.com/teleport-v5.2.1-darwin-amd64-bin.tar.gz
######################################################################## 100.0%
==> Installing dependencies for davide4hire/teleport/teleport@5.2: go
==> Installing davide4hire/teleport/teleport@5.2 dependency: go
==> Pouring go--1.16.3.catalina.bottle.tar.gz
🍺  /usr/local/Cellar/go/1.16.3: 9,955 files, 503.5MB
==> Installing davide4hire/teleport/teleport@5.2
==> Caveats
teleport@5.2 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have teleport@5.2 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/teleport@5.2/bin:$PATH"' >> /Users/davide/.bash_profile

==> Summary
🍺  /usr/local/Cellar/teleport@5.2/5.2.1: 7 files, 164MB, built in 15 seconds
==> Caveats
==> teleport@5.2
teleport@5.2 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have teleport@5.2 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/teleport@5.2/bin:$PATH"' >> /Users/davide/.bash_profile
````

## Using Different Versions of Teleport

Once you've installed a specific version of Telport, you have to
enable it. The `brew install` command put it in the correct location,
but it did not link it into `/usr/local/bin`. There should have been a
message in the output of the install command to that effect.

There are two methods to make a version available to interactive
shells. You can update your `PATH` environment variable to include the
specific Teleport version `bin` directory. Just be sure to put it before
`/usr/local/bin`. The directory will be something like
`/usr/local/Cellar/teleport@<version>/x.x.x/bin`. 

The other method is to have `brew` put the links into
`/usr/local/bin`. This can be done via the command:

    brew link --overwrite --force teleport@<version>

If the above command is scary then the following command will print what is going to be changed

    brew link --overwrite --force --dry-run teleport@<version>

It will probably show which links would be removed, but it doesn't
show they would be recreated. But they do get recreated properly. 

## Versions

The following versions are currently available:

- [Teleport 2.7](https://goteleport.com/docs/ver/2.7) @ 2.7.6
- [Teleport 3.0](https://goteleport.com/docs/ver/3.0) @ 3.0.1
- [Teleport 3.1](https://goteleport.com/docs/ver/3.1) @ 3.1.9
- [Teleport 3.2](https://goteleport.com/docs/ver/3.2) @ 3.2.6
- [Teleport 4.0](https://goteleport.com/docs/ver/4.0) @ 4.0.16
- [Teleport 4.1](https://goteleport.com/docs/ver/4.1) @ 4.1.10
- [Teleport 4.2](https://goteleport.com/docs/ver/4.2) @ 4.2.10
- [Teleport 6.1](https://goteleport.com/docs/ver/6.1) @ 6.1.1

# Adding New Versions
Adding another version is fairly straightforward. Technically, it is
adding a file into the `Formula` subdirectory with the proper
information for the version. Realistically, it's better to copy an
existing file and make the changes to it.

There are three changes - the name of the class (on first line), the
URL to the archive file, the sha256 hash of the archive
file. Computing the sha256 hash requires the archive file. So it must
be downloaded locally and then run the `shasum -a 256` command on a
Mac.

The teleport release artifacts can be downloaded from
[Download Teleport](https://goteleport.com/teleport/download)
pages. For a mac, the following commands will download the file for a
version and compute the SHA256 sum:

    VERSION=5.2.1
	FILE_NAME=teleport-v${VERSION}-darwin-amd64-bin.tar.gz
	wget https://get.gravitational.com/${FILE_NAME}
	shasum -a 256 ${FILE_NAME}

# Acknowledgements

This repository started as a fork of
[repository](https://github.com/jmoney8080/homebrew-teleport) from
[Jonathan Monette](https://github.com/jmoney8080). I added more
versions and figured out a way to install the binary tar file instead
of building from the source.
