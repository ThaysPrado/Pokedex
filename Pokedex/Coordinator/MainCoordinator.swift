//
//  MainCoordinator.swift
//  Pokedex
//
//  Created by Webeleven on 16/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func toPokeInfo(name: String) {
        let vc = PokeInfoViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = PokeInfoVM(name: name)
        navigationController.pushViewController(vc, animated: true)
    }
}
