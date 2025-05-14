//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Sergio Altuzar on 14/05/25.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //1. ramdom coordinate
    func ramdomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //2. ramdom size
    func ramdomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    //3. ramdom scale
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    //4. ramdom speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //5. ramdom delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: ramdomSize(), height: ramdomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: ramdomCoordinate(max: geometry.size.width),
                            y: ramdomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//: loop
            } //: Zstack
            .drawingGroup()
        } //: Geometry
    }
}

#Preview {
    MotionAnimationView()
}
