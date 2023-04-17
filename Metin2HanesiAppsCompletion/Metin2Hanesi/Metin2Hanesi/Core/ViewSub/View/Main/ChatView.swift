//
//  ChatView.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 15.04.2023.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var authService = AuthService()
    @StateObject var messageService = MessageService()
    @Binding var isShowing: Bool
    @Binding var text: String
    
    var body: some View {
        GeometryReader { geo in
            Color.black.opacity(0.8).ignoresSafeArea()
            VStack {
                Spacer()
                //MARK: ChatView - Header
                HeaderForAlternativeView(isShowing: $isShowing, text: "Chat Ekranı")
                    .background(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.MetinBackground)
                            .padding(.all,-10)
                    })
                    .padding(.top)
                //MARK: ChatView - Chat Place
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        ForEach(messageService.messages) { message in
                            MessageView(message: message,
                                        currentUserId: authService.user?.uid)
                            .padding(.bottom, 5)
                        }
                    }
                    .onAppear(perform: {
                        authService.signInAnonymously()
                        messageService.loadMessages()
                    })
                   
                    .padding(.horizontal)
                }
                .frame(height: geo.size.height * 0.79)
                .background(content: {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.MetinBackground)
                        .padding(.all,-10)
                })
                .padding(.vertical)
                //MARK: ChatView - Send Massage Place
                ChatViewSendMassage(text: $text) {
                    let message = Message(text: text, userId: authService.user?.uid ?? "", timestamp: Date())
                    messageService.sendMessage(message)
                    text = ""
                    print("massage sended")
                }
                Spacer()
            }
            .frame(height: geo.size.height * 0.89)
            .padding(.all)
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.MetinBackground.ignoresSafeArea()
            ChatView(isShowing: .constant(true), text: .constant(""))
        }
    }
}


struct ChatViewSendMassage: View {
    
    @Binding var text: String
    var action : () -> ()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.MetinBackground)
            HStack {
                Text("Mesajını Yaz")
                    .opacity(text.isEmpty ? 1 : 0)
                    .overlay {
                        TextField("", text: $text)
                    }
                    .font(.caption.bold())
                    .foregroundColor(.MetinYellow)
                Spacer()
                Button {
                    action()
                } label: {
                    Text("Gönder")
                        .foregroundColor(.MetinBackground)
                        .font(.callout)
                        .fontWeight(.heavy)
                }
                .background(content: {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.MetinYellow)
                        .padding(.all,-5)
                })
                .padding(.vertical,5)
                .disabled(text.isEmpty ? true : false)
            }
            .padding(.horizontal)
        }
        .frame(height: 50)
    }
}

struct MessageView: View {
    
    var message: Message
    let currentUserId: String?
    var isCurrentUser: Bool {
        message.userId == currentUserId
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        return formatter
    }()

    
    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
            }
            VStack(alignment: isCurrentUser ? .trailing : .leading){
                Text("ID: \(message.id ?? "")")
                    .font(.caption2)
                    .foregroundColor(.gray.opacity(0.2))
                Text(message.text)
                    .padding()
                    .foregroundColor(isCurrentUser ? Color.MetinBackground : Color.MetinYellow)
                    .background(isCurrentUser ? Color.MetinYellow.opacity(0.8) : Color.MetinBlack.opacity(0.7))
                    .foregroundColor(isCurrentUser ? .white : .black)
                    .cornerRadius(10)
                Text("\(message.timestamp, formatter: dateFormatter)")
                    .font(.caption)
                    .foregroundColor(.gray.opacity(7))
            }
            if !isCurrentUser {
                Spacer()
            }
        }
    }
}

//
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MessageView(message: Message(id: "1", text: "Merhaba", userId: "123", timestamp: Date()), isCurrentUser: true)
//            MessageView(message: Message(id: "2", text: "Selam", userId: "456", timestamp: Date()), isCurrentUser: false)
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
