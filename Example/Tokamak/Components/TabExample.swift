//
//  TabExample.swift
//  TokamakDemo-iOS
//
//  Created by Matvii Hodovaniuk on 3/13/19.
//  Copyright © 2019 Tokamak contributors. Tokamak is available under the Apache 2.0
//  license. See the LICENSE file for more info.
//

import Tokamak

import Tokamak

class TabBarDelegate: NSObject, UITabBarControllerDelegate {
//  var view: UIView?

//  func tabBarController(_ tabBarController: UITabBarController,
//                        didSelect viewController: UIViewController) {
//    print("H")
//    tabBarController.selectedIndex = 1
//  }

//  var onTabChange: ((Int) -> ())?
//
//  init(_ onTabChange: ((Int) -> ())?) {
//    onTabChange = onTabChange?.value
//  }
}

struct TabExample: LeafComponent {
  typealias Props = Null

  static func render(props: Props, hooks: Hooks) -> AnyNode {
    let refTabBar = hooks.ref(type: UITabBarController.self)
    let delegate = hooks.ref(TabBarDelegate())
    let style = Style(Center.equal(to: .parent))
    let selectedIndex = hooks.state(3)

    hooks.effect {
      guard let tabBar = refTabBar.value else { return }

      tabBar.delegate = delegate.value
    }

    return TabController.node(
      .init(isAnimated: true, selectedIndex: selectedIndex),
      [
        TabItem.node(.init(title: "First"), Label.node(.init(style, text: "First"))),
        TabItem.node(.init(title: "Second"), Label.node(.init(style, text: "Second"))),
      ],
      ref: refTabBar
//            [
//              Label.node(.init(style, text: "First")),
//              Label.node(.init(style, text: "Second")),
//            ]
    )
  }
}