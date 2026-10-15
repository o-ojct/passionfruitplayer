import SwiftUI
import AVFoundation

final class SongPlayer: ObservableObject {
    private var player: AVAudioPlayer?
    @Published var isPlaying = false

    init() {
        guard let url = Bundle.main.url(forResource: "Passionfruit", withExtension: "mp3") else { return }
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }

    func toggle() {
        guard let player = player else { return }
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
}

struct ContentView: View {
    @StateObject private var song = SongPlayer()

    var body: some View {
        VStack(spacing: 24) {
            Text("Passionfruit").font(.largeTitle.bold())
            Button(action: { song.toggle() }) {
                Label(song.isPlaying ? "Pause" : "Play",
                      systemImage: song.isPlaying ? "pause.fill" : "play.fill")
                    .font(.title2.bold())
                    .padding(.horizontal, 40)
                    .padding(.vertical, 16)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
    }
}

@main
struct PassionfruitPlayerApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}
