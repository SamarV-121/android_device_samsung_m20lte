#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Required!
export DEVICE=m20lte
export DEVICE_COMMON=universal7904-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
