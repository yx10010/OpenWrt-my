#!/bin/bash


# Modify default IP
sed -i 's/192.168.1.1/192.168.88.2/g' package/base-files/files/bin/config_generate

sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/arm/index.htm

# 移除重复软件包
rm -rf feeds/luci/themes/luci-theme-argon

# Themes
git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

#取消原主题luci-theme-bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
