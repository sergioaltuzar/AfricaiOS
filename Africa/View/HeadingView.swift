//
//  HeadingView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/03/25.
//

import SwiftUI

struct HeadingView: View {
  // MARK: - PROPERTIES
  var headingImage: String
  var headingText: String
  
  // MARK: - BODY
    var body: some View {
      HStack {
        Image(systemName: headingImage)
          .foregroundColor(.accentColor)
          .imageScale(.large)
        Text(headingText)
          .font(.title3)
          .fontWeight(.bold)
      }
      .padding(.vertical)
    }
}

#Preview {
  HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
}
