#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        odm/etc/camera/*.xml)
	    sed -i 's/gb2312/utf-8/g' "${2}"
	    sed -i 's/GB2312/UTF-8/g' "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=anne
export DEVICE_COMMON=hi6250-9-common
export VENDOR=huawei

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
