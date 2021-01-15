//
//  TodoViewController.swift
//  rib-test
//
//  Created by albin.p on 2021/01/15.
//

import RIBs
import RxSwift
import UIKit

protocol TodoPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TodoViewController: UIViewController, TodoPresentable, TodoViewControllable {

    weak var listener: TodoPresentableListener?
}
