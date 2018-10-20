import XCTest

class LoginSignupUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUp() {
//    continueAfterFailure = false

    app = XCUIApplication()
    app.launchArguments.append("--uitesting")

    app.launch()
  }

  func testCreateAccount() {
    app.switchToTab(tab: .profile(loggedIn: false))
    app.findButton(identifier: "Sign up with email")?.tap()

    let nameTextField = app.textFields["Name"]
    let emailTextField = app.textFields["Email address"]
    let passwordTextField = app.secureTextFields["Password"]

    nameTextField.tap()
    nameTextField.typeText("Bobba")
    emailTextField.tap()
    let randomUniqueValue = Int(Date().timeIntervalSince1970)
    emailTextField.typeText("mobile-app-test-\(randomUniqueValue)@gmail.com")
    passwordTextField.tap()
    passwordTextField.typeText("password!")

    let newsletterSwitch = app.switches["Newsletter switch"]
    newsletterSwitch.tap()

    app.buttons["Sign up"].tap()
  }

  func testLogin() {
    app.switchToTab(tab: .profile(loggedIn: false))
    app.findButton(identifier: "Log in with email")?.tap()

    app.textFields["Email address"].typeText("ifbarrera23@gmail.com")

    let passwordField = app.secureTextFields["Password"]
    passwordField.tap()
    passwordField.typeText("password")

    let loginButton = app.buttons.matching(identifier: "Log in").element(boundBy: 1)

    XCTAssertTrue(loginButton.isEnabled)

    loginButton.tap()

    if app.staticTexts["Stay up to date?"].exists {
      app.buttons["OK"].tap()

      XCTAssertTrue(app.staticTexts["“KickDebug” Would Like to Send You Notifications"].exists)

      app.buttons["Allow"].tap()
    }
    
    let profile = app.navigationBars["Profile"]
    
    XCTAssertTrue(profile.waitForExistence(timeout: 1.0), "Error logging in, Profile VC does not exist")
  }

  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
}
