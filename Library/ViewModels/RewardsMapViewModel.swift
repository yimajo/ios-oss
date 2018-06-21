import KsApi
import Result
import Prelude
import ReactiveSwift
import ReactiveExtensions

public protocol RewardsMapViewModelInputs {
  func viewDidLoad()
}

public protocol RewardsMapViewModelOutputs {
  var rewards: Signal<Signal<[KsApi.Category], GraphError>.Event, NoError> { get }
}

public protocol RewardsMapViewModelType {
  var inputs: RewardsMapViewModelInputs { get }
  var outputs: RewardsMapViewModelOutputs { get }
}

public final class RewardsMapViewModel: RewardsMapViewModelType,
                                        RewardsMapViewModelInputs,
                                        RewardsMapViewModelOutputs {
  public var inputs: RewardsMapViewModelInputs { return self }
  public var outputs: RewardsMapViewModelOutputs { return self }

  public init() {

    self.rewards = viewDidLoadProperty.signal
      .switchMap {
        AppEnvironment.current.apiService.fetchGraphCategories(query: rootCategoriesQuery)
          .ksr_delay(AppEnvironment.current.apiDelayInterval, on: AppEnvironment.current.scheduler)
          .map { (envelope: RootCategoriesEnvelope) in
            envelope.rootCategories
          }
          .materialize()
    }
  }

  public let rewards: Signal<Signal<[KsApi.Category], GraphError>.Event, NoError>

  fileprivate let viewDidLoadProperty = MutableProperty(())
  public func viewDidLoad() {
    self.viewDidLoadProperty.value = ()
  }
}
