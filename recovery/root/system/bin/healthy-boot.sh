#!/system/bin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
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
#     VINTF parse error: Unrecognized manifest.version 9.0 (libvintf@4.0)"
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
# - This script deletes the problematic manifest fragment if found.
# - It should be called as an init service after /system is mounted and
#   before hwservicemanager starts.
#
rm -f "/system/etc/vintf/manifest/boot-service.qti.xml";
exit 0;
