import Kingfisher
import SwiftUI

struct ElementView: View {
	let title: String
	let rating: String
	let description: String
	let posterPath: URL?

    var body: some View {
		ZStack {
			Color.primaryBackground
			HStack(spacing: 16) {
				KFImage(posterPath)
					.placeholder { ProgressView() }
//				Rectangle()
//					.cornerRadius(16)
//					.frame(width: 95, height: 130)
				VStack(alignment: .leading, spacing: 0) {
					Text(title)
						.padding(.bottom, 4)
						.foregroundColor(.white)
					HStack(spacing: 4) {
						Image(systemName: "star.fill")
							.foregroundColor(.orange)
						Text(String(describing: rating))
							.foregroundColor(.orange)
					}
					.padding(.bottom, 8)
					Text(description)
						.lineLimit(4)
						.foregroundColor(.white)
				}
			}
		}
    }
}

struct ElementView_Previews: PreviewProvider {
    static var previews: some View {
		ElementView(
			title: "Spiderman",
			rating: "9.5",
			description: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
			posterPath: nil
		)
    }
}
