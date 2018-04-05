//
//  DocumentsHelper.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 7/21/17.
//  Copyright © 2017 Asif Bilal. All rights reserved.
//

import Foundation
import UIKit


class DocumentsHelper: NSObject {
    

    
    //  MARK:- Static

    static let sharedInstance = DocumentsHelper()

    
//
//    
//    
//    
//    
//    
//    
//    
//    //  MARK:- Private Properties
//    
//    fileprivate let fileManager = FileManager.default
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //  MARK:- Life Cycle
//
//    override init() {
//        super.init()
//    }
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //  MARK:- Public Computed Properties
//    
//    
//    var docsDirectory: URL {
//        
//        get {
//            let directories = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//            let docDirectoryUrl = directories[0]
//            return docDirectoryUrl
//        }
//    }
//    
//    
//    
//    var temporaryDocsFolder: URL {
//
//        get {
//            let docsFolderUrl = docsDirectory.appendingPathComponent(temporaryDocumentFolder)
//            return createDirctoryIfNotFound(atUrl: docsFolderUrl)
//        }
//    }
//
//    
//    var userPermanentDocsFolder: URL {
//        
//        get {
//            let docsFolderUrl = docsDirectory.appendingPathComponent(permanentUserDocumentFolder)
//            return createDirctoryIfNotFound(atUrl: docsFolderUrl)
//        }
//    }
//
//    var userPermanentRecordingsFolder: URL {
//        
//        get {
//            let recordingsFolderUrl = docsDirectory.appendingPathComponent(permanentUserRecordingFolder)
//            return createDirctoryIfNotFound(atUrl: recordingsFolderUrl)
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//
//    
//    
//    
//    
//    
//    //  MARK:- Private Functions
//    
//
//    func createDirctoryIfNotFound(atUrl url: URL) -> URL {
//        
//        var isDir : ObjCBool = false
//        if fileManager.fileExists(atPath: url.path, isDirectory:&isDir) {
//            
//            if isDir.boolValue {    // file exists and is a directory
//                return url
//            }
//            else {      // file exists and is not a directory
//                if deleteFileAt(url) {
//                    return createDirectoryAt(url)
//                }
//                return url
//            }
//        }
//        else {      // file does not exist
//            
//            return createDirectoryAt(url)
//        }
//    }
//
//    
//    private func createDirectoryAt( _ directoryUrl: URL) -> URL {
//    
//        do {
//            try fileManager.createDirectory(atPath: directoryUrl.path, withIntermediateDirectories: false, attributes: nil)
//        }
//        catch let error as NSError {
//            
//            QL1(error.localizedDescription)
//            Utility.showAlert(error, onController: UIViewController.topViewController()!)
//        }
//        return directoryUrl
//    }
//    
//    
//    
//    
//
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //  MARK:- Public Functions
//
//    
//    
//
//                                                        //  Save Files
//    
//    
//    func saveDocumentLocally(_ document: Document) -> Bool {
//        
//        let destinationPathUrl = document.localTemporaryURLForUploading
//
//        do {
//            try fileManager.copyItem(at: document.cloudContainerURL!, to: destinationPathUrl!)
//        }
//        catch let error as NSError {
//
//            QL1(error.localizedDescription)
//            Utility.showAlert(error, onController: UIViewController.topViewController()!)
//            return false
//        }
//        return true
//    }
//
//
//    
//    func saveImageFileLocally(_ imageFile: ImageFile) -> Bool {
//        
//        let destinationPathUrl = imageFile.localTemporaryURLForUploading
//        
//        do {
//            let imageData = imageFile.imageData
//            try imageData?.write(to: destinationPathUrl!, options: .atomic)
//            return true
//        } catch {
//            QL1(error.localizedDescription)
//            Utility.showAlert(error as NSError, onController: UIViewController.topViewController()!)
//            return false
//        }
//    }
//
//    
//    
//    
//
//                                                        //  Clear Files
//
//    
//    func clearAllFiles() {
//        
//        clearTemporaryDocumentsFolder()
//        clearUserRecordingFolderItems()
//    }
//    
//    func clearTemporaryDocumentsFolder() {
//        do {
//            let filePaths = try fileManager.contentsOfDirectory(atPath: temporaryDocsFolder.path)
//            for filePath in filePaths {
//
//                let filePathUrl = temporaryDocsFolder.appendingPathComponent(filePath)
//                _ = deleteFileAt(filePathUrl)
//            }
//        } catch let error as NSError {
//            QL1(error.localizedDescription)
//        }
//    }
//
//    
//    
//    func clearUserRecordingFolderItems() {
//        do {
//            let filePaths = try fileManager.contentsOfDirectory(atPath: userPermanentRecordingsFolder.path)
//            for filePath in filePaths {
//                
//                let filePathUrl = userPermanentRecordingsFolder.appendingPathComponent(filePath)
//                _ = deleteFileAt(filePathUrl)
//            }
//        } catch let error as NSError {
//            QL1(error.localizedDescription)
//        }
//    }
//
//    
//                                                        //  Utility
//
//    
//    
//    func fileExistAt( _ fileUrl: URL) -> Bool {
//        
//        return fileManager.fileExists(atPath: fileUrl.path)
//    }
//    
//    
//    func deleteFileAt( _ fileUrl: URL) -> Bool {
//        
//        do {
//            try fileManager.removeItem(atPath: fileUrl.path)
//        }
//        catch let error as NSError {
//            
//            QL1(error.localizedDescription)
//            Utility.showAlert(error, onController: UIViewController.topViewController()!)
//            return false
//        }
//        return true
//    }
//
}
