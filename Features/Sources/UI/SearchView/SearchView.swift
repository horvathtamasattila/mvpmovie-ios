import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = inject(SearchViewModel.self)
    var body: some View {
        VStack(spacing: 0) {
            NavigationStack {
                ScrollView {
                    if !viewModel.searchResults.isEmpty {
                        ForEach(viewModel.searchResults) { result in
                            NavigationLink(
                                destination: DetailView(
                                    media: result.searchResult),
                                label: {
                                    ElementView(
                                        title: result.searchResult.title,
                                        rating: result.searchResult.vote_average,
                                        description: result.searchResult.overview,
                                        posterPath: result.searchResult.poster_path
                                    )
                                    .padding(.vertical, 24)
                                    .padding(.horizontal, 16)
                                }
                            )
                        }
                    } else {
                        ZStack {
                            Color.primaryBackground.edgesIgnoringSafeArea(.all)
                            VStack(spacing: 0) {
                                Image("search_not_found")
                                    .padding(.top, UIScreen.main.bounds.height / 4)
                                Text("search_not_found_title".localized)
                                    .font(.title)
									.multilineTextAlignment(.center)
                                    .padding(.top, 16)
									.padding(.horizontal, 56)
                                Text("search_not_found_body".localized)
                                    .font(.body)
                                    .padding(.top, 24)
                            }
                            .visible(viewModel.isShowingNotFound)
                        }
                    }
                }
                .background(Color.primaryBackground.edgesIgnoringSafeArea(.all))
                .searchable(text: $viewModel.searchText)
                .navigationTitle("search_title".localized)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .colorScheme(.dark)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
