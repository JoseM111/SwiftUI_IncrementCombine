import SwiftUI

struct CreateView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    /// ™ It is a `@StateObject` becuase this view owns it when it creates it
    @StateObject var createChallengeVM = CreateChallengeViewModel()
    @State var isActive: Bool = false
    //™•••••••••••••••••••••••••••••••••••«
    var dropdownListForEachComponent: some View {
        //∆..........
        ForEach(createChallengeVM.dropdowns.indices, id: \.self) { index in
            //∆..........
            DropDownSubView(createChallengeVM: $createChallengeVM.dropdowns[index])
        }
    }
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
                
                ///ººº..................................•••
                Spacer(minLength: 200) // Spaced Vertically
                ///ººº..................................•••
                
                // MARK: -∆  dropdownListForEachComponent  '''''''''''''''''''''
                dropdownListForEachComponent
                
                // MARK: -∆  Button(Next) To Dismiss View  '''''''''''''''''''''
                NavigationLink(destination: RemindView(), isActive: $isActive) {
                        
                    Button(action: { isActive.toggle() }) {
                        //∆..... LABEL .....
                        Text("Next")
                            .modifier(TextShadowModifier(
                                        systemFontSize: 22,
                                        systemFontWeight: .semibold,
                                        fgColor: .white, shadowColor: Color.primary.opacity(0.35),
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
        //.preferredColorScheme(.dark)
        //.previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 360, height: 720))
        // The preview below is for like a card
        //.previewLayout(.fixed(width: 440, height: 270))
    }
}
/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
