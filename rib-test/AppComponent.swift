//
//  AppComponent.swift
//  rib-test
//
//  Created by albin on 2020/12/30.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
