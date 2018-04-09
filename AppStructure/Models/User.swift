//
//  User.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation
import ObjectMapper



private let keyAppUser = "appUser"



enum Role: String {
    case company = "company", client = "client", user = "user", interpreter = "interpreter"
}


class User:NSObject,NSCoding, Mappable {
    

    
    // MARK:- Class Functions
    
    class func getCurrentUser() -> User?
    {
        if (userDefaults.dictionaryRepresentation().keys.contains(keyAppUser) == false) {
            return nil
        }
        
        let userData = userDefaults.object(forKey: keyAppUser) as! Data
        return (NSKeyedUnarchiver.unarchiveObject(with: userData) as! User)
    }
    
    class func removeUser() {
        
        userDefaults.removeObject(forKey: keyAppUser)
        userDefaults.synchronize()
        
    }
    
    class func logoutUser() {
        removeUser()
        appUtility.activeUser = nil
    }

    
    
    
    
    
    
    
    
    
    // MARK:- Private Constants
    
    fileprivate static let keyUserId           = "userId"
    fileprivate static let keyFirstName        = "firstName"
    fileprivate static let keyLastName         = "lastName"
    fileprivate static let keyEmail            = "email"
    fileprivate static let keyPhone            = "phone"
    fileprivate static let keyCountry          = "country"
    fileprivate static let keyCreatedAt        = "createdAt"
    fileprivate static let keyuserImageName    = "userImageName"
    fileprivate static let keyCallMode         = "callMode"
    fileprivate static let keyCallRecording    = "callRecording"
    fileprivate static let keyHasPaymentSource = "hasPaymentSource"
    fileprivate static let keyRole             = "role"
    fileprivate static let keyDialingCode      = "dialingCode"
    
    

    
    
    
    

    
    // MARK:- Class Properties

    var userId:String = ""
    var firstName: String = ""
    var lastName: String = ""
    var name:String?
    var email: String = ""
    var dialingCode: String = ""
    var phone: String = ""
    var country: String = ""
    var createdAt: Date = Date()
    var userImageName: String = ""
    var callMode: String = ""
    var agreements:Array<String> = Array()
    var callRecording: Bool? = false
    var hasPaymentSource: Bool? = false
    var phoneNumberWithDialingCode: String { return "+" + dialingCode + phone }
    var isRoleClient: Bool { return role == .client }
    var isRoleUser: Bool { return role == .user }
    var isRoleCompany: Bool { return role == .company }
    var isRoleInterpreter: Bool { return role == .interpreter }

    
    private var _role: String? = "client"
    var role: Role {
        get {
            if _role == nil { return .client }
            return Role(rawValue: _role!) ?? .client
        }
    }
    
    
    var fullName: String {
        
        var names = [String]()
        
        if !firstName.isEmpty { names.append(firstName)}
        if !lastName.isEmpty { names.append(lastName)}
        
        if names.count > 0 { return names.joined(separator: " ")}
        else {
            if let username = name {
                if name != "" { return username }
            }
            return ""
        }
    }
    
    var userImageURL: URL? {
        
        if !userImageName.isEmpty, let url = URL(string: userImageName) { return url }
        return nil
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- Life Cycle
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        

        userId <- (map["id"], TransformOf<String, Int>(fromJSON: { $0.map { String($0) } }, toJSON: { Int($0!) }))
        name <- map["name"]
        phone <- map["phone_number"]
        dialingCode <- map["dialing_code"]
        createdAt <- (map["created_at"], DateTransform())
        callMode <- map["mode"]
        agreements <- map["agreements"]
        callRecording  <- map["call_recording"]
        hasPaymentSource  <- map["has_payment_source"]
        _role <- map["roles"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        email <- map["email"]
        country <- map["country"]
        userImageName <- map["display_picture"]
    }
    
    
    
    

    
    
    
    
    
    
    
    // MARK:- NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        
        userId           = aDecoder.decodeObject(forKey: User.keyUserId) as! String
        firstName        = aDecoder.decodeObject(forKey: User.keyFirstName) as! String
        lastName         = aDecoder.decodeObject(forKey: User.keyLastName) as! String
        email            = aDecoder.decodeObject(forKey: User.keyEmail) as! String
        phone            = aDecoder.decodeObject(forKey: User.keyPhone) as! String
        country          = aDecoder.decodeObject(forKey: User.keyCountry) as! String
        createdAt        = aDecoder.decodeObject(forKey: User.keyCreatedAt) as! Date
        userImageName    = aDecoder.decodeObject(forKey: User.keyuserImageName) as! String
        callMode         = aDecoder.decodeObject(forKey: User.keyCallMode) as! String
        callRecording    = aDecoder.decodeObject(forKey: User.keyCallRecording) as? Bool
        hasPaymentSource = aDecoder.decodeObject(forKey: User.keyHasPaymentSource) as? Bool
        _role            = aDecoder.decodeObject(forKey: User.keyRole) as? String
        dialingCode      = aDecoder.decodeObject(forKey: User.keyDialingCode) as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(userId, forKey: User.keyUserId)
        aCoder.encode(firstName, forKey: User.keyFirstName)
        aCoder.encode(lastName, forKey: User.keyLastName)
        aCoder.encode(email, forKey: User.keyEmail)
        aCoder.encode(phone, forKey: User.keyPhone)
        aCoder.encode(country, forKey: User.keyCountry)
        aCoder.encode(createdAt, forKey: User.keyCreatedAt)
        aCoder.encode(userImageName, forKey: User.keyuserImageName)
        aCoder.encode(callMode, forKey: User.keyCallMode)
        aCoder.encode(callRecording, forKey: User.keyCallRecording)
        aCoder.encode(hasPaymentSource, forKey: User.keyHasPaymentSource)
        aCoder.encode(_role, forKey: User.keyRole)
        aCoder.encode(dialingCode, forKey: User.keyDialingCode)
    }
    
    
    

    
    
    
    
    
    
    
    
    
    // MARK:- Public Methods
    
    func saveUser() -> Bool {
        appUtility.activeUser = self
        userDefaults.set(NSKeyedArchiver.archivedData(withRootObject: self), forKey: keyAppUser)
        return userDefaults.synchronize()
    }
    
}
