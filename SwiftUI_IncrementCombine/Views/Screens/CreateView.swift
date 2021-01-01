import SwiftUI

struct CreateView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    /// ™ It is a `@StateObject` becuase this view owns it when it creates it
    @StateObject var createChallengeVM = CreateChallengeViewModel()
    //™•••••••••••••••••••••••••••••••••••«
    var dropdownListForEachComponent: some View {
        //∆..........
        ForEach(createChallengeVM.dropdowns.indices, id: \.self) { index in
            //∆..........
            DropDownSubView(createChallengeVM: $createChallengeVM.dropdowns[index])
        }
    }
    
    /// ™ actionSheetSelected ----------
    var actionSheetSelected: ActionSheet {
        //∆..........
        ActionSheet(
            title: Text("Select"),
            buttons: createChallengeVM.displayOption.indices.map { index in
                //∆..........
                let option = createChallengeVM.displayOption[index]
                //∆..........
                return .default(Text(option.formatted)) {
                    ///∆ Select `option` at `index`
                    createChallengeVM.send(action: .selectOption(index: index))
                }
            })
    }
    /// ∆ END OF: actionSheetSelected ----
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
                
                Button(action: {
                    //∆..........
                    createChallengeVM.send(action: .createChallenge)
                    
                }) {
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
                .padding(.top, 10)
                //∆ HANGER ™👕™ .................
            })
            // ∆ END OF: VStack
            // MARK: - actionSheet
            ///™™|............................................
            .actionSheet(
                isPresented: Binding<Bool>(
                    get: {
                        //∆..........
                        createChallengeVM.selectedDropdown
                        //∆..........
                    },
                    set: { _ in })
            ) {
                actionSheetSelected
            }
            ///™™|............................................
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
            //∆ HANGER ™👕™ .................
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
