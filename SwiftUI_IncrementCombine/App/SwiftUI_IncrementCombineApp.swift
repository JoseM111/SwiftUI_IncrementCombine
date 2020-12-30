//
//  SwiftUI_IncrementCombineApp.swift
//  SwiftUI_IncrementCombine
//
//  Created by Jose Martinez on 12/28/20.
//

    import SwiftUI
    import Firebase

    @main
    struct SwiftUI_IncrementCombineApp: App {
        
        init() {
            FirebaseApp.configure()
        }
        var body: some Scene {
            WindowGroup {
                LandingView()
            }
        }
    }
