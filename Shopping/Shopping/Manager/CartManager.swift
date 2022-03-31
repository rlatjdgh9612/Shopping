//
//  CartManager.swift
//  Shopping
//
//  Created by SeongHoKim on 2022/03/26.
//

import Foundation

// CartManager : 장바구니에 추가한 제품, 제품의 가격, 총 결제건과 관련된 모든 Object들을 관리하는 매니저
class CartManager: ObservableObject {
    // CartManager 클래스내에서만 제품과 관련된 키워드에 접근을 허용할수 있음
    // 상품 정보
    @Published private(set) var products: [Product] = [] // 맨 처음 상품은 비어있는 상태가 된다
    @Published private(set) var total: Int = 0 // 맨 처음 총 가격은 0원으로 시작
    
    // 카트에 추가한 상품정보
    func addToCart(product: Product) {
        products.append(product) // 추가한 제품의 내용을 보여줌
        total += product.price // 장바구니에 담긴 상품의 총 합친 가격을 보여줌
    }
    
    // 카트에 삭제한 상품정보
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id } // 전달한 제품과 같지 않은 제품을 필터링해서 삭제함
        total -= product.price // 장바구니에 담긴 상품의 뺀 가격을 보여줌
    }
}
