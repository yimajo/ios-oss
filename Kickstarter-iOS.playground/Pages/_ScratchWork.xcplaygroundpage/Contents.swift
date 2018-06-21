@testable import KsApi
import Library
import Prelude
import Prelude_UIKit
import UIKit
import PlaygroundSupport
@testable import Kickstarter_Framework

let controller = RewardsMapViewController.instantiate()

let frame = controller.view.frame
PlaygroundPage.current.liveView = controller
controller.view.frame = frame
