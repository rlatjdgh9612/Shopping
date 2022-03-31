//
//  ApplePaymentButton.swift
//  Shopping
//
//  Created by SeongHoKim on 2022/03/27.
//

import SwiftUI
import PassKit // Apple Pay결제 관련 프레임워크

struct ApplePaymentButton: View {
    // Apple Pay 지불버튼을 눌렀을때 행위
    var action: () -> Void
    var body: some View {
        // 1) Apple Pay Button
        // Apple Pay 버튼 구조체를 가져와서 View에 표시
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400) // 프레임(최저너비 : 100, 최고너비 : 400)
            .frame(height: 40) // 프레임(높이 : 40)
            .frame(maxWidth: .infinity) // 프레임(최고너비 : 무한)
    }
}

struct ApplePaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        // action 함수에 대한 내용 미리보기
        ApplePaymentButton(action: {} )
    }
}

// ApplePay Button 확장자 -> Button Design
extension ApplePaymentButton {
    // Representable 구조체 : UIView에 나타내는 모든 로직 처리
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        //
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        //
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        //
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    // Coordinator 클래스 :
    class Coordinator : NSObject {
        var action: () -> Void
        // ApplePay 버튼유형 : 체크아웃, 버튼스타일 : 자동결제
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        // P.S 체크아웃형 ApplePay : 체크아웃 형식으로 쇼핑카트의 결제를 제공하는 형식
        
        // 버튼 액션관련 키워드 초기화
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        // call 함수(selector 지정)
        @objc func callback(_ sender: Any) {
            action()
        }
    }
}
