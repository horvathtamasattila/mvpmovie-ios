import Kingfisher
import MediaClient
import SwiftUI

struct DetailView: View {
	let media: SearchResult
	@StateObject var viewModel = inject(DetailViewModel.self)
    var body: some View {
		ZStack {
			Color.primaryBackground.edgesIgnoringSafeArea(.all)
			ScrollView {
				VStack(alignment: .leading, spacing: 0) {
					KFImage(media.backdrop_path)
						.resizable()
						.frame(maxWidth: UIScreen.main.bounds.width)
						.aspectRatio(16/9, contentMode: .fit)
						.cornerRadius(radius: 16, corners: [.bottomLeft, .bottomRight])
						.padding(.bottom, 16)
						.overlay(
							VStack {
								Spacer()
								HStack {
									Spacer()
									RatingView(rating: media.vote_average)
										.padding(4)
										.background(Color.primaryBackground)
										.cornerRadius(8)
										.padding(.bottom, 24)
										.padding(.trailing, 16)
								}
							}
						)
					Text(media.title)
						.font(.title)
						.padding(.horizontal, 16)
						.padding(.bottom, 8)
					HStack(spacing: 16) {
						HStack(spacing: 4) {
							Image(systemName: "bookmark")
							Text("Save")
						}
						HStack(spacing: 4) {
							Image(systemName: "eye.slash")
							Text("Hide")
						}
					}
					.padding(.horizontal, 16)
					.padding(.bottom, 24)
					Text(media.overview)
						.padding(.horizontal, 16)
					Spacer()
				}
			}
		}
		.colorScheme(.dark)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(
			media: SearchResult(
				_title: "Test",
				_name: "Test",
				_overview: "Test",
				_poster_path: "/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg",
				_backdrop_path: "/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg",
				_vote_average: 5
			)
		)
    }
}
