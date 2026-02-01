//
//  Lottie.swift
//  SushiCounter
//
//  Created by Miguel Cocera on 1/2/26.
//

import SwiftUI
import Lottie
internal import Combine


struct LottieView: UIViewRepresentable {
    let name: String
    var loopMode: LottieLoopMode = .loop
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var playOnAppear: Bool = true

    @ObservedObject var controller:LottieController

    func makeUIView(context: Context) -> LottieAnimationView {
        // Crea la vista de Lottie con el nombre del json
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.animationSpeed = controller.speed ?? 1

        if playOnAppear {
            animationView.play()
        }
        return animationView
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
        if let speed = controller.speed {
            uiView.animationSpeed = speed
        }

        if let seek = controller.seekProgress {
            uiView.currentProgress = seek
        }

        if let frame = controller.seekFrame {
            uiView.currentFrame = frame
        }

        if controller.stop {
            uiView.stop()
        }

        if controller.pause {
            uiView.pause()
        }

        if controller.play {
            if let from = controller.playFromProgress, let to = controller.playToProgress {
                uiView.play(fromProgress: from, toProgress: to, loopMode: loopMode, completion: nil)
            } else {
                uiView.play()
            }
        }
    }
}
