#!/bin/sh

#  SwiftGen.sh
#  NEPitUP
#
#  Created by Jimmy Pham on 11/30/17.
#  Copyright © 2017 TaySon. All rights reserved.

swiftgen xcassets -t swift4 $TARGET_NAME/Supporting\ Files/Assets.xcassets -o $TARGET_NAME/Supporting\ Files/Resources/Assets/UIImage+Assets.swift
swiftgen colors -t swift4 $TARGET_NAME/Supporting\ Files/Resources/VESColor.txt -o $TARGET_NAME/Supporting\ Files/Resources/Assets/UIColor+VESColor.swift
#swiftgen fonts -t swift4 $TARGET_NAME/Resources/Fonts -o $TARGET_NAME/Resources/Assets/NEPFont.swift

if [[ $? != 0 ]] ; then
cat << EOM
error: Failed to run the swiftgen command. If you do not have swiftgen installed, you can install it via homebrew:

$ brew update
$ brew install swiftgen

For more information, visit 'https://github.com/AliSoftware/SwiftGen'.
EOM
exit 1
fi

