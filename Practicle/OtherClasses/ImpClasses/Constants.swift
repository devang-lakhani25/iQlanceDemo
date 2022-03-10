import UIKit
import Foundation
import CoreLocation

/*---------------------------------------------------
 Screen Size
 ---------------------------------------------------*/
let _screenSize     = UIScreen.main.bounds.size
let _screenFrame    = UIScreen.main.bounds

/*---------------------------------------------------
 Constants
 ---------------------------------------------------*/
let _defaultCenter  = NotificationCenter.default
let _userDefault    = UserDefaults.standard
let _appDelegator   = UIApplication.shared.delegate! as! AppDelegate
let _application    = UIApplication.shared

/*---------------------------------------------------
 Current loggedIn User
 ---------------------------------------------------*/
let _deviceType = "ios"
let _deviceId = UIDevice.current.identifierForVendor!.uuidString

/*---------------------------------------------------
 Date Formatter and number formatter
 ---------------------------------------------------*/
let _serverFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeZone = TimeZone(abbreviation: "UTC")
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    df.locale = Locale(identifier: "en_US_POSIX")
    return df
}()

let _deviceFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeZone = TimeZone.current
    df.dateFormat = "yyyy-MM-dd"
    return df
}()

let _numberFormatter:NumberFormatter = {
    let format = NumberFormatter()
    format.locale = Locale(identifier: "en_IN")
    format.numberStyle = .currency
    format.allowsFloats = true
    format.minimumFractionDigits = 2
    format.maximumFractionDigits = 2
    return format
}()




/*---------------------------------------------------
 Custom print
 ---------------------------------------------------*/
func kprint(items: Any...) {
    #if DEBUG
    for item in items {
        print(item)
    }
    #endif
}



//MARK:- Constant
//-------------------------------------------------------------------------------------------
// Common
//-------------------------------------------------------------------------------------------
let _statusBarHeight           : CGFloat = _appDelegator.window!.rootViewController!.topLayoutGuide.length
let _navigationHeight          : CGFloat = _statusBarHeight + 44
let _btmNavigationHeight       : CGFloat = _bottomAreaSpacing + 64
let _btmNavigationHeightSearch : CGFloat = _bottomAreaSpacing + 64 + 45
let _bottomAreaSpacing         : CGFloat = _appDelegator.window!.rootViewController!.bottomLayoutGuide.length
let _vcTransitionTime                    = 0.3
let _tabBarHeight              : CGFloat = 65 + _bottomAreaSpacing
let _imageFadeTransitionTime   : Double  = 0.3
