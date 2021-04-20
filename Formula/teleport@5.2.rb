class TeleportAT52 < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://get.gravitational.com/teleport-v5.2.1-darwin-amd64-bin.tar.gz"
  sha256 "73408a0363c496ea5023eb671ab906d8d99046dba3ca732fe259be6baa640df1"

  keg_only :versioned_formula

  depends_on "go" => :build

  conflicts_with "etsh", :because => "both install `tsh` binaries"

  def install
    bin.install ["tctl", "teleport", "tsh"]
  end

  test do
#    system "#{bin}/teleport", "version"
    assert_match version.to_s, shell_output("#{bin}/teleport version")  end
end
