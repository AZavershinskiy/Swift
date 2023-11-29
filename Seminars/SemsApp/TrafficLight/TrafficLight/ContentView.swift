//
//  ContentView.swift
//  TrafficLight
//
//  Created by Daniil Rassadin on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var color: ObservableColor
    
    var body: some View {
        VStack {
            Text("Светофор")
                .padding()
                .font(.title)
            RectangleRow(section: color)
            Button("Change color") {
                switch color.color {
                case .red:
                    color.color = .yellow
                case .yellow:
                    color.color = .green
                case .green:
                    color.color = .red
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

enum TrafficLightColor {
    case red, yellow, green
}

final class ObservableColor: ObservableObject {
    @Published var color: TrafficLightColor = .red
}

struct RectangleRow: View {
    @ObservedObject var section = ObservableColor()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(
                    section.color == .red ? .red : .white
                )
                .border(.red)
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(
                    section.color == .yellow ? .yellow : .white
                )
                .border(.yellow)
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(
                    section.color == .green ? .green : .white
                )
                .border(.green)
        }
    }
}

//struct RoundedRectangleRow: View {
//    var body: some View {
//        VStack {
//            RoundedRectangle(cornerRadius: 10)
//                .frame(width: 50, height: 50)
//                .foregroundStyle(.red)
//            RoundedRectangle(cornerRadius: 10)
//                .frame(width: 50, height: 50)
//                .foregroundStyle(.yellow)
//            RoundedRectangle(cornerRadius: 10)
//                .frame(width: 50, height: 50)
//                .foregroundStyle(.green)
//        }
//    }
//}
//
//struct CircleRow: View {
//    var body: some View {
//        VStack {
//            Circle()
//                .frame(width: 50, height: 50)
//                .foregroundStyle(.red)
//            Circle()
//                .frame(width: 50, height: 50)
//                .foregroundStyle(.yellow)
//            Circle()
//                .frame(width: 50, height: 50)
//                .foregroundStyle(.green)
//        }
//    }
//}

#Preview {
    ContentView(color: ObservableColor())
}
