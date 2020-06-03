class TeleportAT42 < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://get.gravitational.com/teleport-v4.2.10-darwin-amd64-bin.tar.gz"
  sha256 "425b48c1de4da30a8ad291d884612c248d4a2ccc6527bdfb59d0616166f6bd14"

  keg_only :versioned_formula

  depends_on "go" => :build

  conflicts_with "etsh", :because => "both install `tsh` binaries"

  def install
    bin.install ["tctl", "teleport", "tsh"]
  end

  test do
    system "#{bin}/teleport", "version"
  end
end
