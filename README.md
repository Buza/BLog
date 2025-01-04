# BLog - A Simple Swift Logging Utility

`BLog` is a lightweight Swift logging utility that wraps the iOS `os.log` framework. It simplifies logging with customizable prefixes and supports various log levels: debug, info, warning, and error.

## Features

- Easy-to-use API for logging messages.
- Supports log levels: `debug`, `info`, and `error`.
- Customizable prefixes for organized log output.
- Secure logging with privacy options.

## Installation

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "<repository-url>", from: "1.0.0")
]
```

## Usage

### Initialize a Logger

Create an instance of `BLog` by providing a subsystem, category, and prefix:

```swift
import BLog

let logger = BLog(subsystem: "com.yourapp.module", category: "General", prefix: "[MyApp]")
```

### Log Messages

Use the provided methods to log messages at different levels:

#### Info
```swift
logger.pinfo("App started successfully.")
```

#### Debug
```swift
logger.pdebug("User tapped on button: %@", "Submit")
```

#### Error
```swift
logger.perror("Failed to load data: %@", error.localizedDescription)
```

### Wrapping BLog in Your App

You can wrap `BLog` in a custom logger to standardize logging across your app. Here's an example:

```swift
struct AppLogger {
    static let shared = BLog(subsystem: "com.example.app", category: "General", prefix: "<AppLogger>")

    static func log(_ message: String, level: LogLevel = .info) {
        switch level {
        case .info:
            shared.pinfo(message)
        case .warning, .error:
            shared.perror(message)
        case .debug:
            shared.pdebug(message)
        }
    }
}

// Usage
AppLogger.log("User logged in successfully.", level: .info)
AppLogger.log("Invalid user credentials.", level: .error)
```

## API

### `BLog`

- **`init(subsystem: String, category: String, prefix: String)`**:
  Initializes a new logger with the specified subsystem, category, and prefix.

- **`pinfo(_ message: String, _ args: CVarArg...)`**:
  Logs informational messages.

- **`pdebug(_ message: String, _ args: CVarArg...)`**:
  Logs debug messages.

- **`perror(_ message: String, _ args: CVarArg...)`**:
  Logs error messages.

## License

This project is licensed under the MIT License.

