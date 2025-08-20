class Handcrankengine < Formula
  version "0.0.1"
  desc "Handcrank Engine is a cross-platform game engine written in C++ utilizing SDL."
  homepage "https://github.com/HandcrankEngine/HandcrankEngine"
  url "https://github.com/HandcrankEngine/homebrew-handcrankengine/archive/refs/tags/v0.0.1/dist.zip"
  sha256 "368717357f4f0a458785c1ea505ebf21844fb29375eb575e1a0fc63258e90b85"
  license "MIT"

  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_ttf"
  depends_on "sdl2_mixer"

  def install
    include.install Dir["Handcrank/*"]
  end
end
