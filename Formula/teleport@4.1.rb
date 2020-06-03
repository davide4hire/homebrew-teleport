class TeleportAT41 < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://get.gravitational.com/teleport-v4.1.10-darwin-amd64-bin.tar.gz"
  sha256 "e96154b438177c8b765152025130c235c5da2c539ac5df378ed6c5cce9fe8f25"

  keg_only :versioned_formula

#  depends_on "go" => :build

  conflicts_with "etsh", :because => "both install `tsh` binaries"

  def install
    bin.install ["tctl", "teleport", "tsh"]
  end

  test do
    system "#{bin}/teleport", "version"
  end
end
