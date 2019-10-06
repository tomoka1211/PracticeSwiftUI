//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by hirano_tomoka on 2019/10/06.
//  Copyright © 2019 hirano_tomoka. All rights reserved.
//

import SwiftUI

struct AnimationedBarView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] =  [
        [40, 100, 60, 160, 140, 80, 200],
        [20, 120, 40, 60, 80, 180, 100],
        [180, 80, 60, 60, 100, 40, 20]
    ]
    
    var body: some View {
        ZStack {
            
            Color("animationBarBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("カロリー摂取量")
                .foregroundColor(Color("title"))
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                
                HStack (spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0], day: "Su")
                    BarView(value: dataPoints[pickerSelectedItem][1], day: "M")
                    BarView(value: dataPoints[pickerSelectedItem][2], day: "T")
                    BarView(value: dataPoints[pickerSelectedItem][3], day: "W")
                    BarView(value: dataPoints[pickerSelectedItem][4], day: "TH")
                    BarView(value: dataPoints[pickerSelectedItem][5], day: "F")
                    BarView(value: dataPoints[pickerSelectedItem][6], day: "Sa")
                }.padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}

struct BarView: View {
    
    var value: CGFloat = 0
    
    var day: String = ""
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color("barBackground"))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color("bar"))
            }
            Text(day).padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationedBarView()
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
