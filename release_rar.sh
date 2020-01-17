#!/bin/sh

DIR_NAME=`basename ${PWD}`
COMMIT_ID=`git rev-parse --short HEAD`
DATE_DAY=`git show -s --format=%ai | cut -d ' ' -f1 | sed s#-##g`

echo "=====> DIR:  $DIR_NAME"
echo "=====> Date: $DATE_DAY"
echo "=====> ID:   $COMMIT_ID"

PATCH_CMD="rar a -r \
../$DIR_NAME-Patch.$DATE_DAY.$COMMIT_ID.rar \
../$DIR_NAME \
-x../$DIR_NAME/.git \
-x../$DIR_NAME/.gitignore \
-x../$DIR_NAME/force_update_from_remote.bat \
-x../$DIR_NAME/MfgTool.log \
-x../$DIR_NAME/release_rar.sh \
-x../$DIR_NAME/Profiles/Linux/OS\ Firmware/image-L4.9.88-rootfs \
-x../$DIR_NAME/Profiles/Linux/OS\ Firmware/mfgfiles-L4.9.88/mfg-zImage-myimx6a7"
echo -e "\n=====> RAR CMD[Patch]:\n$PATCH_CMD"

BASE_CMD="rar a -r \
../$DIR_NAME-Base.$DATE_DAY.$COMMIT_ID.rar \
../$DIR_NAME/Profiles/Linux/OS\ Firmware/image-L4.9.88-rootfs \
../$DIR_NAME/Profiles/Linux/OS\ Firmware/mfgfiles-L4.9.88/mfg-zImage-myimx6a7"
echo -e "\n=====> RAR CMD[Base]:\n$BASE_CMD"
