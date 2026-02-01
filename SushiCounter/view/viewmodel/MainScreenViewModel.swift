//
//  MainScreenViewModel.swift
//  SushiCounter
//
//  Created by Miguel Cocera on 1/2/26.
//

import Foundation
internal import Combine

// lc.playFromProgress = 0
// lc.playToProgress = 0.08
 
 //Ju
 //lc.playFromProgress = 0.24
 //lc.playToProgress = 0.545
 //SAD
 //lc.playFromProgress = 0.545
 //lc.playToProgress = 0.81
 
 //Heart
 //lc.playFromProgress = 0.82
 //lc.playToProgress = 0.908

final class MainScreenViewModel: ObservableObject {
    
    
    @Published var lc = LottieController()
    
}
