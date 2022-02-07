//
//  AnyTransitionExtensions.swift
//  FuturisticTimer
//
//  Created by Martin Bjeld on 13/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static func scaleAndFade(delay: Double = 0) -> AnyTransition {
        
        // When "Components" are added
        let insertion = AnyTransition.scale.combined(with: .opacity)
            .animation(Animation.spring(response: 0.6, dampingFraction: 0.5).speed(1.2).delay(delay))
        
        // When "Components" are removed
        let removal = AnyTransition.scale.combined(with: .opacity)
            .animation(Animation.spring(response: 0.6, dampingFraction: 0.5).speed(1.2))
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
