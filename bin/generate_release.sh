#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

(

  VERSION=$1

  cd "${SCRIPT_DIR}" || exit

  cd ../

  rm -rf temp/

  mkdir -p dist/
  mkdir -p temp/

  git clone --depth=1 https://github.com/HandcrankEngine/HandcrankEngine.git temp/

  cp -r temp/include/ dist/

  zip -r dist.zip dist

  hash=$(sha256sum dist.zip | awk '{print ""$1""}')

  cat >handcrankengine.rb <<EOF
class Handcrankengine < Formula
  version "${VERSION//v/}"
  desc "Handcrank Engine is a cross-platform game engine written in C++ utilizing SDL."
  homepage "https://github.com/HandcrankEngine/HandcrankEngine"
  url "https://github.com/HandcrankEngine/homebrew-handcrankengine/archive/refs/tags/v${VERSION//v/}/dist.zip"
  sha256 "${hash}"
  license "MIT"

  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_ttf"
  depends_on "sdl2_mixer"

  def install
    include.install Dir["Handcrank/*"]
  end
end
EOF

  rm -rf dist/
  rm -rf temp/

)
