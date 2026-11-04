# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.15.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.15.0/jeet-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "fe00236308504672fdd842f4c36016706f0f5a5183caa3e777f03550b92dcbcf"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.15.0/jeet-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "59fb1063eb686f34fd300ccb8fd5cc6aeb7033a1ce8fd57457f61882487213f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.15.0/jeet-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0dd4ab99fb0374c3258897787308f7400336ce53c95e9ccadd75f3f79006ebf1"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.15.0/jeet-v0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3eeb541a90abc8e90ceafe6d0d97f6ad0de7cb91127cc85714e8be2951ec19f"
    end
  end

  depends_on "git"

  def install
    bin.install "jeet"
    generate_completions_from_executable(bin/"jeet", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
