//
//  Product.swift
//  Shopping
//
//  Created by SeongHoKim on 2022/03/26.
//

import Foundation

// 제품(스웨터) 구조체
struct Product: Identifiable {
    // 제품 정보(information) : Asset 참조
    var id = UUID() // 범용 고유 식별자(UUID)
    var name: String // 제품 이름
    var image: String // 제품 이미지
    var price: Int // 제품 가격
}

// 제품(스웨터) 리스트
// P.S 제품 리스트는 Array의 영향을 받아 0부터 7까지 제품 리스트를 표현할수 있도록 구현함
var productList = [Product(name: "김밥", image: "김밥", price: 1500),
                   Product(name: "떡볶이", image: "떡볶이", price: 3500),
                   Product(name: "비빔밥", image: "비빔밥", price: 5500),
                   Product(name: "삼겹살", image: "삼겹살", price: 12000),
                   Product(name: "김치", image: "김치", price: 3000),
                   Product(name: "짜장면", image: "짜장면", price: 4500),
                   Product(name: "팥빙수", image: "팥빙수", price: 6000),
                   Product(name: "라볶이", image: "라볶이", price: 5000)
]
