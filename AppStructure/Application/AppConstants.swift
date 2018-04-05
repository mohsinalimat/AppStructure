//
//  Constants.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation


/**
 * General Class singleton constants
 */

let appUtility   = AppUtility.sharedInstance
let userDefaults = UserDefaults.standard
let notifCenter  = NotificationCenter.default
let application  = UIApplication.shared
let appDelegate  = application.delegate as! AppDelegate
let docsHelper   = DocumentsHelper.sharedInstance









/**
 * General constants
 */

let deviceScale:CGFloat = UIScreen.main.scale









/**
 * Messages and titles
 */

let titleServerError                    = "Error"


let messageServerError                  = "Server is not responding"
let messageNetworkError                 = "Please try again later, once your network connectivity is available"


let buttonOK                            = "OK"
let buttonLogout                        = "Logout"
let buttonSend                          = "Send"
let buttonDontSend                      = "Don't Send"
let buttonDelete                        = "Delete"
let buttonCancel                        = "Cancel"
let buttonCall                          = "Call"
let buttonSettings                      = "Settings"
let buttonEndCall                       = "End Call"
let buttonYES                           = "Yes"
let buttonNO                            = "No"
let buttonClose                         = "Close"
let buttonContactUs                     = "Contact Us"
let buttonGotIt                         = "Got it"
let buttonGoToAppstore                  = "Go to App Store"





/**
 * App keys
 */
let keyAuthToken                        = "appToken"




/**
 * Date Patterns
 */

let datePattern_Display_Time                    = "HH:mm:ss"
let datePattern_Display_TimeAM                  = "hh:mm a"
let datePattern_Display_DateAndTime             = "MMM dd, yyyy - hh:mm a"
let datePattern_Display_MonthNameDate           = "MMM dd, yyyy"
let datePattern_Display_Date                    = "MM-dd-YYYY"
let datePattern_Server                          = "MM-dd-yyyy"
let datePattern_Display_Date_Server             = "yyyy-MM-dd"
let datePattern_Display_DateAndTime_Server      = "yyyy-MM-dd HH:mm:ss"
let datePattern_Display_DateBooking             = "MMM dd, yyyy"







/**
 * Notifications
 */
let NOTIFICATION_LOGIN_SUCCESS   = "loginSuccess"
let NOTIFICATION_LOGOUT_SUCCESS  = "logoutSuccess"









/**
 * Contact Us Emails
 */
let contactEmail                = ""
let contactNumber               = "888-526-4677"










/**
 * Appstore URL
 */

let appstoreURL        = ""



