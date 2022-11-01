import SwiftUI

struct RatingView: View {
    let rating: String
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.orange)
            Text(rating)
                .foregroundColor(.orange)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: "5.0")
    }
}
