//
//  RootRouter.swift
//  rib-test
//
//  Created by albin on 2020/12/29.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewControllable: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuildable: LoggedOutBuilder) {
        
        self.loggedOutBuildable = loggedOutBuildable
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        self.attachLoggedOut()
    }
    
    
    // MARK: - private
    
    private var loggedOutBuildable: LoggedOutBuilder
    
    private var loggedOut: ViewableRouting?
    
    private func attachLoggedOut() {
        let loggedOut = loggedOutBuildable.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewControllable: loggedOut.viewControllable)
    }
    
}
