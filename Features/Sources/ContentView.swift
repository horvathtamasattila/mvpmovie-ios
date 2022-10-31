import SwiftUI

public struct ContentView: View {
    public init() {}
    public var body: some View {
		TabView {
			FavoritesView()
				.tabItem {
					Label("Home", systemImage: "heart")
				}
				.toolbar(.visible, for: .tabBar)
				.toolbarBackground(Color.gray, for: .tabBar)

			Text("Search")
				.tabItem {
					Label("Account", systemImage: "magnifyingglass")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
