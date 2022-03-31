//
//  CartView.swift
//  Shopping
//
//  Created by SeongHoKim on 2022/03/26.
//

import SwiftUI

struct CartView: View {
    // CartManager 인스턴스 초기화(EnvironmentObject)
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView {
            // 장바구니에 한개의 제품을 추가했다면?
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) {
                    product in
                    ProductRow(product: product) // 추가한 제품을 장바구니에 보여줌
                }
                HStack {
                    // 총 금액(결제금액)
                    Text("총 결제 금액은")
                    Spacer()
                    Text("\(cartManager.total)원 입니다")
                        .bold() // 글씨체 : bold
                }
                .padding() // 전체 패딩크기
                ApplePaymentButton(action: {})// Apple Pay 버튼
                    .padding() // 전체 패딩크기
            // 만약 추가한 제품이 없다면?
            } else {
                Text("현재 장바구니가 비어있습니다.") // View에 현재 장바구니가 비어있습니다 문구를 표시함
            }
        }
        .navigationTitle("나의 장바구니") // "나의 장바구니" 타이틀 Text
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager()) // CartManager 인스턴스 추가
    }
}
