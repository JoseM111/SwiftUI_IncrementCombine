import SwiftUI

struct RemindView: View {
    // MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    
    //™•••••••••••••••••••••••••••••••••••«
    
    ///™«««««««««««««««««««««««««««««««««««
    
    
    var body: some View {
        
        //.............................
        VStack(alignment: .center, spacing: nil, content: {
            
            iAmHere(myStr: "RemindView")
            
        })
        // MARK: ||END__PARENT-VSTACK||
        
        //.............................
        
    }
    // MARK: |||END OF: body|||
    
    
}
// MARK: END OF: RemindView

/// ™•••••••••••••••••••••••••••• ([ Preview ]) ••••••••••••••••••••••••••••™

// MARK: - Preview
struct RemindView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RemindView()//.padding(.all, 100)
        //.preferredColorScheme(.dark)
        //.previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 360, height: 720))
        // The preview below is for like a card
        //.previewLayout(.fixed(width: 440, height: 270))
    }
}
/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
