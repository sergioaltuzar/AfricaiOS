//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/04/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
}
