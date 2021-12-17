//
//  ContentView.swift
//  Memorize
//
//  Created by dengweidong on 2021/12/16.
//

import SwiftUI

// ZStack VStack HStack: ViewBuilders

struct ContentView: View { // behaves like a View
    // 声明数组 三种类型表示
    var emojis = ["🛴","🚆","✈️","🚃","🚝","🚂","🚒","🏎","🚨","💺","🛰","🚀","🚁","⛵️","⚓️"]
//    var emojis1: Array<String> = ["🛴","🚆","✈️","🚃"]
//    var emojis2: [String] = ["🛴","🚆","✈️","🚃"]
    
    @State var emojiCount: Int = 6
    
    var body: some View {
        VStack {
            ScrollView {
                // 指定columns 将横向占满 纵向尽量小
                // 使用GridItems数组 能对每个元素做更多设置
                // [GridItem(),GridItem(),GridItem()] 每行三个元素
                // GridItem(.adaptive(minimum: 65)) 自适应
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]) {
                    // Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable'
                    // ？struct的唯一标识符id
                    // ForEach需要区分数组的每一个元素
                    // This array has to contain things that are identifiable
                    // Strings do not behave like an identifiable
                    // [i..<j] [i...j] 表示数组范围
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content:emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                    /*
                     // 创建时带()
                     // Missing argument for parameter 'isFaceUp' in call
                     // 如果在struct中不为变量赋值 在创建时必须指定值
                     CardView(content: "🛴")
                     CardView(content: "🚆")
                     CardView(content: "✈️")
                     CardView(content: "🚃")
                     */
                }
            }
            .foregroundColor(.red)
            Spacer() // 取所有的空白区域
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    // 把按钮抽出成变量
    var remove:some View {
        Button(action: {
            if (emojiCount > 1) {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    // 两个函数作为参数 简化写法 第一个参数名省略 括号和逗号省略
    var add:some View {
        Button {
            if (emojiCount < emojis.count) {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle") // 使用系统图标
        }
    }
}

// View都是不可变的(immutable) 当发生变化时 view is re-built
struct CardView: View {
    var content: String
    // cannot have variables that have no value
    // Cannot assign to property: 'self' is immutable
    // @State 将变量变成一个指针,它本身不变,它指向的值可以改变
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            // var和let的区别
            // 可省略类型 automatically refer
            let shape = RoundedRectangle(cornerRadius: 20) // 被认为是常量 不可变
            if isFaceUp {
                // 两个圆角矩形重叠 实现填充色和边框
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)  // stroke strokeBorder
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



















// 将ContentView连接到Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
