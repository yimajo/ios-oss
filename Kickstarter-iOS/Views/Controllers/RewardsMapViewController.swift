import MapKit
import Library
import UIKit

final internal class RewardsMapViewController: UIViewController {
  fileprivate let viewModel: RewardsMapViewModelType = RewardsMapViewModel()

  @IBOutlet private weak var mapView: MKMapView!

  internal static func instantiate() -> RewardsMapViewController {
    return Storyboard.RewardsMap.instantiate(RewardsMapViewController.self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewModel.inputs.viewDidLoad()
    addAnnotationsOnMap()
  }

  override func bindViewModel() {

    self.viewModel.outputs.rewards
      .observeForUI()
      .observeValues { categories in
        //self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
  }

  func addAnnotationsOnMap() {


  }
}

extension RewardsMapViewController: MKMapViewDelegate {

  func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
    let london = MKPointAnnotation()
    london.title = "London"
    london.subtitle = "England"
    london.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
    mapView.addAnnotation(london)

    let random = MKPointAnnotation()
    london.title = "London"
    london.subtitle = "England"
    london.coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    mapView.addAnnotation(random)
    mapView.showAnnotations(mapView.annotations, animated: true)
  }

  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

    let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
    annotationView.canShowCallout = true
    annotationView.image = UIImage.init(named: "activity-icon")!

    return annotationView
  }
}
