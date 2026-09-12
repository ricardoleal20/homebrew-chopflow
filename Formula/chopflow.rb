class Chopflow < Formula
  desc "Durable distributed task queue built in Rust"
  homepage "https://github.com/ricardoleal20/ChopFlow"
  url "https://crates.io/api/v1/crates/chopflow/0.1.2/download"
  sha256 "67dff3cb7dd13be6844278c033bd240dc134cc364d30ec2d4655769b78bee853"
  license "Apache-2.0"
  version "0.1.2"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "chopflow-broker", shell_output("#{bin}/chopflow-broker --help")
    assert_match "chopflow-cli", shell_output("#{bin}/chopflow-cli --help")
    assert_match "chopflow-mcp", shell_output("#{bin}/chopflow-mcp --help")
  end
end
