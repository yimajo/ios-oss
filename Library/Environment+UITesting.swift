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
      countryCode: "US",
      currentUser: nil,
      dateType: MockDate.self,
      debounceInterval: .seconds(0),
      facebookAppDelegate: MockFacebookAppDelegate(),
      koala: Koala(client: MockTrackingClient(), loggedInUser: nil),
      language: .en,
      launchedCountries: .init(),
      liveStreamService: MockLiveStreamService(),
      locale: .init(identifier: "en_US"),
      reachability: MutableProperty(Reachability.wifi).producer,
      ubiquitousStore: MockKeyValueStore(),
      userDefaults: MockKeyValueStore()
    )
  }
}
