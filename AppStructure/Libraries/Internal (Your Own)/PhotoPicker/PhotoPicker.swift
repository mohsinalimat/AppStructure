//
//  PhotoPicker.swift
//  
//
//  Created by Fahid Attique on 23/05/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit

open class PhotoPicker: NSObject {
    
    public enum PickerSourceType: Int {
        case camera = 0,
        photoLibrary,
        cameraAndPhotoLibrary
    }
    

    var successBlock:((_ originalPhoto:UIImage?, _ editedPhoto: UIImage?) -> ())!
    
    open func pick(_ allowsEditing:Bool = false,
              pickerSourceType: PickerSourceType = .photoLibrary,
              controller: UIViewController,
              customActions: [UIAlertAction]? = nil, //This will only work when CameraAndPhotoLibrary option is selected.
              successBlock success: @escaping ((_ originalPhoto:UIImage?, _ editedPhoto: UIImage?) -> ()))
    {
        
        if pickerSourceType == .cameraAndPhotoLibrary {
            
           let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                QL1("User pressed Cancel")
            }))
            
            alertController.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { action in
                self.pick(allowsEditing, pickerSourceType: .camera, controller: controller, successBlock: success)
            }))
            
            alertController.addAction(UIAlertAction(title: "Choose photo", style: .default, handler: { action in
                self.pick(allowsEditing, pickerSourceType: .photoLibrary, controller: controller, successBlock: success)
            }))
            
            if let moreActions = customActions {
                
                for action in moreActions {
                    alertController.addAction(action)
                }
                
            }
            
            controller.present(alertController, animated: true, completion: nil)
            
            return
            
        }
        
        //Now show the Image Picker Controller
        
        var sourceType:UIImagePickerControllerSourceType!
        
        switch pickerSourceType {
        case .camera:
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                sourceType = .camera
            } else {
                sourceType = .savedPhotosAlbum
            }
            
        case .photoLibrary:
            sourceType = .photoLibrary
        default:
            sourceType = .savedPhotosAlbum
            
        }
        
        let picker = UIImagePickerController()
        
        picker.sourceType = sourceType
        picker.allowsEditing = allowsEditing
        picker.delegate = self
        
        self.successBlock = success
        
        controller.present(picker, animated: true, completion: nil)
        
    }
    
}

extension PhotoPicker: UINavigationControllerDelegate {

}

extension PhotoPicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
        let editedPhoto = info[UIImagePickerControllerEditedImage] as? UIImage
        
        successBlock(originalPhoto, editedPhoto)
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
