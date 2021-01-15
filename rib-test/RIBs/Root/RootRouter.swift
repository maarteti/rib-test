//
//  RootRouter.swift
//  rib-test
//
//  Created by albin on 2020/12/29.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, TodoListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewControllable: ViewControllable)
    func dismiss(viewControllable: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuildable: LoggedOutBuilder, todoBuildable: TodoBuilder) {
        
        self.loggedOutBuildable = loggedOutBuildable
        self.todoBuildable = todoBuildable
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToLoggedOut()
    }
    
    func routeToTodo() {
        detachCurrentChild()
        attachTodo()
    }
    
    func routeToLoggedOut() {
        detachCurrentChild()
        attachLoggedOut()
    }
    
    
    // MARK: - private
    
    private var loggedOutBuildable: LoggedOutBuilder
    private var todoBuildable: TodoBuilder
    
    private var currentChild: ViewableRouting?
    
    private func attachLoggedOut() {
        let loggedOut = loggedOutBuildable.build(withListener: interactor)
        self.currentChild = loggedOut
        attachChild(loggedOut)
        viewController.present(viewControllable: loggedOut.viewControllable)
    }

    private func attachTodo() {
        let todo = todoBuildable.build(withListener: interactor)
        self.currentChild = todo
        attachChild(todo)
        viewController.present(viewControllable: todo.viewControllable)
    }
    
    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.dismiss(viewControllable: currentChild.viewControllable)
        }
    }
    
}
