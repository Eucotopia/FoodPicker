import SwiftUI

struct ContentView: View {

    let food = Food.example
    // @State 使得界面可以同步变量状态的变化（类似 react 中的状态绑定）
    @State private var selectedFood: Food?

    @State private var showCalorie: Bool = false // 控制热量信息显示的状态

    @State private var selectedImage: String?

    // 这里是一个不透明的类型，对于用户来说并不需要确定它的具体类型，但是 Swift 在编译时是可以自动推断的
    var body: some View {
        // vertical stack 垂直配列
        VStack(spacing: 30) {
            Group {
                if selectedFood?.image == nil {
                    Image("dinner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                } else {
                    Text(selectedFood?.image ?? "")
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }
            }.frame(height: 250)

            Text("What do you want to eat?")
                .bold()

            if let selectedFood = selectedFood {
                HStack {
                    Text(selectedFood.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.green)
                    // 表示字体
                    Button {
                        // 切换 showCalorie 状态
                        showCalorie.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }.buttonStyle(.plain) // 仅显示图标，不显示按钮样式
                }
                Text("热量 \(selectedFood.calorie.formatted()) 大卡")
                if showCalorie {

                    Grid(horizontalSpacing: 40, verticalSpacing: 12){
                        GridRow{
                            Text("蛋白质")
                            Text("脂肪")
                            Text("碳水")
                        }.frame(minWidth: 60)

                        Divider()
                            .gridCellUnsizedAxes(.horizontal)

                        GridRow{
                            Text(selectedFood.protein.formatted() + "g")
                            Text(selectedFood.fat.formatted() + "g")
                            Text(selectedFood.carb.formatted() + "g")
                        }
                    }
                }


            }

            Spacer()
            Button {
                selectedFood = food.shuffled().first { $0 != selectedFood }
                showCalorie = false // 切换食物时隐藏热量信息
            } label: {
                Text(selectedFood != nil ? "Change one" : "Tell me")
                    .frame(width: 200)
                    .transformEffect(.identity)
            }
            .padding(.bottom, -15)

            Button {
                selectedFood = nil
                showCalorie = false // 重置时隐藏热量信息
            } label: {
                Text("Reset")
                    .frame(width: 200)
            }
            .buttonStyle(.bordered)
        }
        .font(.title)
        .padding()
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut, value: selectedFood)
        .animation(.spring(dampingFraction: 0.55), value: showCalorie) // 添加动画效果
    }
}

#Preview {
    ContentView()
}
