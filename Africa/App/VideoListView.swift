//
//  VideoListView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 08/03/25.
//

import SwiftUI

// MARK: - Properties
let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

// MARK: - BODY

struct VideoListView: View {
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
    var body: some View {
      NavigationView {
        List {
          ForEach(videos) { item in
              NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                  VideoListItemView(video: item)
                      .padding(.vertical, 8)
              }
          } //: Loop
        } //:List
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("Videos", displayMode: .inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button( action: {
              videos.shuffle()
              hapticImpact.impactOccurred()
            }) {
              Image(systemName: "arrow.2.squarepath")
            }
          }
        }
      } //: Navigation
    }
}

#Preview {
    VideoListView()
}
