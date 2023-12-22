//
//  ContentView.swift
//  gestures
//
//  Created by Mariam Mchedlidze on 22.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showImage2: Bool = false
    @State private var scale2: CGFloat = 1.0
    @State private var rotationAngleImage3: Double = 0.0
    @State private var image4Offset: CGSize = .zero
    @State private var scale4: CGFloat = 1.0
    
    let gridLayout = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        LazyVGrid(columns: gridLayout) {
            
            if showImage2 {
                Image("6")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .onTapGesture {
                        withAnimation {
                            showImage2.toggle()
                        }
                    }
            } else {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .onTapGesture {
                        withAnimation {
                            showImage2.toggle()
                        }
                    }
            }
            
            Image("2")
                .resizable()
                .scaledToFit()
                .frame(width: 250 * scale2, height: 250 * scale2)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            withAnimation {
                                self.scale2 = (self.scale2 == 1.0) ? 1.5 : 1.0
                            }
                        }
                )
            
            Image("3")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(rotationAngleImage3))
                .gesture(
                    TapGesture()
                        .onEnded {
                            withAnimation {
                                rotationAngleImage3 += 45.0
                            }
                        }
                )
            
            Image("4")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .offset(image4Offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            image4Offset = value.translation
                        }
                )
            
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(width: 250 * scale4, height: 250 * scale4)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .onChanged { _ in
                            withAnimation {
                                self.scale4 = 1.5
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                self.scale4 = 1.0
                            }
                        }
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
