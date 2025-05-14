//
//  GalleryView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 08/03/25.
//

import SwiftUI

struct GalleryView: View {
    //: Mark - PROPERTIES
    
    
    // SIMPLE GRID DEFINITION
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
