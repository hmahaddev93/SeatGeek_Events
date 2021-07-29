//
//
//
//  Created by Khatib H. on 5/7/21.
//

import SwiftUI

struct EventRowView: View {
    @EnvironmentObject var userSettings: UserSettings
    let event: Event
    var body: some View {
        HStack{
            ZStack {
                if let imageURLString = event.performers?.first?.image {
                    ImageView(withURL: imageURLString)
                        .cornerRadius(8)
                        .offset(x: 0, y: 0)
                }
                else {
                    Image.emptyPicture
                        .resizable()
                        .frame(width:80, height:80)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .offset(x: 0, y: 0)
                }
                if userSettings.isFavorite(event: event) {
                    Image.filledHeartIcon
                        .foregroundColor(.red)
                        .offset(x: -40, y: -40)
                }
            }
            .padding(.leading, 20)

            VStack(alignment: .leading, spacing: 8, content: {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(event.venue.displayLocation)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(event.datetimeLocal.formatted)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            })
            .padding(.vertical, 16)
            Spacer()
        }
        .background(Color.white95)
        .cornerRadius(8)
        .shadow(radius: 6)
        .padding(.horizontal, 16)
    }
}
