#!/bin/sh

#  SwiftGen.sh
#  NEPitUP
#
#  Created by Jimmy Pham on 11/30/17.
#  Copyright © 2017 TaySon. All rights reserved.

$PODS_ROOT/SwiftGen/bin/swiftgen xcassets -t swift4 $TARGET_NAME/Supporting\ Files/Assets.xcassets -o $TARGET_NAME/Supporting\ Files/Resources/Assets/UIImage+Assets.swift
$PODS_ROOT/SwiftGen/bin/swiftgen colors -t swift4 $TARGET_NAME/Supporting\ Files/Resources/VESColor.txt -o $TARGET_NAME/Supporting\ Files/Resources/Assets/UIColor+VESColor.swift
$PODS_ROOT/SwiftGen/bin/swiftgen fonts -t swift4 $TARGET_NAME/Supporting\ Files/Resources/Fonts -o $TARGET_NAME/Supporting\ Files/Resources/Assets/VESFont.swift
