import SwiftUI

public struct ContentView: View {
	@StateObject var viewModel = inject(ContentViewModel.self)
    public init() {}
    public var body: some View {
		ZStack {
			TabView {
				FavoritesView()
					.tabItem {
						Label("Favorites", systemImage: "heart")
					}
					.toolbar(.visible, for: .tabBar)
					.toolbarBackground(Color.primaryBackground, for: .tabBar)

				SearchView()
					.tabItem {
						Label("Search", systemImage: "magnifyingglass")
					}
			}
			.colorScheme(.dark)
			VStack {
				Spacer.weighted(4)
				ConnectivityIssueView()
				Spacer()
			}
			.visible(viewModel.isShowingNetworkAlert)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
