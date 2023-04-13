//
//  DataSetter.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI
import Firebase

class DataSetter: ObservableObject {
    static let shared = DataSetter()
    
    private init() {}
    
    //MARK: DataSetter - This Week Server Data Uploader
    func uploaderThisWeekServerData(image: UIImage ,name: String,date: String, url: String){
                
        ImageUploader.uploadImage(image: image){ urlImage in
            let data = ["name": name,
                        "date": date,
                        "url": url,
                        "image": urlImage]
            COLLECTION_thisWeekServer.document(name).setData(data){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: DataSetter - VS Server Data Uploader
    func uploaderVSServerData(image: UIImage,name: String,date: String, url: String){
        
        ImageUploader.uploadImage(image: image){ urlImage in
            let data = ["name": name,
                        "date": date,
                        "url": url,
                        "image": urlImage]
            COLLECTION_VSServer.document(name).setData(data){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: DataSetter - 1-99 Server Data Uploader
    func uploader1_99ServerData(image: UIImage,name: String,date: String, url: String){
        
        ImageUploader.uploadImage(image: image){ urlImage in
            let data = ["name": name,
                        "date": date,
                        "url": url,
                        "image": urlImage]
            COLLECTION_1_99Server.document(name).setData(data){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: DataSetter - 1-105 Server Data Uploader
    func uploader1_105ServerData(image: UIImage,name: String,date: String, url: String){
        
        ImageUploader.uploadImage(image: image){ urlImage in
            let data = ["name": name,
                        "date": date,
                        "url": url,
                        "image": urlImage]
            COLLECTION_1_105Server.document(name).setData(data){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: DataSetter - 1-120 Server Data Uploader
    func uploader1_120ServerData(image: UIImage,name: String,date: String, url: String){
        
        ImageUploader.uploadImage(image: image){ urlImage in
            let data = ["name": name,
                        "date": date,
                        "url": url,
                        "image": urlImage]
            COLLECTION_1_120Server.document(name).setData(data){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: DataSetter - 55-120 Server Data Uploader
    func uploader55_120ServerData(image: UIImage,name: String,date: String, url: String){
        
        ImageUploader.uploadImage(image: image){ urlImage in
            let data = ["name": name,
                        "date": date,
                        "url": url,
                        "image": urlImage]
            COLLECTION_55_120Server.document(name).setData(data){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
