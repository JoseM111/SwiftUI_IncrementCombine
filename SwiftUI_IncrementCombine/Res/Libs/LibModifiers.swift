import SwiftUI


// MARK: -∆  [ Custom PrimaryButtonStyle ] •••••••••
///∆ ...........
///  • How to call it:
/// /// ∆ END OF: Button
/// .buttonStyle(
///     PrimaryButtonStyle(paddingAll: 10, bgColorAlt: .black,
///                        bgColor: .twitterBlue, w: 150, h: 40)
/// )
///  ............
struct PrimaryButtonStyle: ButtonStyle {
    
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    var paddingAll: CGFloat = 10
    var bgColorAlt: Color = .netflixRed
    var bgColor: Color = .twitterBlue
    var w: CGFloat = 80
    var h: CGFloat = 40
    ///™«««««««««««««««««««««««««««««««««««
    
    func makeBody(configuration: PrimaryButtonStyle.Configuration) -> some View {
        //∆..........
        MyButton(configuration: configuration, paddingAll: paddingAll,
                 bgColorAlt: bgColorAlt, bgColor: bgColor, w: w, h: h)
    }
    ///∆.....................................................
    
    // MARK: -∆  Child Struct •••••••••
    struct MyButton: View {
        // MARK: - ™PROPERTIES™
        ///™«««««««««««««««««««««««««««««««««««
        let configuration: PrimaryButtonStyle.Configuration
        let paddingAll: CGFloat
        let bgColorAlt: Color
        let bgColor: Color
        let w: CGFloat
        let h: CGFloat
        ///™«««««««««««««««««««««««««««««««««««
        
        var body: some View {
            
            return configuration.label
                .foregroundColor(Color(UIColor.systemBackground))
                .padding(paddingAll)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(configuration.isPressed ? bgColorAlt : bgColor))
                .frame(width: configuration.isPressed ? w + 10 : w, height: h)
                .compositingGroup()
                .shadow(color: configuration.isPressed ? bgColorAlt : .clear, radius: 6)
                .shadow(color: configuration.isPressed ? bgColorAlt : .clear, radius: 7)
                .shadow(color: configuration.isPressed ? bgColorAlt : .clear, radius: 8)
                
                .opacity(configuration.isPressed ? 1.5 : 1.0)
        }
        // ∆ END OF: body
        
    }
    /// ∆ END OF: MyButton
}
/// ∆ END OF: PrimaryButtonStyle

// MARK: -∆ ••••••••• [ Custom Image Modifier ] •••••••••
extension Image {
    
    ///∆ ...........
    ///  • Creates a custom look for an image
    func circleImageFrame(aspectR: ContentMode, frameW: CGFloat,
                          frameH: CGFloat) -> some View {
        //∆..........
        self
            .resizable()
            .aspectRatio(contentMode: aspectR)
            .frame(width: frameW, height: frameH)
            .clipShape(Circle())
    }
    
    func imageFormattedFrame(_ aspectRatio:  ContentMode, w: CGFloat, h: CGFloat) -> some View {
        //∆..........
        self
            .resizable()
            .renderingMode(.original)
            .frame(width: w, height: h)
            .aspectRatio(contentMode: aspectRatio)
    }
    
    func imageSFFormattedFrame(paddingForFrame: CGFloat = 1, bgColor: Color, cornerR: CGFloat) -> some View {
        //∆..........
        self
            .padding(paddingForFrame)
            .background(bgColor)
            .cornerRadius(cornerR)
    }
    
}
/// ∆ END extension Image

extension View {
    
    func circleImageFrame(aspectR: ContentMode, frameW: CGFloat,
                          frameH: CGFloat) -> some View {
        //∆..........
        self
            ///.resizable() NEEDS TO BE CALLED ON THE VIEW USING
            /// THIS FUNCTION BEFORE USING THIS MODIFIER
            .aspectRatio(contentMode: aspectR)
            .frame(width: frameW, height: frameH)
            .clipShape(Circle())
    }
}

// MARK: -∆ ••••••••• [ BackGroundColorOnZStack ] •••••••••
struct BgColor_On_ZStackModifier: ViewModifier {
    // MARK: - ©PROPERTIES
    //∆..............................
    var bgColor: Color = Color.clear
    //∆..............................
    
    // MARK: -∆ ••••••••• Implementing Protocol Stub  •••••••••
    func body(content: Content) -> some View {
        //∆..........
        content
            .frame(width: FULL_UI_SCREEN_WIDTH)
            .background(bgColor)
            .ignoresSafeArea()
    }
}

// MARK: -∆ ••••••••• OuterFrameCardModifier •••••••••
struct OuterFrameCardModifier: ViewModifier {
    // MARK: - ©PROPERTIES
    //∆..............................
    var modifierFrameWidth: CGFloat = 350
    var modifierFrameHeight: CGFloat = 250
    var bgColor: Color = Color.lightBlue.opacity(0.16)
    var shadowColor: Color = Color.lightBlack.opacity(0.4)
    var overlayRectStrokeColor = Color.lightBlack
    var overlayRectShadowColor = Color.lightBlue.opacity(0.16)
    
    //∆..............................
    
    func body(content: Content) -> some View {
        //∆..........
        content
            // MARK: - Outer-Frame
            //--|............................................
            .frame(width: modifierFrameWidth, height: modifierFrameHeight)
            .background(bgColor)
            .cornerRadius(12)
            .shadow(color: shadowColor, radius: 8, x: 4, y: 7)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(overlayRectStrokeColor, lineWidth: 3)
                    .shadow(color: overlayRectShadowColor,
                            radius: 9, x: 2, y: 4.5)
                    .blur(radius: 5.0)
            )
        //--|............................................
    }
}

// MARK: -∆ ••••••••• [ Action Button Modifier ] •••••••••
struct ButtonCustomFrame: ViewModifier {
    // MARK: - ©PROPERTIES
    //∆..............................
    var bgColor: Color = .clear
    var fgColor: Color = .white
    var frameWidth: CGFloat = 100
    var frameHeight: CGFloat = 40
    //∆..............................
    
    // MARK: -∆ ••••••••• Implementing Protocol Stub  •••••••••
    func body(content: Content) -> some View {
        //∆..........
        content
            .font(.system(size: 16, weight: .semibold))
            .frame(width: frameWidth, height: frameHeight)
            .background(bgColor)
            .foregroundColor(fgColor)
            .clipShape(Capsule())
            .modifier(TextShadowModifier())
    }
}

// MARK: -∆ ••••••••• TextShadowModifier •••••••••
struct TextShadowModifier: ViewModifier {
    // MARK: - ©PROPERTIES
    //∆..............................
    var systemFontSize: CGFloat = 20
    var systemFontWeight: Font.Weight = .light
    var systemFontDesign: Font.Design = .default
    var fgColor: Color = .netflixRed
    var shadowColor: Color = Color.black.opacity(0.66)
    var shadow_Radius_AxisPoint: CGFloat = 2.5
    var shadow_X_AxisPoint: CGFloat = 2
    var shadow_Y_AxisPoint: CGFloat = 2
    //∆..............................
    
    func body(content: Content) -> some View {
        //∆..........
        // MARK: - Text modifier
        //--|............................................
        content
            .font(.system(size: systemFontSize,
                          weight: systemFontWeight,
                          design: systemFontDesign)
            )
            .foregroundColor(fgColor)
            .shadow(color: shadowColor,
                    radius: shadow_Radius_AxisPoint,
                    x: shadow_X_AxisPoint,
                    y: shadow_Y_AxisPoint)
        //--|............................................
    }
}





