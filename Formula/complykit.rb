class Complykit < Formula
  desc "Compliance-as-code CLI for startups — SOC2, HIPAA, CIS scanning"
  homepage "https://github.com/nuvlabs/complykit"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nuvlabs/complykit/releases/download/v0.1.0/complykit-v0.1.0-darwin-arm64.tar.gz"
      sha256 "86cd21742114394a0170809a24539691d010606b0a2040f4d607bf7ded830e95"
    end
    on_intel do
      url "https://github.com/nuvlabs/complykit/releases/download/v0.1.0/complykit-v0.1.0-darwin-amd64.tar.gz"
      sha256 "1a08f8ced145f582b5fb4ada23734dc479518d7bb11658d5b38829c5167df736"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuvlabs/complykit/releases/download/v0.1.0/complykit-v0.1.0-linux-arm64.tar.gz"
      sha256 "0df18faf403f154ff91bb5ff98d993f49c04d2fdc662f671aac1bc9995187e5b"
    end
    on_intel do
      url "https://github.com/nuvlabs/complykit/releases/download/v0.1.0/complykit-v0.1.0-linux-amd64.tar.gz"
      sha256 "ab6c362ecb41dd7f203f621d4ffc19405fda55e727306bd22607b3206ce3a49c"
    end
  end

  def install
    bin.install Dir["comply-*"].first => "comply"
  end

  def caveats
    <<~EOS
      Get started:
        comply init          # 2-minute setup wizard
        comply scan          # scan your AWS / GCP / GitHub
        comply fix           # see remediation steps
        comply serve         # open web dashboard at localhost:8080

      Docs: https://github.com/nuvlabs/complykit
    EOS
  end

  test do
    assert_match "ComplyKit", shell_output("#{bin}/comply --help")
    assert_match "scan", shell_output("#{bin}/comply --help")
    assert_match "fix",  shell_output("#{bin}/comply --help")
  end
end
