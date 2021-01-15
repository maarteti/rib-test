//
//  RootViewController.swift
//  rib-test
//
//  Created by albin on 2020/12/29.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .yellow
    }
    
    func present(viewControllable: ViewControllable) {
        present(viewControllable.uiviewController, animated: true, completion: nil)
    }
    
    func dismiss(viewControllable: ViewControllable) {
        if presentedViewController === viewControllable.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}
