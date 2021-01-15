//
//  TodoBuilder.swift
//  rib-test
//
//  Created by albin.p on 2021/01/15.
//

import RIBs

protocol TodoDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TodoComponent: Component<TodoDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TodoBuildable: Buildable {
    func build(withListener listener: TodoListener) -> TodoRouting
}

final class TodoBuilder: Builder<TodoDependency>, TodoBuildable {

    override init(dependency: TodoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TodoListener) -> TodoRouting {
        let component = TodoComponent(dependency: dependency)
        let viewController = TodoViewController()
        let interactor = TodoInteractor(presenter: viewController)
        interactor.listener = listener
        return TodoRouter(interactor: interactor, viewController: viewController)
    }
}
