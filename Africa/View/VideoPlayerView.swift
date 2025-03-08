//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Sergio Luis Altuzar Morales on 10/04/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
      VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "cheetah", withExtension: "mp4")!))
    }
}

#Preview {
    VideoPlayerView()
}
