#!/bin/bash
set -e

echo "==> Clean feeds"
./scripts/feeds clean

echo "==> Update feeds"
./scripts/feeds update base packages luci routing telephony
./scripts/feeds update helloworld

echo "==> Remove helloworld packages that pull host gn"
rm -rf feeds/helloworld/gn
rm -rf feeds/helloworld/v2ray-core
rm -rf feeds/helloworld/sing-box
rm -rf feeds/helloworld/naiveproxy
rm -rf feeds/helloworld/hysteria

echo "==> Install required packages only"
./scripts/feeds install luci-app-ssr-plus

echo "==> Done"
