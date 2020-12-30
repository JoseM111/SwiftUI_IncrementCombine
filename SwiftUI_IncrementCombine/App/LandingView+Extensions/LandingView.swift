import SwiftUI

struct LandingView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    @State var isActive: Bool = false
    //™•••••••••••••••••••••••••••••••••••«
    let pctFromTop: CGFloat = 0.25// or 25%
    let darkPrimaryGray = Color.darkPrimaryGray.opacity(0.35)
    let whiteOpacity = Color.white.opacity(0.6)
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: -∆  body •••••••••
    var body: some View {
        
        //.............................
        NavigationView {
            
            GeometryReader { proxy in
                
                VStack(alignment: .center, spacing: nil, content: {
                    
                    ///ººº..................................•••
                    Spacer(minLength: 0) // Spaced Vertically
                        .frame(height: proxy.size.height * pctFromTop)
                    ///ººº..................................•••
                    
                    // MARK: -∆  Text(Increment) '''''''''''''''''''''
                    Text("Increment")
                        .modifier(TextShadowModifier(
                                    systemFontSize: 54,
                                    systemFontWeight: .medium,
                                    fgColor: .white, shadowColor: .black,
                                    shadow_Radius_AxisPoint: 3,
                                    shadow_X_AxisPoint: 3,
                                    shadow_Y_AxisPoint: 4.5))
                    
                    ///ººº..................................•••
                    Spacer(minLength: 0) // Spaced Vertically to fill remaining space
                    ///ººº..................................•••
                    
                    // MARK: -∆  Button(Create A Challenge) * NavigationLink '''''''''''''
                    NavigationLink(destination: CreateView(), isActive: $isActive) {
                        //∆..........
                        createChallengeBtnComponent
                        // ∆ END OF: Buutton
                    }
                    // ∆ END OF: NavigationLink

                })
                // ∆ END OF: VStack
                .modifier(VStackImageFullScreenModifier(imageName: "in-shape"))
                
                //∆ HANGER ™👕™ .................
            }
            // ∆ END OF: GeometryReader
        }
        // MARK: ||END__PARENT-NavigationView||
        .accentColor(.white)
        //.............................
    }
    // MARK: |||END OF: body|||
    
}
// MARK: END OF: LandingView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
// MARK: Helper Function
func iAmHere(myStr: String) -> some View {
    return Button(action: {  }) {
        //∆..... LABEL .....
        Text("\(myStr)")
    }
    .buttonStyle(PrimaryButtonStyle(paddingAll: 20,
                                    bgColorAlt: .netflixRed,
                                    bgColor: .netflixRed, w: 200))
    .animation(.spring())
}

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••


/// ™•••••••••••••••••••••••••••• ([ Preview ]) ••••••••••••••••••••••••••••™

// MARK: - Preview
struct LandingView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LandingView()//.padding(.all, 100)
        .preferredColorScheme(.dark)
        //.previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 360, height: 720))
        // The preview below is for like a card
        //.previewLayout(.fixed(width: 440, height: 270))
    }
}

