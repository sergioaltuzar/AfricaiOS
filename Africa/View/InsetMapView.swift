//
//  InsetMapView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/03/25.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - PROPERTIES
  @State private var region = MapCameraPosition.region(
    MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437599),
      span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
    )
  )
  
  // MARK: - BODY8
  
  var body: some View {
    Map(position: $region)
      .overlay(
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            Text("Locations")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
            
          } //: HSTACK
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
        } //: Navigation
          .padding(12)
          , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

#Preview {
    InsetMapView()
}
