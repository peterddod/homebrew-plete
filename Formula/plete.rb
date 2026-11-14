# typed: false
# frozen_string_literal: true

class Plete < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/plete"
  version "0.16.0"
  license "MIT"
  head "https://github.com/peterddod/plete.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/plete/releases/download/v0.16.0/plete-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "5397179501d4dc3d86b7b2daac5abc97c72f7b2ed7a6daace2309238deaf33c0"
    end
    on_intel do
      url "https://github.com/peterddod/plete/releases/download/v0.16.0/plete-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "c717188a54a8f3f3a867d6312d32a3d1f70a8b55d9eccea1c3fed22eb2fd4a47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/plete/releases/download/v0.16.0/plete-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81d12871662e66bbe7c84ce4f05fbbcdf53ce60c34133e3f5cba2e07f529ceca"
    end
    on_intel do
      url "https://github.com/peterddod/plete/releases/download/v0.16.0/plete-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "847463d254556679f09d11932e42ad7d4a0342eb445eacc6bc625160e89b2b66"
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
