//
//  MainScreen.swift
//  SushiCounter
//
//  Created by Miguel Cocera on 1/2/26.
//

import SwiftUI
import Lottie

struct MainScreen: View {
    @State var generator = UIImpactFeedbackGenerator(style: .heavy)
    @State var count = 0
    @AppStorage("bestScore") var bestScore = 0
    
    //0 -> auto
    //1 -> light
    //2 -> night
    @AppStorage("uiMode") var uiMode: Int = 0
    
    
    @Environment(\.colorScheme) private var colorScheme
    @StateObject var vm = MainScreenViewModel()
    
    var body: some View{
        VStack {
            
            ZStack {
                VStack{
                    VStack{
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack{
                        Text(String(count)).font(.system(size: 100, weight: Font.Weight.bold))
                        Text("Tap to eat")
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("surfaceVariant"))
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                LottieView(name: "sushiNigiri", loopMode: .playOnce, controller: vm.lc).scaleEffect(0.2).frame(width: 300, height: 200).onAppear{
                    vm.lc.stop = true
                }.padding(.bottom, 100)
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).contentShape(Rectangle()).onTapGesture {
                generator.impactOccurred()
                vm.lc.replay()
                count += 1
                if (count > bestScore){
                    bestScore = count
                }
            }.onAppear{
                generator.prepare()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).toolbar{
            ToolbarItem(placement: .topBarLeading){
                Menu {
                    Button("Reset sushi count", systemImage: "arrow.trianglehead.clockwise") {
                        generator.impactOccurred()
                        count = 0
                    }
                    
                    switch uiMode {
                    case 0:
                        Button("Change UI Mode", systemImage: "character") {
                            generator.impactOccurred()
                            if colorScheme == .dark {
                                uiMode = 1
                            } else {
                                uiMode = 2
                            }
                        }
                    case 1:
                        Button("Change UI Mode", systemImage: "sun.max.fill") {
                            generator.impactOccurred()
                            uiMode += 1
                        }
                    case 2:
                        Button("Change UI Mode", systemImage: "moon.stars.fill") {
                            generator.impactOccurred()
                            uiMode -= 1
                        }
                    default:
                        Button("Change UI Mode", systemImage: "character") {}
                    }
                    
                    
                    Button("Erase Best Score", systemImage: "trash.fill") {
                        generator.impactOccurred()
                        bestScore = 0
                    }
                    Button("Best Score: \(bestScore)", systemImage: "info") {}.disabled(true)
                    
                } label: {
                    
                    Image(systemName: "gear").imageScale(.large)
                    
                }
            }
            
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    generator.impactOccurred()
                    if count > 0 { count -= 1 }
                } label: {
                    Image(systemName: "arrow.uturn.left")
                }
            }
        }.preferredColorScheme(uiMode == 1 ? .light :
                               uiMode == 2 ? .dark  :
                                nil )
    }
}



#Preview {
    NavigationStack{
        MainScreen()
    }
}
