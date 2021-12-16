//
//  ContentView.swift
//  Memorize
//
//  Created by dengweidong on 2021/12/16.
//

import SwiftUI

/*
 struct 结构体 可以存在变量和函数
 Swift支持面向对象编程和函数式编程
 
 in functional programming, how things behave is crucial, the behaviors are the functions that can call on it 不描述数据的实际存储方式
 
 function is everywhere
 */
struct ContentView: View { // behaves like a View
    // :View 必须实现这个变量
    // :some View 变量的类型
    // 编译时 把some View替换为实际类型（Text）
    // 变量body不实际存在于内存中，它是一个被函数计算出来的变量
    var body: some View { // 大括号 一个没有名字没有参数的函数
/*
        // padding: a function exists in all structs behaving like a view
        //          return a padded, modified other view(not Text)
        // foregroundColor: 同padding
        // 此时存在3个View (1)原来的Text （2)修改颜色后的View (3)修改padding后的View
        Text("Hello, world!").foregroundColor(Color.pink).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // 返回这个Text return被隐藏了; Text也是一个struct; 返回类型匹配some View
*/
        // RoundedRectangle是一个shape
//        return RoundedRectangle(cornerRadius: 25)
//            .stroke()
//            .foregroundColor(.cyan)
//            .padding(.all)
        ZStack(alignment:.center, content:{
            Text("Hello, world!").foregroundColor(Color.pink).padding(.all)
            RoundedRectangle(cornerRadius: 25)
                        .stroke()
                        .foregroundColor(.cyan)
                        .padding(.all)
        })
        
        // 当最后一个参数是函数时 可以省略书写 写在参数括号外
        ZStack(alignment:.center) {
            Text("Hello, world!").foregroundColor(Color.pink).padding(.all)
            RoundedRectangle(cornerRadius: 25)
                        .stroke()
                        .foregroundColor(.cyan)
                        .padding(.all)
        }
    }

}



















// 将ContentView连接到Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
