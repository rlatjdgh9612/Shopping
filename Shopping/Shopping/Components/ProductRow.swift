//
//  ProductRow.swift
//  Shopping
//
//  Created by SeongHoKim on 2022/03/27.
//

import SwiftUI

struct ProductRow: View {
    // CartManager 인스턴스 초기화
    @EnvironmentObject var cartManager: CartManager
    var product: Product // Product 구조체 인스턴스 초기화
    
    var body: some View {
        // HStack spacing 간격 : 20
        HStack(spacing: 20) {
            // 1) 장바구니에 추가한 제품 이미지
            Image(product.image)
                .resizable() // 크기 조정
                .aspectRatio(contentMode: .fit) // 화면비율 : fit
                .frame(width: 50) // 너비 : 50
                .cornerRadius(10) // 모서리 반경
            // VStack
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name) // 3번째 배열의 제품 이름(Text)
                    .bold() // 글씨체 : bold
                Text("\(product.price)원") // 3번째 배열의 제품 가격(Text)
            }
            // 제품 이미지, Text 간격
            Spacer()
            // 2) 장바구니 휴지통 UI 이미지 버튼
            Image(systemName: "trash") // trash 이미지 아이콘
                .foregroundColor(.red) // 아이콘 색깔 : 빨간색
            // 제스처
                .onTapGesture {
                // 휴지통 아이콘을 누르면 해당 아이템이 removeFromCart 함수내 있는 코드가 작동하여 해당 제품을 삭제시킨다
                cartManager.removeFromCart(product: product)
            }
        }
        .padding(.horizontal) // 전체 크기 : 수평(가로)
        .frame(maxWidth: .infinity, alignment: .leading) // 프레임
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[3]) // 3번째 배열의 제품을 초기화
        // environmentObject에 인스턴스로 초기화한 CartManager를 생성
            .environmentObject(CartManager())
    }
}
