#!/usr/bin/env bash

mkdir -p extraui
dt=$(date -R)
cat > extraui/en.yaml <<EOF
infobar: >
  <i class="fas fa-exclamation-circle"></i> This is a snapshot offline built for FurryGamesIndex (Build datetime: ${dt}). The upstream online version may already have a lot of improvements. <a href="https://furrygamesindex.github.io/">Click here to switch to the online version</a>
EOF
cat > extraui/zh-cn.yaml <<EOF
infobar: >
  <i class="fas fa-exclamation-circle"></i> 这是一个 FurryGamesIndex 的离线快照构建（构建时间：${dt}）。上游在线版本可能已经有了重大改进。<a href="https://furrygamesindex.github.io/">点击此处切换到在线版本</a>
EOF
./zhconv.py --no-builtin extraui/zh-cn.yaml:extraui/zh-tw.yaml
./generate.py --no-sitemap --no-purge-prev-builds --download-external-images --extra-ui extraui "${1:-output}"
