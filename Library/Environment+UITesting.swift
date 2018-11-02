import KsApi
import LiveStream
import ReactiveSwift

extension Environment {
  public static var uiTesting: Environment {
    return Environment(
      apiService: UITestingEnvironment.apiService,
      apiDelayInterval: DispatchTimeInterval.milliseconds(1),
      cache: KSCache(),
      calendar: UITestingEnvironment.calendar,
      config: UITestingEnvironment.config,
      cookieStorage: MockCookieStorage(),
      countryCode: UITestingEnvironment.countryCode,
      dateType: MockDate.self,
      facebookAppDelegate: MockFacebookAppDelegate(),
      koala: Koala(client: MockTrackingClient(), loggedInUser: nil),
      liveStreamService: MockLiveStreamService(),
      locale: UITestingEnvironment.locale,
      reachability: MutableProperty(Reachability.wifi).producer,
      ubiquitousStore: MockKeyValueStore(),
      userDefaults: MockKeyValueStore()
    )
  }
}
