import SwiftUI

struct SearchView: View {
	@StateObject var viewModel = inject(SearchViewModel.self)
    var body: some View {
		VStack(spacing: 0) {
			NavigationStack {
				ScrollView {
					if(!viewModel.searchText.isEmpty) {
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
							})
						}
					} else {
						Color.primaryBackground.edgesIgnoringSafeArea(.all)
					}
				}
				.background(Color.primaryBackground.edgesIgnoringSafeArea(.all))
				.searchable(text: $viewModel.searchText)
				.navigationTitle("Search")
				.toolbarColorScheme(.dark, for: .navigationBar)
				.toolbarBackground(.visible, for: .navigationBar)
			}

		}
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView()
    }
}
