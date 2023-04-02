////
////  test.swift
////  TOOF Audio
////
////  Created by NomoteteS on 2.04.2023.
////
//
//import SwiftUI
//import MediaPlayer
//
//struct test: View {
//    @State var mediaItems: [MPMediaItem] = []
//    @State var searchText: String = ""
//
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Search", text: $searchText)
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 4)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(8)
//                Button(action: {
//                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                    self.searchMedia()
//                }) {
//                    Text("Search")
//                }.padding(.horizontal, 8)
//            }
//            ForEach(mediaItems, id: \.self) { media in
//                Button(action: {
//                    self.playMedia(media)
//                }) {
//                    HStack {
//                        Text(media.title ?? "")
//                            .font(.headline)
//                            .foregroundColor(Color(.label))
//                        Spacer()
//                        Text(media.albumTitle ?? "")
//                            .font(.subheadline)
//                            .foregroundColor(Color(.secondaryLabel))
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        test()
//    }
//}
