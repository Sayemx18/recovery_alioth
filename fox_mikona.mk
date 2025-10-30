#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023-2025 The OrangeFox Recovery Project
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

# screen settings
OF_SCREEN_H := 2400
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 56
OF_STATUS_INDENT_RIGHT := 48
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1

# other stuff
OF_USE_GREEN_LED := 0
OF_QUICK_BACKUP_LIST := /boot;/data;
OF_ENABLE_LPTOOLS := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# full size
OF_DYNAMIC_FULL_SIZE := 9126805504

# number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9

# ----- data format stuff -----
# ensure that /sdcard is bind-unmounted before f2fs data repair or format
OF_UNBIND_SDCARD_F2FS := 1

# automatically wipe /metadata after data format
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1

# avoid MTP issues after data format
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1

# refresh encryption props before formatting data
#  OF_REFRESH_ENCRYPTION_PROPS_BEFORE_FORMAT := 1

ifeq ($(FOX_VENDOR_BOOT_RECOVERY),1)
   OF_RECOVERY_AB_FULL_REFLASH_RAMDISK := 1
else
   OF_USE_LZ4_COMPRESSION := 1
endif

# build all the partition tools
OF_ENABLE_ALL_PARTITION_TOOLS := 1

# add dmctl
OF_USE_DMCTL := 1
#
