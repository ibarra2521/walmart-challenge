//
//  DetailStoreViewController.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit
import MapKit

protocol DetailStoreDisplayLogic: class {
    func displayData(viewModel: DetailStoreUseCases.Fetch.ViewModel)
}

class DetailStoreViewController: UIViewController, DetailStoreDisplayLogic {
    
    // MARK: - Properties
    var interactor: DetailStoreBusinessLogic?
    var router: (NSObjectProtocol & DetailStoreRoutingLogic & DetailStoreDataPassing)?
    var store: Store?
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressValue: UILabel!
    @IBOutlet weak var workingValue: UILabel!
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = DetailStoreInteractor()
        let presenter = DetailStorePresenter()
        let router = DetailStoreRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
}

// MARK: - Extensions
extension DetailStoreViewController {
    // MARK: -
    
    func initialize() {
        store = router?.dataStore?.detail
        title = store?.name ?? String()
        addressValue.text = store?.address
        workingValue.text = store?.opens
        setUpMapView()
    }
    
    func loadData() {
        let request = DetailStoreUseCases.Fetch.Request()
        interactor?.doFetch(request: request)
    }

    // MARK: - Implemented DetailStoreDisplayLogic protocol
    func displayData(viewModel: DetailStoreUseCases.Fetch.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    func setUpMapView() {
        addPin()
    }
    
    func addPin() {
        guard let latitude = Double(store?.latPoint ?? "0.0"), let longitude = Double(store?.lonPoint ?? "0.0") else { return }
        let pinStore = Walmart(title: store?.name ?? String(), locationName: store?.name ?? String(), coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        mapView.addAnnotation(pinStore)
        mapView.centerToLocation(CLLocation(latitude: latitude, longitude: longitude))

    }
}


private extension MKMapView {
    
    func centerToLocation( _ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}


class Walmart: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let coordinate: CLLocationCoordinate2D

    init(title: String?, locationName: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.locationName = locationName
    self.coordinate = coordinate
    super.init()
  }

  var subtitle: String? {
    return locationName
  }
    
}
