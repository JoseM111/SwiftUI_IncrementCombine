import SwiftUI

struct RemindView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    
    //™•••••••••••••••••••••••••••••••••••«
    
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: -∆ Initializer
    ///∆.................................
    init() {
        //∆..........
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        
    }
    ///∆.................................
    
    var body: some View {
        
        //.............................
        ScrollView {
            
            VStack(alignment: .center, spacing: nil, content: {
                
                // MARK: -∆  DropDownSubView()  '''''''''''''''''''''
                
                ///ººº..................................•••
                Spacer(minLength: 300) // Spaced Vertically
                ///ººº..................................•••
                
                DropDownSubView()
                
                ///ººº..................................•••
                Spacer(minLength: 300) // Spaced Vertically÷
                ///ººº..................................•••
                
                VStack {
                    
                    // MARK: -∆  Button(Create)  '''''''''''''''''''''
                    
                    createBtnComponent {
                        //∆..........
                        
                    }
                    // ∆ END OF: Button
                    
                    // MARK: -∆  Button(Skip)  '''''''''''''''''''''
                    
                    skipBtnComponent {
                        //∆..........
                        
                    }
                    // ∆ END OF: Button
                }
                // ∆ END OF: VStack
                .padding(.bottom, 35)
                //∆ HANGER ™👕™ .................
                
            })
            // ∆ END OF: VStack
            .accentColor(.white)
            .navigationBarTitle("Remind")
        }
        // MARK: ||END__PARENT-ScrollView||
        .modifier(VStackImageFullScreenModifier(imageName: "increment-app-bg"))
        //.............................
        
    }
    // MARK: |||END OF: body|||
    
    
}
// MARK: END OF: RemindView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
// MARK: -∆  EXTENSION OF: [( RemindView )] •••••••••

extension RemindView {
    
    // MARK: @------- [Computed some-View Properties] -------
    
    func createBtnComponent(action: @escaping () -> Void) -> some View {
        //∆..........
        Button(action: {  }) {
            //∆..... LABEL .....
            Text("Create")
                .modifier(TextShadowModifier(
                            systemFontSize: 22,
                            systemFontWeight: .semibold,
                            fgColor: .white, shadowColor: Color.primary.opacity(0.35),
                            shadow_Radius_AxisPoint: 3,
                            shadow_X_AxisPoint: 4,
                            shadow_Y_AxisPoint: 5.5))
        }
        // ∆ END OF: Button
        .padding(.bottom, 20)
    }
    
    func skipBtnComponent(action: @escaping () -> Void) -> some View {
        //∆..........
        Button(action: {  }) {
            //∆..... LABEL .....
            //∆..... LABEL .....
            Text("Skip")
                .modifier(TextShadowModifier(
                            systemFontSize: 22,
                            systemFontWeight: .semibold,
                            fgColor: .white, shadowColor: Color.primary.opacity(0.35),
                            shadow_Radius_AxisPoint: 3,
                            shadow_X_AxisPoint: 4,
                            shadow_Y_AxisPoint: 5.5))
        }
        // ∆ END OF: Button
        .padding(.bottom, 20)
    }
    
}
// MARK: END OF: RemindView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

/// ™•••••••••••••••••••••••••••• ([ Preview ]) ••••••••••••••••••••••••••••™

// MARK: - Preview
struct RemindView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            //∆..........
            RemindView()
        }
        //.padding(.all, 100)
        //.preferredColorScheme(.dark)
        //.previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 360, height: 720))
        // The preview below is for like a card
        //.previewLayout(.fixed(width: 440, height: 270))
    }
}
/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
