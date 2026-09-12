class Chopflow < Formula
  desc "Durable distributed task queue built in Rust"
  homepage "https://github.com/ricardoleal20/ChopFlow"
  url "https://crates.io/api/v1/crates/chopflow/0.1.3/download"
  sha256 "6a7e7a46502c4be47ad4e05021b8a598f0299f551174aed716d4e41bc857d613"
  license "Apache-2.0"
  version "0.1.3"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "unified command", shell_output("#{bin}/chopflow --help")
    assert_match "broker", shell_output("#{bin}/chopflow broker --help")
    assert_match "MCP server", shell_output("#{bin}/chopflow mcp --help")
  end
end
