//
//  DocumentPicker.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import UIKit
import SwiftUI
import MobileCoreServices

struct DocumentPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIDocumentPickerViewController
    var onPick: ([URL]) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeAudio as String], in: .import)
        documentPicker.delegate = context.coordinator
      
        return documentPicker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    class Coordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {
        var parent: DocumentPicker
        
        init(_ parent: DocumentPicker) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            let fileManager = FileManager.default
            let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            var copiedURLs: [URL] = []
            
            for sourceURL in urls {
                let destinationURL = documentsDirectory.appendingPathComponent(sourceURL.lastPathComponent)
                
                do {
                    if fileManager.fileExists(atPath: destinationURL.path) {
                        print("\(destinationURL.lastPathComponent) is still on.")
                        continue
                    }
                    try fileManager.copyItem(at: sourceURL, to: destinationURL)
                    copiedURLs.append(destinationURL)
                } catch {
                    print("FIXto DocumentPicker: \(error.localizedDescription)")
                }
            }
            parent.onPick(copiedURLs)
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) { }
    }
}
