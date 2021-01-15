//
//  LoggedOutViewController.swift
//  rib-test
//
//  Created by albin on 2020/12/30.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
import RxCocoa

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login()
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .green
        
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("TODO로 이동하기", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(150)
            maker.center.equalToSuperview()
        }
        
        button.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.listener?.login()
            })
            .disposed(by: disposeBag)
    }
}
