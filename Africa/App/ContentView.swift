//
//  ContentView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 08/03/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        //toolbar
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
      // MARK: - BODY
      NavigationView {
          Group {
              if !isGridViewActive {
                  List {
                      CoverImageView()
                          .frame(height: 300)
                          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                      
                      ForEach(animals) { animal in
                          NavigationLink(destination: AnimalDetailView(animal: animal)) {
                              AnimalListItemView(animal: animal)
                          } //: LINK
                      } //: LOPP
                  } //: list
              } else {
                  ScrollView(.vertical, showsIndicators: false) {
                      LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                          ForEach(animals) { animal in
                              NavigationLink(destination: AnimalDetailView(animal: animal)){
                                  AnimalGridItemView(animal: animal)
                              } //: link
                          } //: loop
                      } //: grid
                      .padding(10)
                      .animation(.easeIn)
                  } //: scroll
              } //: conditional
          } //: Group
        .navigationTitle("Africa")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 16){
                    //List
                    Button(action: {
                        print("List View is activated")
                        isGridViewActive = false
                        haptic.impactOccurred()
                    }) {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                    } //: Image
                    // GRid
                    Button(action: {
                        print("Grid View is activated")
                        isGridViewActive = true
                        haptic.impactOccurred()
                        gridSwitch()
                    }) {
                        Image(systemName: toolbarIcon)
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
                    } //: Image
                } //: Hstack
            } //: buttons
        } //: toolbar
      } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
