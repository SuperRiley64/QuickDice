import SwiftUI
import WatchKit

struct ContentView: View {
    @State private var rollResult: Int = 1

    var body: some View {
            VStack {
                Text("🎲 \(rollResult)")
                    .font(.system(size: 25, weight: .bold))
                    .padding()

                VStack(spacing: 8) { // Reduced spacing for compact layout
                    HStack {
                        rollButton("d2", max: 2)
                        rollButton("d4", max: 4)
                    }
                    
                    HStack {
                        rollButton("d6", max: 6)
                        rollButton("d8", max: 8)
                    }

                    HStack {
                        rollButton("d10", max: 10)
                        rollButton("d12", max: 12)
                    }

                    HStack {
                        rollButton("d20", max: 20)
                        rollButton("d100", max: 100)
                    }
                }
            }
        }

    // Reusable Button Function
    func rollButton(_ label: String, max: Int) -> some View {
        Button(label) {
            rollD(max: max)
        }
        .frame(width: 100, height: 30) // Shorter and more compact
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
        .controlSize(.mini) // Ensures smaller button appearance
    }

    func rollD(max: Int) {
        rollResult = Int.random(in: 1...max)
        playHapticFeedback()
    }

    func playHapticFeedback() {
        WKInterfaceDevice.current().play(.success)
    }
}

#Preview {
    ContentView()
}
