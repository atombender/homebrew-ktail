require 'formula'

class Ktail < Formula
  homepage 'https://github.com/atombender/ktail'
  url 'https://github.com/atombender/ktail.git',
    :tag => 'v0.7.0'

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/atombender/ktail"
    dir.install buildpath.children

    cd dir do
      system "dep ensure -vendor-only"
      system "make"
      bin.install "build/ktail"
    end
  end

  test do
    system "#{bin}/ktail", "--help"
  end
end
