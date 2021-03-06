import SwiftUI

struct DropDownSubView<T: DropdownItemProtocol>: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    @Binding var createChallengeVM: T
    //™•••••••••••••••••••••••••••••••••••«
    let darkPrimaryGray = Color.darkPrimaryGray.opacity(0.35)
    let whiteOpacity = Color.white.opacity(0.6)
    ///™«««««««««««««««««««««««««««««««««««
    
    var body: some View {
        
        //.............................
        VStack(alignment: .center, spacing: nil, content: {
            
            // MARK: -∆  Text(Exercise)  '''''''''''''''''''''
            
            HStack {
                
                Text(createChallengeVM.headerTitle)
                    .modifier(TextShadowModifier(
                                systemFontSize: 22,
                                systemFontWeight: .semibold,
                                fgColor: .white, shadowColor: Color.primary.opacity(0.35),
                                shadow_Radius_AxisPoint: 3,
                                shadow_X_AxisPoint: 3,
                                shadow_Y_AxisPoint: 4.5))
                    .padding(.leading, 8)
                
                ///ººº..................................•••
                Spacer(minLength: 0) // Spaced Horizontally
                ///ººº..................................•••
            }
            
            // MARK: -∆  Dropdown-Button(Pushups)  '''''''''''''''''''''
            
            Button(action: { createChallengeVM.isSelected = true }) {
                //∆..... LABEL .....
                HStack {
                    
                    Text(createChallengeVM.dropdownTitle)

                    ///ººº..................................•••
                    Spacer(minLength: 0) // Spaced Horizontally
                    ///ººº..................................•••
                    
                    Image(systemName: "arrowtriangle.down.square")
                }
                // ∆ END OF: HStack
                .font(.system(size: 20, weight: .semibold))
                .frame(width: 315, height: 30)
                .foregroundColor(whiteOpacity)
                .modifier(SuperShadowBtnStyleModifier(bgColor: whiteOpacity))
            }
            // ∆ END OF: Button
            .modifier(SuperShadowBtnStyleModifier(bgColor: darkPrimaryGray))

            
        })
        // MARK: ||END__PARENT-VSTACK||
        // MARK: - actionSheet
        ///™™|............................................
        .actionSheet(isPresented: $createChallengeVM.isSelected) {
            //∆..........
            actionSheetSelectedComponent
        }
        ///™™|............................................
        //.............................
        
    }
    // MARK: |||END OF: body|||
    
    
}
// MARK: END OF: DropDownSubView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
// MARK: -∆  EXTENSION OF: [( DropDownSubView )] •••••••••

extension DropDownSubView {
    
    // MARK: @------- [Computed some-View Properties] -------
    
    /// ™ actionSheetSelected ----------
    var actionSheetSelectedComponent: ActionSheet {
        //∆..........
        ActionSheet(
            title: Text("Select"),
            buttons: createChallengeVM.options.map { option in
                //∆..........
                return .default(Text(option.formatted)) {
                    ///∆ Select `option` at `index`
                    createChallengeVM.selectedOption = option
                }
            })
    }
    /// ∆ END OF: actionSheetSelected ----
}
// MARK: END OF: DropDownSubView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
/// ™•••••••••••••••••••••••••••• ([ Preview ]) ••••••••••••••••••••••••••••™

// MARK: - Preview
//struct DropDownSubView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        DropDownSubView()//.padding(.all, 100)
//        .preferredColorScheme(.dark)
//        //.previewLayout(.sizeThatFits)
//        //.previewLayout(.fixed(width: 360, height: 720))
//        // The preview below is for like a card
//        .previewLayout(.fixed(width: 440, height: 170))
//    }
//}
/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
