class TeleportAT42 < Formula
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://gravitational.com/teleport"
  url "https://get.gravitational.com/teleport-v4.2.9-darwin-amd64-bin.tar.gz"
  sha256 "d722b8b938f53f711bec532de40bedc24ef12c297bd2f450d5d290bb1949915f"
#  url "https://github.com/gravitational/teleport/archive/v4.2.10.tar.gz"
#  sha256 "487ddde0bb5e303d0e116e3f4d3155f1ed6792b7cfb8d823d8843a69b37ceed9"

  keg_only :versioned_formula

  depends_on "go" => :build

  conflicts_with "etsh", :because => "both install `tsh` binaries"

  def install
    bin.install ["tctl", "teleport", "tsh"]
##    ENV["GOOS"] = "darwin"
##    ENV["GOARCH"] = Hardware::CPU.is_64_bit? ? "amd64" : "386"
##    ENV["GOPATH"] = buildpath
##    ENV["GOROOT"] = Formula["go"].opt_libexec
##
##    (buildpath/"src/github.com/gravitational/teleport").install buildpath.children
##    cd "src/github.com/gravitational/teleport" do
##      ENV.deparallelize { system "make", "full" }
##      bin.install Dir["build/*"]
##      prefix.install_metafiles
##    end
  end

  test do
    system "#{bin}/teleport", "version"
##    assert_match version.to_s, shell_output("#{bin}/teleport version")
##    (testpath/"config.yml").write shell_output("#{bin}/teleport configure")
##      .gsub("0.0.0.0", "127.0.0.1")
##      .gsub("/usr/bin/hostname", "/bin/hostname")
##      .gsub("/var/lib/teleport", testpath)
##      .gsub("/var/run", testpath)
##      .gsub(/https_(.*)/, "")
##    begin
##      pid = spawn("#{bin}/teleport start -c #{testpath}/config.yml")
##      sleep 5
##      system "/usr/bin/curl", "--insecure", "https://localhost:3080"
##      system "/usr/bin/nc", "-z", "localhost", "3022"
##      system "/usr/bin/nc", "-z", "localhost", "3023"
##      system "/usr/bin/nc", "-z", "localhost", "3025"
##    ensure
##      Process.kill(9, pid)
##    end
  end
end
