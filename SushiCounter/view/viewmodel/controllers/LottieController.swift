//
//  LottieController.swift
//  SushiCounter
//
//  Created by Miguel Cocera on 1/2/26.
//

import Lottie
import Foundation
internal import Combine


final class LottieController: ObservableObject {
    @Published var play: Bool = false
    @Published var pause: Bool = false
    @Published var stop: Bool = false

    @Published var playFromProgress: CGFloat? = nil
    @Published var playToProgress: CGFloat? = nil
    
    @Published var seekProgress: CGFloat? = nil
    @Published var seekFrame: AnimationFrameTime? = nil
    
    @Published var speed: CGFloat? = nil
    
    func playRange(from: CGFloat, to: CGFloat) {
        self.playFromProgress = from
        self.playToProgress = to
    }
    
    func replay() {
        self.stop = true
        self.play = true
    }
}
