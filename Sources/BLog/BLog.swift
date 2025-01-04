//
//  BLog - A Simple Swift Logging Utility
//

import os.log
import Foundation

public enum LogLevel {
    case debug
    case info
    case warning
    case error
}

public struct BLog {
    private let logger: Logger
    private let prefix: String
    
    public init(subsystem: String, category: String, prefix: String) {
        self.logger = Logger(subsystem: subsystem, category: category)
        self.prefix = prefix
    }
    
    private func prefixedMessage(_ message: String) -> String {
        return "\(prefix) \(message)"
    }

    public func pinfo(_ message: String, _ args: CVarArg...) {
        let formattedMessage = prefixedMessage(String(format: message, arguments: args))
        logger.info("\(formattedMessage, privacy: .private)")
    }
    
    public func pdebug(_ message: String, _ args: CVarArg...) {
        let formattedMessage = prefixedMessage(String(format: message, arguments: args))
        logger.debug("\(formattedMessage, privacy: .private)")
    }
    
    public func perror(_ message: String, _ args: CVarArg...) {
        let formattedMessage = prefixedMessage(String(format: message, arguments: args))
        logger.error("\(formattedMessage, privacy: .private)")
    }
}
