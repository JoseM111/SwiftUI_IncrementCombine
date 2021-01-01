import SwiftUI

struct CreateView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    /// ™ It is a `@StateObject` becuase this view owns it when it creates it
    @StateObject var createChallengeVM = CreateChallengeViewModel()
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
        ZStack {
            
            if createChallengeVM.isLoading {
                //∆..........
                ProgressView()
            } else { mainContentView }
        }
        // MARK: ||END__PARENT-ZStack||
        // MARK: - alert
        ///™™|............................................
        .alert(isPresented: Binding<Bool>
                .constant($createChallengeVM.error.wrappedValue != nil),
               content: {
                //∆..........
                Alert(title: Text("Error!"),
                      message: Text(
                        $createChallengeVM.error.wrappedValue?.localizedDescription ?? ""),
                      dismissButton: .default(Text("OK"), action: {
                        //∆..........
                        createChallengeVM.error = nil
                      }))
               })
        ///™™|............................................
        .navigationBarTitle("Create")
        .navigationBarBackButtonHidden(true)
        .modifier(VStackImageFullScreenModifier(imageName: "increment-app-bg"))
        //.............................
        
    }
    // MARK: |||END OF: body|||
    
    
}
// MARK: END OF: CreateView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
// MARK: -∆  EXTENSION OF: [( CreateView )] •••••••••

extension CreateView {
    
    // MARK: @------- [Computed some-View Properties] -------
    
    /// ™ mainContentView ----------
    var mainContentView: some View {
        //∆..........
        ScrollView {
            
            VStack(alignment: .center, spacing: nil, content: {
                
                ///ººº..................................•••
                Spacer(minLength: 200) // Spaced Vertically
                ///ººº..................................•••
                
                // MARK: -∆  dropdownListForEachComponent  '''''''''''''''''''''
                dropdownListGroupComponent
                
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
            //∆ HANGER ™👕™ .................
        }
        // ∆ END OF: ScrollView
    }
    /// ∆ END OF: mainContentView ----
    
    /// ™ dropdownListGroupComponent ----------
    var dropdownListGroupComponent: some View {
        //∆..........
        Group {
            DropDownSubView(createChallengeVM: $createChallengeVM.exerciseDropdown)
            DropDownSubView(createChallengeVM: $createChallengeVM.startAmountDropdown)
            DropDownSubView(createChallengeVM: $createChallengeVM.increaseDropdown)
            DropDownSubView(createChallengeVM: $createChallengeVM.lengthDropdown)
        }
        // ∆ END OF: Group
    }
    /// ∆ END OF: dropdownListGroupComponent ----
}
// MARK: END OF: CreateView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
