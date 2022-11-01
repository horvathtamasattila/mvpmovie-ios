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
                        VStack(spacing: 0) {
                            Image("no_movie_yet")
                                .padding(.top, UIScreen.main.bounds.height / 4)
                            Text("favorites_no_movie_yet_title")
                                .font(.title)
                                .padding(.top, 16)
                            Text("favorites_no_movie_yet_body".localized)
                                .font(.body)
                                .padding(.top, 8)
                        }
                    }
                }
            }
            .background(Color.primaryBackground.edgesIgnoringSafeArea(.all))
            .navigationTitle("favorites_title".localized)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .colorScheme(.dark)
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
