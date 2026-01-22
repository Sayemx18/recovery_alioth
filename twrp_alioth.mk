#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2021-2024 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Release name
PRODUCT_RELEASE_NAME := alioth

DEVICE_PATH := device/xiaomi/$(PRODUCT_RELEASE_NAME)

# Inherit from alioth device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit some common twrp stuff
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F3

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
#
