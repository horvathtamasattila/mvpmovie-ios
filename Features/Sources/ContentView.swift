import SwiftUI

public struct ContentView: View {
    public init() {}
    public var body: some View {
		TabView {
			SearchView()
				.tabItem {
					Label("Home", systemImage: "heart")
				}
				.toolbar(.visible, for: .tabBar)
				.toolbarBackground(Color.primaryBackground, for: .tabBar)

			Text("Search")
				.tabItem {
					Label("Account", systemImage: "magnifyingglass")
				}
		}
		.colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
