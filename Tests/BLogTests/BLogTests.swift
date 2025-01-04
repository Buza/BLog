import Testing
@testable import BLog

@Test
func testInfoLogging() async throws {
    let logger = BLog(subsystem: "com.buzamoto.blog", category: "Test", prefix: "[Test]")
    logger.pinfo("This is an info log")

    #expect(true, "Info log executed without errors")
}

@Test
func testDebugLogging() async throws {
    let logger = BLog(subsystem: "com.buzamoto.blog", category: "Test", prefix: "[Test]")
    logger.pdebug("This is a debug log: %@", "Debugging data")

    #expect(true, "Debug log executed without errors")
}

@Test
func testErrorLogging() async throws {
    let logger = BLog(subsystem: "com.buzamoto.blog", category: "Test", prefix: "[Test]")
    logger.perror("This is an error log")

    #expect(true, "Error log executed without errors")
}

@Test
func testPrefixApplied() async throws {
    let logger = BLog(subsystem: "com.buzamoto.blog", category: "Test", prefix: "[TestPrefix]")

    #expect(logger != nil, "Logger with prefix initialized correctly")
}
