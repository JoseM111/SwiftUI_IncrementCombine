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
            print("DEBUG:Setting up firebase")
            FirebaseApp.configure()
        }
        var body: some Scene {
            WindowGroup {
                LandingView()
            }
        }
    }

//@main
//struct SwiftUI_IncrementCombineApp: App {
//
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    var body: some Scene {
//        WindowGroup {
//            LandingView()
//        }
//    }
//}
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        //∆..........
//        print("DEBUG:Setting up firebase")
//
//        FirebaseApp.configure()
//        return true
//    }
//}
//// MARK: END OF: AppDelegate
