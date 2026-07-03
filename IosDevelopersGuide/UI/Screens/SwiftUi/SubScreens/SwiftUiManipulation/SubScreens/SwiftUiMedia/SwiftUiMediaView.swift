//
//  SwiftUiMedia.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI
import AVKit
import AVFoundation

struct AudioPlayerView: View {
    @State private var isPlaying = false
    private var audioPlayer: AVAudioPlayer?

    init(fileName: String, fileType: String) {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
            let fileURL = URL(fileURLWithPath: filePath)
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
                self.audioPlayer?.prepareToPlay()
            } catch {
                print("Failed to load audio file: \(error.localizedDescription)")
            }
        } else {
            print("Failed to find audio file: \(fileName).\(fileType)")
        }
    }

    var body: some View {
        VStack(alignment: HorizontalAlignment.center) {
            Button(action: {
                togglePlayPause()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .onDisappear {
            audioPlayer?.stop()
            isPlaying = false
        }
    }

    private func togglePlayPause() {
        if isPlaying {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
        isPlaying.toggle()
    }
}

struct VideoPlayerView: View {
    @State private var isPlaying = false
    private var player: AVPlayer

    init(fileName: String, fileType: String) {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
            let fileURL = URL(fileURLWithPath: filePath)
            self.player = AVPlayer(url: fileURL)
        } else {
            self.player = AVPlayer()
            print("Failed to load video file: \(fileName).\(fileType)")
        }
    }

    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 336)
                .cornerRadius(8)
                .padding()

            Button(action: {
                togglePlayPause()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .onDisappear {
            player.pause()
            isPlaying = false
        }
        
    }

    private func togglePlayPause() {
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
}

struct SwiftUiMediaView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiMediaViewModel
    
    func audio() -> some View {
        return CustomSection(
            snippetTitle: "Audio",
            snippetDescription: """
            Audio playback.
            """,
            snippetCode: """
            struct AudioPlayerView: View {
                @State private var isPlaying = false
                private var audioPlayer: AVAudioPlayer?

                init(fileName: String, fileType: String) {
                    if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
                        let fileURL = URL(fileURLWithPath: filePath)
                        do {
                            self.audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
                            self.audioPlayer?.prepareToPlay()
                        } catch {
                            print("Failed to load audio file: \\(error.localizedDescription)")
                        }
                    } else {
                        print("Failed to find audio file: \\(fileName).\\(fileType)")
                    }
                }

                var body: some View {
                    VStack(alignment: HorizontalAlignment.center) {
                        Button(action: {
                            togglePlayPause()
                        }) {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                    }
                    .onDisappear {
                        audioPlayer?.stop()
                        isPlaying = false
                    }
                }

                private func togglePlayPause() {
                    if isPlaying {
                        audioPlayer?.pause()
                    } else {
                        audioPlayer?.play()
                    }
                    isPlaying.toggle()
                }
            }
            
            AudioPlayerView(fileName: "sample_audio", fileType: "mp3")
            """,
            demoView: {
                AudioPlayerView(fileName: "sample_audio", fileType: "mp3")
            }
        )
    }
    
    func video() -> some View {
        return CustomSection(
            snippetTitle: "Video",
            snippetDescription: """
            Video playback
            """,
            snippetCode: """
            struct VideoPlayerView: View {
                @State private var isPlaying = false
                private var player: AVPlayer

                init(fileName: String, fileType: String) {
                    if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
                        let fileURL = URL(fileURLWithPath: filePath)
                        self.player = AVPlayer(url: fileURL)
                    } else {
                        self.player = AVPlayer()
                        print("Failed to load video file: \\(fileName).\\(fileType)")
                    }
                }

                var body: some View {
                    VStack {
                        VideoPlayer(player: player)
                            .frame(height: 336)
                            .cornerRadius(8)
                            .padding()

                        Button(action: {
                            togglePlayPause()
                        }) {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                    }
                    .onDisappear {
                        player.pause()
                        isPlaying = false
                    }
                }

                private func togglePlayPause() {
                    if isPlaying {
                        player.pause()
                    } else {
                        player.play()
                    }
                    isPlaying.toggle()
                }
            }

            VideoPlayerView(fileName: "sample_video", fileType: "mp4")
            """,
            demoView: {
                VideoPlayerView(fileName: "sample_video", fileType: "mp4")
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Media",
            content: {
                audio()
                video()
            }
        )
    }
}

//#Preview {
//    SwiftUiMediaView()
//}
