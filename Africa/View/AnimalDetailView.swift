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
    
    var articulo: String {
      let femeninos: Set<String> = ["zebra", "giraffe", "meerkat"]
      return femeninos.contains(animal.id) ? "la" : "el"
    }
  
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
            HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Postales de la vida salvaje")
            
            InsetGalleryView(animal: animal)
          }
          .padding(.horizontal)
          
          // FACTS
          Group {
            HeadingView(headingImage: "questionmark.circle", headingText: "¿Sabías que…?")
            
            InsetFactView(animal: animal)
          }
          .padding(.horizontal)
          
          // DESCRIPTION
          Group {
              HeadingView(headingImage: "info.circle", headingText: "Todo sobre el \(animal.name)")
            
            Text(animal.description)
              .multilineTextAlignment(.leading)
              .layoutPriority(1)
          }
          .padding(.horizontal)
          // MAP
          Group {
            HeadingView(headingImage: "map", headingText: "Parque Nacional")
          
            InsetMapView()
          }
          .padding(.horizontal)
          
          // LINK
          Group {
            HeadingView(headingImage: "books.vertical", headingText: "Más información")
            
            ExternalWeblinkView(animal: animal)
          }
          .padding(.horizontal)
        } //: VSTACK
        .navigationBarTitle("Todo sobre \(articulo) \(animal.name.lowercased())", displayMode: .inline)
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
