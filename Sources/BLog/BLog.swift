import os.log
import Foundation

struct PrefixedLogger {
    private let logger: Logger
    private let prefix: String
    
    init(subsystem: String, category: String, prefix: String) {
        self.logger = Logger(subsystem: subsystem, category: category)
        self.prefix = prefix
    }
    
    private func prefixedMessage(_ message: String) -> String {
        return "\(prefix) \(message)"
    }

    func pinfo(_ message: String, _ args: CVarArg...) {
        let formattedMessage = prefixedMessage(String(format: message, arguments: args))
        logger.info("\(formattedMessage, privacy: .private)")
    }
    
    func pdebug(_ message: String, _ args: CVarArg...) {
        let formattedMessage = prefixedMessage(String(format: message, arguments: args))
        logger.debug("\(formattedMessage, privacy: .private)")
    }
    
    func perror(_ message: String, _ args: CVarArg...) {
        let formattedMessage = prefixedMessage(String(format: message, arguments: args))
        logger.error("\(formattedMessage, privacy: .private)")
    }
}
