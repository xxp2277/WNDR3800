#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a

sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git smartdns https://github.com/pymumu/smartdns.git' feeds.conf.default
#
./scripts/feeds update -a && ./scripts/feeds install -a
#
cd package/lean
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git
cd ../..
sed -i 's/+luci-theme-bootstrap / /g' ./feeds/luci/collections/luci/Makefile
