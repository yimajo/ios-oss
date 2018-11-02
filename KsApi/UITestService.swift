import Foundation

public struct UITestingEnvironment {
  public static var apiService: ServiceType = {
    return MockService(fetchUserSelfResponse: User.fullTemplate)
  }()

  public static let config: Config = Config.template

  public static var calendar: Calendar = {
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = TimeZone(identifier: "GMT")!

    return calendar
  }()
}
