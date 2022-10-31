import SwiftUI

struct SearchView: View {
	@State var viewModel = inject(SearchViewModel.self)
    var body: some View {
		VStack(spacing: 0) {
			NavigationStack {
				ScrollView {
					if(!viewModel.searchText.isEmpty) {
						ForEach(0...10, id: \.self) { _ in
							ElementView(
								title: "Spiderman",
								rating: "9.5",
								description: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
							)
							.padding(.vertical, 24)
							.padding(.horizontal, 16)
						}
					} else {
						Color.primaryBackground.edgesIgnoringSafeArea(.all)
					}
				}
				.background(Color.primaryBackground.edgesIgnoringSafeArea(.all))
				.padding(.horizontal, -2)
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
