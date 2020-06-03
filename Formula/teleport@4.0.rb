class TeleportAT40 < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://get.gravitational.com/teleport-v4.0.16-darwin-amd64-bin.tar.gz"
  sha256 "c83403aaeafa22150322b279134a4830c12b84b89ad6672feee908ea3768e9fa"

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
