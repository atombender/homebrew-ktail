require 'formula'

class Ktail < Formula
  desc "A tool to tail Kubernetes pod logs"
  homepage 'https://github.com/atombender/ktail'
  head 'https://github.com/atombender/ktail.git'
  url 'https://github.com/atombender/ktail.git',
    :tag => 'v1.4.0'

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/atombender/ktail"
    dir.install buildpath.children

    cd dir do
      system "make"
      bin.install "build/ktail"
    end
  end

  test do
    system "#{bin}/ktail", "--help"
  end
end
