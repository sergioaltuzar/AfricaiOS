//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/03/25.
//

import SwiftUI

struct AnimalDetailView: View {
  // MARK: - PROPERTIES
  let animal: Animal
  
  // MARK: - BODY
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          // HERO IMAGE
          Image(animal.image)
            .resizable()
            .scaledToFit()
          
          // TITLE
          Text(animal.name.uppercased())
            .font(.largeTitle)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .padding(.vertical, 8)
            .foregroundColor(.primary)
            .background(
              Color.accentColor
                .frame(height: 6)
                .offset(y: 24)
            )
          
          // HEADLINE
          Text(animal.headline)
            .font(.headline)
            .multilineTextAlignment(.leading)
            .foregroundColor(.accentColor)
            .padding(.horizontal)
          
          // GALLERY
          Group {
            HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            
            InsetGalleryView(animal: animal)
          }
          .padding(.horizontal)
          
          // FACTS
          Group {
            HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
            
            InsetFactView(animal: animal)
          }
          .padding(.horizontal)
          
          // DESCRIPTION
          Group {
            HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
            
            Text(animal.description)
              .multilineTextAlignment(.leading)
              .layoutPriority(1)
          }
          .padding(.horizontal)
          // MAP
          Group {
            HeadingView(headingImage: "map", headingText: "National Park")
          
            InsetMapView()
          }
          .padding(.horizontal)
          
          // LINK
          Group {
            HeadingView(headingImage: "books.vertical", headingText: "Learn More")
            
            ExternalWeblinkView(animal: animal)
          }
          .padding(.horizontal)
        } //: VSTACK
        .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
      } //: SCROLL
        
    }
}


// MARK: - PREVIEW
#Preview {
  
  let animal: [Animal] = Bundle.main.decode("animals.json")
  NavigationView {
    AnimalDetailView(animal: animal[0])
  }
}
