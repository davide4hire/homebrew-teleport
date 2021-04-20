class TeleportAT61 < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://get.gravitational.com/teleport-v6.1.1-darwin-amd64-bin.tar.gz"
  sha256 "36cd65bc76a977170b4942f9b2b6df181caddb1f3d081089c28da8c2ad0bdbda"

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
