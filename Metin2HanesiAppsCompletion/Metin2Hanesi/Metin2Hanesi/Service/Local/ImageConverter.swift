//
//  ImageConverter.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    func load(url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage: View {
    @StateObject private var loader = ImageLoader()
    private let url: URL
    private let placeholder: Image
    
    init(url: URL, placeholder: Image = Image(ImageHelper.splashView.appIcon.rawValue)) {
        self.url = url
        self.placeholder = placeholder
    }
    
    var body: some View {
        content
            .onAppear {
                loader.load(url: url)
            }
            .onDisappear {
                loader.cancel()
            }
    }
    
    private var content: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65,
                           height: 65)
                    .padding(.vertical,5)
            } else {
                placeholder
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65,
                           height: 65)
                    .padding(.vertical,5)
            }
        }
    }
}
