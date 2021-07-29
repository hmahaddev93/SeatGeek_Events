//
//  EventDetailView.swift
//  Events Explorer
//
//  Created by Khatib H. on 7/13/21.
//

import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var userSettings: UserSettings
    let event: Event
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(event.title)
                    .font(Font(UIFont.boldSystemFont(ofSize: 24)))
                    .padding(.top, 16)
                Spacer()
                Button {
                    userSettings.favoriteOrUnfavorite(event: event)
                } label: {
                    if userSettings.isFavorite(event: event) {
                        Image.filledHeartIcon
                            .foregroundColor(.red)
                    }
                    else {
                        Image.heartIcon
                            .foregroundColor(.red)
                    }
                }
            }
            HStack {
                Spacer()
                if let imageURLString = event.performers?.first?.image {
                    ImageView(withURL: imageURLString, width: 280, height: 220)
                }
                else {
                    Image.emptyPicture
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:280, height:220)
                }
                Spacer()
            }
            
            Text(event.datetimeLocal.formatted)
                .font(Font(UIFont.boldSystemFont(ofSize: 24)))
            Text(event.venue.displayLocation)
                .font(Font(UIFont.systemFont(ofSize: 18)))
                .foregroundColor(.gray)
            Spacer()
        }
        .navigationBarTitle("Details", displayMode: .inline)
        .padding(.horizontal, 16)
    }
}
