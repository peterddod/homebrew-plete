# typed: false
# frozen_string_literal: true

class Plete < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/plete"
  version "0.17.0"
  license "MIT"
  head "https://github.com/peterddod/plete.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/plete/releases/download/v0.17.0/plete-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "7718d6e9b99985862f169652c47c49b070c016bbe124e738b3a7c72725074665"
    end
    on_intel do
      url "https://github.com/peterddod/plete/releases/download/v0.17.0/plete-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ec21d6d8d70869896612c1a64bdae703c42d521c8c9416797ad309ef92e5017"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/plete/releases/download/v0.17.0/plete-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e832664b8cb4197417f3f5009a254c6a73d2e4b0fa45fd9512da40d406f7f3c0"
    end
    on_intel do
      url "https://github.com/peterddod/plete/releases/download/v0.17.0/plete-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df984ec468d4a9bc1c786ee695edefd57113c4ad61bc5bb18911ace2f4cf0792"
    end
  end

  depends_on "git"

  def install
    bin.install "plete"
    # Renamed from jeet: running agents' hooks and launchd jobs call
    # bin/jeet, so it stays as a link. pt is never installed here; see
    # `plete alias install`.
    bin.install_symlink bin/"plete" => "jeet"
    generate_completions_from_executable(bin/"plete", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plete --version")
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
