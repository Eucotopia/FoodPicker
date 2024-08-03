//
//  Food.swift
//  FoodPicker
//
//  Created by 李伟 on 2024/8/3.
//
struct Food: Equatable {
    var name: String
    var image: String
    var calorie: Double
    var carb: Double
    var fat: Double
    var protein: Double

    static let example = [
        Food(name: "汉堡", image: "🍔", calorie: 1, carb: 14, fat: 24, protein: 17),
        Food(name: "沙拉", image: "🥗", calorie: 2, carb: 14, fat: 24, protein: 17),
        Food(name: "披萨", image: "🍕", calorie: 3, carb: 14, fat: 24, protein: 17),
        Food(name: "意大利面", image: "🍝", calorie: 4, carb: 14, fat: 24, protein: 17),
        Food(name: "刀削面", image: "🍜", calorie: 5, carb: 14, fat: 24, protein: 17),
        Food(name: "火锅", image: "🍲", calorie: 6, carb: 14, fat: 24, protein: 17),
        Food(name: "牛肉面", image: "🐮🍜", calorie: 8, carb: 14, fat: 24, protein: 17),
        Food(name: "关东煮", image: "🍢", calorie: 7, carb: 14, fat: 24, protein: 17),
    ]
}
