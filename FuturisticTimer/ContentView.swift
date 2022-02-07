//
//  ContentView.swift
//  FuturisticTimer
//
//  Created by Martin Bjeld on 13/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let targetCount:CGFloat = 100 // seconds
    
    // Source of truth
    @State private var counter:CGFloat = 0
    @State private var show = false
    @State private var running = false
    
    var body: some View {
        ZStack {
            
            Color.black
            
            FuturisticTimer(baseColor:Color.blue, progress: counter / targetCount, show: $show, running: $running)
            
            // For testing
            HStack {
                Button("Toggle Show") {
                    self.show.toggle()
                }
                Button("Reset Counter") {
                    self.counter = 0
                }
            }
        .offset(x: 0, y: 200)
            
        }.onReceive(timer) { (output) in
            if !self.running { return }
            self.counter += 1
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
