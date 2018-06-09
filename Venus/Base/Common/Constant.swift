//
//  Constant.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import XCGLogger
import Foundation

let log: XCGLogger? = {
    #if DEBUG
    let log = XCGLogger.default
    log.setup(level: .debug,
              showFunctionName: false,
              showThreadName: true,
              showLevel: true,
              showFileNames: true,
              showLineNumbers: true,
              writeToFile: nil,
              fileLevel: .debug)
    let emojiLogFormatter = PrePostFixLogFormatter()
    emojiLogFormatter.apply(prefix: " 🗯🗯🗯 ", postfix: " 🗯🗯🗯 ", to: .verbose)
    emojiLogFormatter.apply(prefix: " 🔹🔹🔹 ", postfix: " 🔹🔹🔹 ", to: .debug)
    emojiLogFormatter.apply(prefix: " ℹ️ℹ️ℹ️ ", postfix: " ℹ️ℹ️ℹ️ ", to: .info)
    emojiLogFormatter.apply(prefix: " ⚠️⚠️⚠️ ", postfix: " ⚠️⚠️⚠️ ", to: .warning)
    emojiLogFormatter.apply(prefix: " ‼️‼️‼️ ", postfix: " ‼️‼️‼️ ", to: .error)
    emojiLogFormatter.apply(prefix: " 💣💣💣 ", postfix: " 💣💣💣 ", to: .severe)
    log.formatters = [emojiLogFormatter]
    return log
    #else
    return nil
    #endif
}()
