import SwiftUI

// MARK: -∆  EXTENSION OF: [( LandingView )] •••••••••

extension LandingView {
    
    // MARK: @------- [Computed some-View Properties] -------
    
    /// ™ œœœœœ[ createChallengeBtnComponent ]œœœœœœœœœœœœœœœ
    var createChallengeBtnComponent: some View {
        //∆..........
        Button(action: {
            //∆..........
            isActive = true
        }) {
            //∆..... LABEL .....
            HStack {
                
                Image(systemName: "plus.circle")
                    .font(.system(size: 24, weight: .heavy))
                
                Text("Create a challenge")
                    .font(.system(size: 22, weight: .semibold))
            }
            .frame(width: 345, height: 50)
            .animation(.linear)
            .foregroundColor(whiteOpacity)
            .modifier(SuperShadowBtnStyleModifier(bgColor: whiteOpacity))
        }
        // ∆ END OF: Buutton
        .modifier(SuperShadowBtnStyleModifier(bgColor: darkPrimaryGray))
        .padding(.bottom, 70)
    }
    /// ∆ END OF: createChallengeBtnComponent
}
// MARK: END OF: LandingView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
