//
//  Events Explorer
//
//  Created by Khatib H. on 7/12/21.
//

import SwiftUI

struct EventsView: View {
    @StateObject var userSettings = UserSettings()
    @State private var query: String = ""
    @ObservedObject var viewModel:EventsViewModel = EventsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $query, onTextChanged: searchEvents)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(
                            viewModel.events
                                .filter{self.query.isEmpty ? true : $0.title.lowercased().contains(self.query.lowercased())},
                            id: \.id) { event in
                            NavigationLink(destination: EventDetailView(event: event).environmentObject(userSettings)) {
                                EventRowView(event: event)
                                    .environmentObject(userSettings)
                            }
                        }
                    }
                    .padding(.top, 16)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear {
                viewModel.search()
            }
        }
    }
    
    func searchEvents(for searchQuery: String) {
        if !searchQuery.isEmpty {
            viewModel.search(searchQuery)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
