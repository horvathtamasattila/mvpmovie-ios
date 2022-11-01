import SwiftUI

public struct ContentView: View {
    @StateObject var viewModel = inject(ContentViewModel.self)
    public init() {}
    public var body: some View {
        ZStack {
            TabView {
                FavoritesView()
                    .tabItem {
                        Label("tab_bar_favorites".localized, systemImage: "heart")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.primaryBackground, for: .tabBar)

                SearchView()
                    .tabItem {
                        Label("tab_bar_search".localized, systemImage: "magnifyingglass")
                    }
            }
            .colorScheme(.dark)
            .zIndex(0)
            VStack {
                Spacer.weighted(4)
                ConnectivityIssueView()
                Spacer()
            }
            .visible(viewModel.isShowingNetworkAlert)
            .zIndex(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
