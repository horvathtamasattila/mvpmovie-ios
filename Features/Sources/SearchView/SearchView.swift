import SwiftUI

struct FavoritesView: View {
    var body: some View {
		ScrollView {
			ForEach(0...10, id: \.self) { _ in
				ElementView(
					title: "Spiderman",
					rating: "9.5",
					description: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
				)
				.padding(.vertical, 24)
				.padding(.horizontal, 16)
			}
		}
		.background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
		FavoritesView()
    }
}
