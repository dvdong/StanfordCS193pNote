//
//  ContentView.swift
//  Memorize
//
//  Created by dengweidong on 2021/12/16.
//

// Assignment1

import SwiftUI

struct ContentView: View { // behaves like a View
    
    let vehicles:[String] = ["🛴","🚆","✈️","🚃","🚝","🚂","🚒","🏎","🚨","💺","🛰","🚀"]
    let animals:[String] = ["🐶","🐰","🐷","🐵","🐸","🐼","🦉","🐴","🐢","🐞"]
    let flags:[String] = ["🏳️","🏴‍☠️","🏳️‍🌈","🇺🇳","🇦🇷","🇴🇲","🇦🇹","🇦🇺","🇦🇴","🇧🇸","🇧🇯","🇲🇰"]
    
    @State var contents:[String] = []
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(contents[0..<contents.count], id:\.self) { content in
                        CardView(content: content).aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }.padding(.horizontal)
            HStack {
                vehicleBtn
                Spacer()
                animalBtn
                Spacer()
                flagBtn
            }.padding(.horizontal, 50)
        }
    }
    
    // 3个按钮
    var vehicleBtn: some View {
        Button {
            self.contents = self.vehicles
            self.contents.shuffle()
        } label: {
            VStack {
//                Image(systemName: "car").resizable().frame(width: 35, height: 30)
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles").font(.system(size: 12))
            }
        }
    }
    
    var animalBtn: some View {
        Button {
            self.contents = self.animals
            self.contents.shuffle()
        } label: {
            VStack {
                Image(systemName: "pawprint").resizable().frame(width: 35, height: 30)
                Text("Animals").font(.system(size: 12))
            }
        }
    }
    
    var flagBtn: some View {
        Button {
            self.contents = self.flags
            self.contents.shuffle()
        } label: {
            VStack {
                Image(systemName: "flag").resizable().frame(width: 35, height: 30)
                Text("Flags").font(.system(size: 12))
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUP: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUP = !isFaceUP
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
