//
//  ActionSheetPickerUpgrade.swift
//  AppStructure
//
//  Created by Fahid Attique on 15/02/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import ActionSheetPicker_3_0

class ActionSheetPicker {
    
    class func showStringPicker(_ title: String, rows strings: [AnyObject]?, initialSelection index: Int, doneBlock:@escaping (Int, AnyObject) -> Void, origin: UIView, controller: UIViewController) {
        
        controller.endEditing()
        
        ActionSheetStringPicker.show(withTitle: title, rows: strings, initialSelection: index, doneBlock: { (picker, index, value) in
            doneBlock(index, value as AnyObject)
        }, cancel: { (picker) in
            //            QL1("String Picker is Cancelled!")
        }, origin: origin)
        
    }
    
    class func showDatePicker(_ title: String = "Select Date", selectedDate: Date = Date(), datePickerMode: UIDatePickerMode = .date, doneBlock: @escaping (AnyObject, AnyObject) -> Void, origin: UIView, controller: UIViewController) {
        
        controller.endEditing()
        
        ActionSheetDatePicker.show(withTitle: title, datePickerMode: datePickerMode, selectedDate: selectedDate, doneBlock: { (picker, value, origin) in
            doneBlock(value as AnyObject, origin as AnyObject)
        }, cancel: { (picker) in
            //            QL1("Date Picker is Cancelled!")
        }, origin: origin)
    }
    
    
    class func showDateTimePicker(_ title: String = "Select Date", selectedDate: Date = Date(), minDate: Date?, maxDate: Date?, datePickerMode: UIDatePickerMode = .dateAndTime, doneBlock: @escaping (AnyObject, AnyObject) -> Void, origin: UIView, controller: UIViewController) {
        
        controller.endEditing()
        
        ActionSheetDatePicker.show(withTitle: title, datePickerMode: datePickerMode, selectedDate: selectedDate, minimumDate: minDate, maximumDate: maxDate, doneBlock: { (picker, value, origin) in
            
            doneBlock(value as AnyObject, origin as AnyObject)
            
        }, cancel: { (picker) in
            
        }, origin: origin)
    }

}
