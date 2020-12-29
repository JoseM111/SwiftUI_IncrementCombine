import SwiftUI

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

struct GenericTxtShadowSubView: View {
    /// MARK: - ™PROPERTIES™
    ///™«««««««««««««««««««««««««««««««««««
    var text: String = currentDate(date: Date())
    var sysFontSize: CGFloat = 20
    var sysFontWeight: Font.Weight = .regular
    var fgColor: Color = .flowerRed
    var shadowColor: Color = Color.black.opacity(0.35)
    ///™«««««««««««««««««««««««««««««««««««
    
    // MARK: -∆  body •••••••••
    var body: some View {
        Text(text)
            .modifier(
                TextShadowModifier(
                    systemFontSize: sysFontSize, systemFontWeight: sysFontWeight,
                    fgColor: fgColor, shadowColor: shadowColor,
                    shadow_Radius_AxisPoint: 4, shadow_X_AxisPoint: 1,
                    shadow_Y_AxisPoint: 5))
    }
}
// MARK: END OF: GenericTxtShadowSubView

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// MARK: -∂ Custom colors
extension Color {
    //__________
    static let netflixRed = Color(r: 229, g: 10, b: 21)
    static let twitterBlue = Color(r: 77, g: 159, b: 235)
    static let twitterBlue2 = Color(red: 0.1155984178, green: 0.6330730319, blue: 0.9510951638)
    static let flowerRed = Color(r: 171, g: 41, b: 46)
    static let midGreen = Color(r: 59, g: 129, b: 37)
    static let midOrange = Color(r: 232, g: 117, b: 46)
    static let lightBlue = Color(r: 91, g: 194, b: 244)
    static let lightBlue2 = Color(r: 193, g: 253, b: 251)
    static let lightBlack = Color(r: 33, g: 35, b: 37)
    static let lightPurple = Color(r: 161, g: 83, b: 205)
    static let skyPink = Color(r: 209, g: 165, b: 180)
    static let skyGray = Color(r: 226, g: 227, b: 221)
    static let neonOrange = Color(r: 232, g: 87, b: 43)
    static let neonYellow = Color(r: 247, g: 209, b: 71)
    static let darkPurple = Color(r: 60, g: 33, b: 119)
    static let darkPrimaryGray = Color(r: 106, g: 157, b: 194)
    static let darkBlue = Color(r: 51, g: 61, b: 126)

    
    /// ∆ Initializer
    /// <convenience> keyword can be left out because Initializers
    /// can call other initializers to perform part of an instance’s
    /// initialization. This process, known as initializer delegation,
    /// avoids duplicating code across multiple initializers.
    //∆.................................
    init(r: Double, g: Double, b: Double) {
        self.init(red: r/255, green: g/255, blue: b/255)
    }
    //∆.................................
}/// ∆ END extension Color

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// MARK: -∂ arrayToStr(): Prints out a formatted array
/** [ HOW TO CALL ]
 let publicName: String? = "Alias111"
 let publicAge: Int? = 20
 //∆..........
 unwrapWithGuard(strMsg: "Public Name:", unwrapMe: publicName)
 unwrapWithGuard(unwrapMe: publicAge) */
func unwrapWithGuard<T>(strMsg: String = "", unwrapMe: T?) -> Void {
    //∆..........
    guard let result = unwrapMe else { return print("∆- Could not unwrap optional") }
    /// ∆ - REPLACE CUSTOM `printf closure` with
    /// normal `print()` if `printf` is unvailable
    strMsg == ""
    ? print("™. Unwrapped Value: \(result)")
    : print("™. Value: \(strMsg)\n™. Result: \(result)")
}

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// MARK: -∂ Provides a formatted currency in dollars "$123.44"
func currency(price: Double) -> String {
    //__________
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    /// # formatter.locale = NSLocale.currentLocale()
    /// # This is the defaultIn Swift 4, this ^ has
    /// # been renamed to simply NSLocale.current
    guard let result = formatter.string(from: NSNumber(value: price))
    else { return "" }
    
    return result
}

// MARK: -∂ Provides a formatted currency in dollars "$123.44"
// MARK: but NumberFormatter() is suggested to be used instead
func convertToCash(price: Double) -> String {
    //..........
    String(format: "$%.02f", price)
}

// MARK: -∂ A starter placeholder for anything you want
func myPlaceHolder(myStr: String) -> some View {
    Text("➡ \(myStr) 🎯!⬅")
        .font(.system(size: 22))
        .foregroundColor(.white)
        .bold()
        .background(Color.black)
}

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// MARK: ∆ ........... Date formatters[START] ...........
extension Date {
    
    /**
     Sets Formatting for out dates. Returns a String
     date.dateRightNow()// Apr 26, 2020<--Example
     ## Important Notes ##
     1. This extends a Date; so it is usable on all Date objects
     2. Currently Set to medium Date length
     */
    func dateRightNow() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

func formattedDate(timeInterval_dt: Double, dateFormattedStr: String) -> String {
    //∆..........
    let date = Date(timeIntervalSince1970: TimeInterval(timeInterval_dt))
    
    let dateFormatter = DateFormatter()
    /// ∆ dateFormatter.dateFormat = "E, d MMM" <- From: NSDateFormatter.com
    dateFormatter.dateFormat = dateFormattedStr
    
    return dateFormatter.string(from: date)
}


// Returns current date formatted, once a date object is passed
func currentDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    
    // US English Locale (en_US)
    dateFormatter.locale = Locale(identifier: "en_US")
    let todaysDate = dateFormatter.string(from: date)
    print(todaysDate)
    
    return todaysDate
}
// MARK: ∆ ........... Date formatters[END] ...........

/// @•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

// Great place holder function kinda a phantom type
func undefined<T>(_ msg: String = "") -> T {
    fatalError("Undefined: \(msg)")
}
