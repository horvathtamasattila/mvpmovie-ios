import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = inject(FavoritesViewModel.self)
    var body: some View {
        NavigationStack {
            ScrollView {
                if !viewModel.favorites.isEmpty {
                    ForEach(viewModel.favorites, id: \.self) { result in
                        ElementView(
                            title: result.title,
                            rating: result.vote_average,
                            description: result.overview,
                            posterPath: result.poster_path
                        )
                        .padding(.vertical, 24)
                        .padding(.horizontal, 16)
                    }
                } else {
					ZStack {
						Color.primaryBackground.edgesIgnoringSafeArea(.all)
						Image("no_movie_yet")
					}
                }
            }
            .background(Color.primaryBackground.edgesIgnoringSafeArea(.all))
            .navigationTitle("favorites_title".localized)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .background(Color.primaryBackground.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.getSavedMedia()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
