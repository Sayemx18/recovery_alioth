#!/system/bin/sh

###############################################################################
# healthy-boot.sh
#
# This script is intended to be run during recovery boot to prevent a bootloop
# caused by VINTF parsing errors on incompatible manifest files.
#
# Context:
# - At runtime, some systems dynamically create the file:
#     /system/etc/vintf/manifest/boot-service.qti.xml
#
# - This file uses <manifest version="9.0">, which is not supported by
#   the libvintf version 4.0 present in recoveries based on Fox_12.1.
#
# - Due to this version mismatch, hwservicemanager fails to parse the file,
#   resulting in:
#     "VINTF parse error: Unrecognized manifest.version 9.0 (libvintf@4.0)"
#   and causes the recovery to bootloop.
#
# - Attempting to override this file by pre-placing an identical version
#   with a downgraded <version="4.0"> does not work either, because the file
#   resides in the /system/etc/vintf/manifest/ path — which is reserved
#   for "framework" manifests, not "device" ones.
#
#   As a result, libvintf throws:
#     "Cannot add a device manifest to a framework manifest"
#
# Solution:
# - This script checks for the existence of the problematic manifest fragment
#   and deletes it if found.
# - It should be called as an init service after /system is mounted and
#   before hwservicemanager starts.
###############################################################################

TARGET_FILE="/system/etc/vintf/manifest/boot-service.qti.xml"

if [ -f "$TARGET_FILE" ]; then
    rm -f "$TARGET_FILE"
fi
