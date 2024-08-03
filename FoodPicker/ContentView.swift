//
//  ContentView.swift
//  FoodPicker
//
//  Created by 李伟 on 2024/8/3.
//

import SwiftUI


struct ContentView: View {
    var food = ["汉堡","沙拉","披萨","意大利面","刀削面","火锅"]
    // @State 使得界面可以同步变量状态的变化（类似 react 中的状态绑定）
    @State private var selectedFood: String?

    // 这里是一个不透明的类型，对于用户来说并不需要确定它的具体类型，但是 Swfit 在 compile 是是可以自动推断的
    var body: some View {
        // vertical tack 垂直配列
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("want to eat what")
                .bold()

            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.green)


            }


            Button(role: .none){
                selectedFood =  food.shuffled().filter {$0 != selectedFood }.first
            }label: {
                Text((selectedFood != nil) ? "change one" : "tell me")
                    .frame(width: 200)
                    .transformEffect(.identity)
            }
                .padding(.bottom,-15)



            // role: .destructive:表示危险动作
            Button(role: .none){
                selectedFood = .none
            }label: {
                Text("reset").frame(width: 200)
            }
            .buttonStyle(.bordered)

        }
        .font(.title)
        .padding()
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut,value: selectedFood)
    }
}

#Preview {
    ContentView()
}
