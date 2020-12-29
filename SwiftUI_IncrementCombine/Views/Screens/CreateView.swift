import SwiftUI

struct CreateView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    @State var isActive: Bool = false
    //™•••••••••••••••••••••••••••••••••••«
    
    ///™«««««««««««««««««««««««««««««««««««
    
    
    var body: some View {
        
        //.............................
        ScrollView {
            
            VStack(alignment: .center, spacing: nil, content: {
                
                ///ººº..................................•••
                Spacer(minLength: 120) // Spaced Vertically
                ///ººº..................................•••
                
                DropDownSubView()
                DropDownSubView()
                DropDownSubView()
                DropDownSubView()
                
                ///ººº..................................•••
                Spacer() // Spaced Vertically
                ///ººº..................................•••
                
                // MARK: -∆  Button(Next) To Dismiss View  '''''''''''''''''''''
                NavigationLink(destination: Text("RemindView"), isActive: $isActive) {
                        
                    Button(action: { isActive.toggle() }) {
                        //∆..... LABEL .....
                        Text("Next")
                            .modifier(TextShadowModifier(
                                        systemFontSize: 22,
                                        systemFontWeight: .semibold,
                                        fgColor: .primary, shadowColor: Color.primary.opacity(0.35),
                                        shadow_Radius_AxisPoint: 3,
                                        shadow_X_AxisPoint: 4,
                                        shadow_Y_AxisPoint: 5.5))
                        
                    }
                    // ∆ END OF: Button
                    .padding(.top, 10)
                    //∆ HANGER ™👕™ .................
                }
                // ∆ END OF: NavigationLink
            })
            // ∆ END OF: VStack
            .navigationBarTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        // MARK: ||END__PARENT-ScrollView||
        .modifier(VStackImageFullScreenModifier(imageName: "increment-app-bg"))
        //.............................
        
    }
    // MARK: |||END OF: body|||
    
    
}
// MARK: END OF: CreateView

/// ™•••••••••••••••••••••••••••• ([ Preview ]) ••••••••••••••••••••••••••••™

// MARK: - Preview
struct CreateView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            CreateView()
        }
        //.padding(.all, 100)
        .preferredColorScheme(.dark)
        //.previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 360, height: 720))
        // The preview below is for like a card
        //.previewLayout(.fixed(width: 440, height: 270))
    }
}
/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
