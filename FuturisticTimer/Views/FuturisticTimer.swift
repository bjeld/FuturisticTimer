//
//  FuturisticTimer.swift
//  FuturisticTimer
//
//  Created by Martin Bjeld on 13/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI

struct FuturisticTimer: View {
    
    var baseColor:Color
    var progress:CGFloat
    
    @Binding var show: Bool
    @Binding var running: Bool
    
    var body: some View {
        
        ZStack {
            
            if show {
                // Seconds Indicator
                TicksView()
                    .foregroundColor(baseColor)
                    .opacity(0.75)
                    .frame(width: 100, height: 100)
                    .transition(AnyTransition.scaleAndFade(delay: 0.1))
                    .rotationEffect(.degrees(running ? -360 : 0))
                    .animation(running ? Animation.linear(duration: 60).repeatForever(autoreverses: false) : .default)
                
                // Progress Background
                Circle()
                    .stroke(baseColor, lineWidth: 3)
                    .opacity(0.2)
                    .frame(width: 150, height: 150)
                    .transition(AnyTransition.scaleAndFade(delay: 0.2))
                
                // Progress Indicator
                Circle()
                    .trim(from: progress, to: 1)
                    .stroke(baseColor, lineWidth: 3)
                    .animation(Animation.easeInOut(duration: 0.5))
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: 150, height: 150)
                    .transition(AnyTransition.scaleAndFade(delay: 0.2))
                
                // Running inicator 1
                Circle()
                    .stroke(baseColor, lineWidth: 30)
                    .opacity(running ? 0.6 : 0.2)
                    .animation(running ? Animation.easeInOut(duration: 2).repeatForever() : .default)
                    .frame(width: 200, height: 200)
                    .transition(AnyTransition.scaleAndFade(delay: 0.3))
                
                // Running inicator 2.1
                Circle()
                    .trim(from: 0.2, to: 0.3)
                    .stroke(baseColor, lineWidth: 5)
                    .opacity(0.8)
                    .rotationEffect(.degrees(90))
                    .frame(width: 250, height: 250)
                    .transition(AnyTransition.scaleAndFade(delay: 0.4))
                    .rotation3DEffect(.degrees(running ? 360 : 0), axis: (x: 0, y: 0, z: 1))
                    .animation(running ? Animation.easeInOut(duration: 4).repeatForever(autoreverses: false) : .default)
               
                // Running inicator 2.2
                Circle()
                    .trim(from: 0.2, to: 0.3)
                    .stroke(baseColor, lineWidth: 5)
                    .opacity(0.8)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 250, height: 250)
                    .transition(AnyTransition.scaleAndFade(delay: 0.5))
                    .rotation3DEffect(.degrees(running ? 360 : 0), axis: (x: 0, y: 0, z: 1))
                    .animation(running ? Animation.easeInOut(duration: 4).repeatForever(autoreverses: false) : .default)
                
                // Play / Pause Toggle
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(baseColor)
                        .opacity(0.15)
                    
                    Image(systemName: running ? "pause.fill" : "play.fill")
                        .foregroundColor(baseColor)
                }
                .transition(AnyTransition.scaleAndFade(delay: 0.6))
                .onTapGesture {
                    self.running.toggle()
                }
                
            }
            
        }
    }
}

