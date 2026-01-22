#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2022-2025 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Our various search paths for Soong namespaces
MIKONA_SOONG_PATHS := device/xiaomi/alioth #device/xiaomi/sm8250-common # device/xiaomi/mikona device/xiaomi/munch

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure gsi_keys.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 31

# frame rate
TW_FRAMERATE := 120

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(MIKONA_SOONG_PATHS) \
	vendor/qcom/opensource/commonsys-intf/display

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vendor_boot \
    odm \
    vbmeta \
    vbmeta_system \

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    bootctrl.xiaomi_sm8250.recovery \
    android.hardware.boot@1.1-impl-qti.recovery

PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# fastbootd
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.0-impl-mock \
	android.hardware.fastboot@1.0-impl-mock.recovery \
	fastbootd

# Recovery libs
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so

# Qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Platform
PLATFORM_VERSION := 99.87.36
PLATFORM_SECURITY_PATCH := 2127-12-31
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/recovery/security/miui

# skip some snapshot stuff in update_engine
PRODUCT_PROPERTY_OVERRIDES += \
	ro.virtual_ab.skip_snapshot_creation=true

#--------------------------
# to work around a (hash verification) ROM flashing error caused by crDroid+NikGapps on alioth
# (see the edits in update_engine's payload_consumer/filesystem_verifier_action.cc -
# ro.virtual_ab.skip_verify_source_hash=true)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.virtual_ab.skip_verify_source_hash=true
#--------------------------
#
