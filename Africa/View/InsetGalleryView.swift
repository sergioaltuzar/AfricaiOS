//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/03/25.
//

import SwiftUI

struct InsetGalleryView: View {
  // MARK: - PROPERTIES
  let animal: Animal
  
  // MARK: - BODY
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: 15) {
          ForEach(animal.gallery, id: \.self) { item in
            Image(item)
              .resizable()
              .scaledToFit()
              .frame(height: 200)
              .cornerRadius(12)
          } //: LOOP
        } //: HSTACK
      }//: SCROLL
    }
}
// MARK: - PREVIEW
#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json")
  InsetGalleryView(animal: animals[0])
}
