import Foundation
import Kickstarter_Framework
import XCTest

internal enum Tab: CustomStringConvertible {
  case activity
  case dashboard
  case home
  case profile(loggedIn: Bool)
  case search

  var description: String {
    switch self {
    case .activity:
      return "Activity"
    case .dashboard:
      return "Dashboard"
    case .home:
      return "Explore"
    case .search:
      return "Search"
    case .profile(let loggedIn):
      return loggedIn ? "Profile" : "Log in"
    }
  }
}

extension XCUIApplication {
  func switchToTab(tab: Tab) {
    self.tabBars.buttons.element(matching: .button, identifier: tab.description).tap()
  }

  func findButton(identifier: String) -> XCUIElement? {
    return self.buttons[identifier]
  }
}
