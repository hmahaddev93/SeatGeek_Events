//
//  ImageView.swift
//  
//
//  Created by Khatib H. on 5/7/21.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    private var width:CGFloat
    private var height:CGFloat

    init(withURL url:String, width:CGFloat = 80, height:CGFloat = 80) {
        self.width = width
        self.height = height
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame(width: self.width, height: self.height)
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}
