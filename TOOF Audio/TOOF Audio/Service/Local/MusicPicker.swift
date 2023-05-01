//
//  MusicPicker.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.04.2023.
//

import Foundation
import SwiftUI
import MediaPlayer

struct MusicPicker: UIViewControllerRepresentable {
    
    @Binding var selectedMusic: [URL]
    
    func makeUIViewController(context: Context) -> MPMediaPickerController {
        let picker = MPMediaPickerController(mediaTypes: .music)
        picker.delegate = context.coordinator
        picker.allowsPickingMultipleItems = true // allows multiple selections
        return picker
    }
    
    func updateUIViewController(_ uiViewController: MPMediaPickerController, context: Context) {
        // No update needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, MPMediaPickerControllerDelegate {
        
        let parent: MusicPicker
        
        init(parent: MusicPicker) {
            self.parent = parent
        }
        
        func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
            let mediaItems = mediaItemCollection.items
            let selectedMusic = mediaItems.compactMap { $0.assetURL }.compactMap { try? URL(resolvingAliasFileAt: $0) }
            self.parent.selectedMusic.append(contentsOf: selectedMusic)
            mediaPicker.dismiss(animated: true, completion: nil)
        }
        
        func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
            mediaPicker.dismiss(animated: true, completion: nil)
        }
    }
}

