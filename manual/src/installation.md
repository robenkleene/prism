# Installation

You can download an executable for your system:
[Linux (glibc)](https://github.com/dandavison/prism/releases/download/0.14.0/prism-0.14.0-x86_64-unknown-linux-gnu.tar.gz)
|
[Linux (musl)](https://github.com/dandavison/prism/releases/download/0.14.0/prism-0.14.0-x86_64-unknown-linux-musl.tar.gz)
|
[MacOS](https://github.com/dandavison/prism/releases/download/0.14.0/prism-0.14.0-x86_64-apple-darwin.tar.gz)
|
[Windows](https://github.com/dandavison/prism/releases/download/0.14.0/prism-0.14.0-x86_64-pc-windows-msvc.zip)
|
[All](https://github.com/dandavison/prism/releases)

Alternatively you can install prism using a package manager: see [repology.org/git-prism](https://repology.org/project/git-prism/versions).

Note that the package is often called `git-prism`, but the executable installed is called `prism`. Here is a quick summary for selected package managers:

<table>
  <tr>
    <td><a href="https://archlinux.org/packages/community/x86_64/git-prism/">Arch Linux</a></td>
    <td><code>pacman -S git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://crates.io/crates/git-prism">Cargo</a></td>
    <td><code>cargo install git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://src.fedoraproject.org/rpms/rust-git-prism">Fedora</a></td>
    <td><code>dnf install git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://pkgs.org/download/git-prism">FreeBSD</a></td>
    <td><code>pkg install git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://packages.gentoo.org/packages/dev-util/git-prism">Gentoo</a></td>
    <td><code>emerge dev-util/git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://formulae.brew.sh/formula/git-prism">Homebrew</a></td>
    <td><code>brew install git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://ports.macports.org/port/git-prism/summary">MacPorts</a></td>
    <td><code>port install git-prism</code></td>
  </tr>
  <tr>
    <td><a href="https://search.nixos.org/packages?show=prism&query=prism">Nix</a></td>
    <td><code>nix-env -iA nixpkgs.prism</code>
  </tr>
  <tr>
    <td><a href="https://cvsweb.openbsd.org/ports/textproc/prism/">OpenBSD</a></td>
    <td><code>pkg_add prism</code></td>
  </tr>
  <tr>
    <td><a href="https://software.opensuse.org/package/git-prism">openSUSE Tumbleweed</a></td>
    <td><code>zypper install git-prism</code>
  </tr>
  <tr>
    <td><a href="https://github.com/void-linux/void-packages/tree/master/srcpkgs/prism">Void Linux</a></td>
    <td><code>xbps-install -S prism</code>
  </tr>
  <tr>
    <td>Windows (<a href="https://chocolatey.org/packages/prism">Chocolatey</a>)</td>
    <td><code>choco install prism</code></td>
  </tr>
  <tr>
    <td>Windows (<a href="https://scoop.sh/">Scoop</a>)</td>
    <td><code>scoop install prism</code></td>
  </tr>
  <tr>
    <td>Debian / Ubuntu</td>
    <td>
      <code>dpkg -i file.deb</code>
      <br>
      .deb files are on the <a href="https://github.com/dandavison/prism/releases">releases</a> page.
      <br>
      <sup>If you are using Ubuntu <= 19.10 or are mixing apt sources, please read <a href="https://github.com/dandavison/prism/issues/504">#504</a>.</sup>
    </td>
  </tr>
</table>

Users of older MacOS versions (e.g. 10.11 El Capitan) should install using Homebrew, Cargo, or MacPorts: the binaries on the release page will not work.

Behind the scenes, prism uses [`less`](https://www.greenwoodsoftware.com/less/) for paging.
It's important to have a reasonably recent version of less installed.
On MacOS, install `less` from Homebrew. For Windows, see [Using Prism on Windows](./using-prism-on-windows.md).
