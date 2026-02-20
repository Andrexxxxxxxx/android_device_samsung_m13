#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_m13.mk

COMMON_LUNCH_CHOICES := \
    twrp_m13-user \
    twrp_m13-userdebug \
    twrp_m13-eng
