@_private(sourceFile: "ContentView.swift") import Events_Explorer
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/zebra/Zla/Dev/Tests/ken_git_space/Events-Explorer/Events Explorer/Events Explorer/ContentView.swift", line: 20)
        AnyView(__designTimeSelection(ContentView(), "#8456.[2].[0].property.[0].[0]"))
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zebra/Zla/Dev/Tests/ken_git_space/Events-Explorer/Events Explorer/Events Explorer/ContentView.swift", line: 12)
        AnyView(__designTimeSelection(Text(__designTimeString("#8456.[1].[0].property.[0].[0].arg[0].value", fallback: "Hello, world!"))
            .padding(), "#8456.[1].[0].property.[0].[0]"))
    #sourceLocation()
    }
}

import struct Events_Explorer.ContentView
import struct Events_Explorer.ContentView_Previews