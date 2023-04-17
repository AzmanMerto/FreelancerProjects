//
//  MassageService.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 15.04.2023.
//

import Firebase
import FirebaseFirestore

class MessageService: ObservableObject {
    @Published var messages: [Message] = []

    func loadMessages() {
            // Firestore'dan mesajları yükleme işlemi gerçekleştirilir
            COLLECTION_Massage
                .order(by: "timestamp")
                .addSnapshotListener { querySnapshot, error in
                    if let error = error {
                        print("Error loading messages: \(error)")
                    } else {
                        self.messages = querySnapshot?.documents.compactMap { document in
                            try? document.data(as: Message.self)
                        } ?? []
                    }
                }
        }

    func sendMessage(_ message: Message) {
        do {
            _ = try COLLECTION_Massage.addDocument(from: message, encoder: Firestore.Encoder())
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
        self.messages.append(message)
    }
}
