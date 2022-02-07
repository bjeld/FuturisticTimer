//
//  TicksView.swift
//  FuturisticTimer
//
//  Created by Martin Bjeld on 13/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI

struct Tick: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + 10))
        return path
    }
}

struct TicksView: View {
    var body: some View {
        ZStack {
            ForEach(0..<60) { position in
                Tick()
                    .stroke(lineWidth: 1)
                    .rotationEffect(.radians(Double.pi*2 / 60*Double(position)))
            }
        }
    }
}

struct TicksView_Previews: PreviewProvider {
    static var previews: some View {
        TicksView()
    }
}
