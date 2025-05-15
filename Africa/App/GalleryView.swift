//
//  GalleryView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 08/03/25.
//

import SwiftUI

struct GalleryView: View {
    //: Mark - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")

    // EFFICIENTGRID DEFINITION
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns: Int = 3
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: (gridColumns))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 30){
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    } //: Loop
                } //: GRID
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
