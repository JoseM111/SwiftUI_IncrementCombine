import SwiftUI

import SwiftUI

struct VStackImageFullScreenModifier: ViewModifier {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    let imageName: String
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: - ™CONFORMS TO PROTOCOL™
    func body(content: Content) -> some View {
        //∆..........
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 4)
            .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 4)
            .shadow(color: Color.black.opacity(0.6), radius: 2, x: 2, y: 4)
            .background(
                //∆..........
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .edgesIgnoringSafeArea(.all)
    }
}
// MARK: END OF: VStackImageFullScreenModifier

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

struct SuperShadowBtnStyleModifier: ViewModifier {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    var bgColor: Color = .clear
    
    ///™«««««««««««««««««««««««««««««««««««
    // MARK: - ™CONFORMS TO PROTOCOL™
    func body(content: Content) -> some View {
        //∆..........
        content
            .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
            .shadow(color: Color.black.opacity(0.4), radius: 2, x: 2, y: 2)
            .shadow(color: Color.black.opacity(0.8), radius: 2, x: 2, y: 3)
            .buttonStyle(PrimaryButtonStyle(
                            paddingAll: 12, bgColorAlt: .clear,
                            bgColor: bgColor, w: 280, h: 80)
            )
    }
}
// MARK: END OF: SuperShadowBtnStyleModifier

