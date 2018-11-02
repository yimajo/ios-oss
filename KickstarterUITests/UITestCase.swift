import XCTest
import ReactiveSwift

internal class UITestCase: XCTestCase {
  internal var app: XCUIApplication!

  override func setUp() {
    super.setUp()

    continueAfterFailure = false

    app = XCUIApplication()
    app.launchArguments.append("--uitesting")
    app.launch()
  }

  override func tearDown() {
    super.tearDown()
  }
}
