//
//  ProductCard.swift
//  Shopping
//
//  Created by SeongHoKim on 2022/03/26.
//

import SwiftUI

struct ProductCard: View {
    // CartManager 인스턴스 초기화(EnvironmentObject)
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        // ZStack alignment 위치 : 위쪽의 오른쪽 -> (장바구니 추가버튼 위치)
        ZStack(alignment: .topTrailing) {
            // ZStack alignment 위치 : 아래쪽
            ZStack(alignment: .bottom) {
                // 1.제품 정보 UI
                Image(product.image)
                    .resizable() // 이미지 크기
                    .cornerRadius(20) // 이미지 모서리반경 : 20
                    .frame(width: 180) // 이미지 너비 : 180
                    .scaledToFit()
                // VStack alignment 위치 : 왼쪽
                VStack(alignment: .leading) {
                    Text(product.name) // 제품이름(Text)
                        .bold()
                    Text("\(product.price) 원") // 제품가격(price)
                        .font(.caption)
                }
                // 2.제품 가격표 UI
                .padding() // 전체 패딩크기
                .frame(width: 180, alignment: .leading) // 이미지 너비 : 180, 이미지 위치 : 왼쪽
                .background(.ultraThinMaterial) // 배경화면(불투명도)
                .cornerRadius(20) // 이미지 모서리 반경 : 20
            }
            .frame(width: 180, height: 240) // 이미지 프레임(너비 180, 높이 240)
            .shadow(radius: 5) // 그림자 반경 : 5
            // 3.장바구니 추가버튼 UI
            Button {
                cartManager.addToCart(product: product)
            } label: {
                // 장바구니 추가버튼 이미지 레이블
                Image(systemName: "plus")
                    .padding(10) // 추가버튼 패딩크기 : 10
                    .foregroundColor(.white) // +버튼 전경색
                    .background(.black) // +버튼 배경색
                    .cornerRadius(50) // 이미지 모서리 반경 : 50
                    .padding() // 전체 패딩크기
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        // 제품 리스트
        ProductCard(product: productList[0])
            .environmentObject(CartManager()) // CartManager 인스턴스 추가
    }
}
