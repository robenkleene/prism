class GitPrism < Formula
  version "0.14.0"
  desc "A viewer for git and diff output"
  homepage "https://github.com/dandavison/prism"

  disable! because: "it is now in homebrew core. Please reinstall it as follows:\nbrew untap dandavison/prism\nbrew install git-prism\n"

  if OS.mac?
      url "https://github.com/dandavison/prism/releases/download/#{version}/prism-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7dfa3b25c793de6cf58316c3c3aa90cdd4f856da837c35775e1e49b753deba53"
  elsif OS.linux?
      url "https://github.com/dandavison/prism/releases/download/#{version}/prism-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ecfbc3e4508646ec985fbcb5a3a89480f25f0c044d02b2308c2053aba8f42ef9"
  end

  conflicts_with "prism"

  def install
    bin.install "prism"
    ohai "To configure git to use prism, run:"
    ohai "git config --global core.pager \"prism --dark\"  # --light for light terminal backgrounds"
  end

  test do
    shell_output "#{bin}/prism --show-syntax-themes"
  end
end
