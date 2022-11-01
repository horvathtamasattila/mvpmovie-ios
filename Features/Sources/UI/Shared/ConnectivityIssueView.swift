import SwiftUI

struct ConnectivityIssueView: View {
    var body: some View {
			Rectangle()
				.frame(width: 192, height: 192)
				.foregroundColor(.white)
				.cornerRadius(16)
				.overlay(
					VStack {
						Text("Connection Lost!")
							.padding(.bottom, 32)
							.foregroundColor(.primaryBackground)
						Image(systemName: "wifi.exclamationmark")
							.resizable()
							.frame(width: 38, height: 30)
							.foregroundColor(.primaryBackground)
					}
				)
				.colorScheme(.dark)
    }
}

struct ConnectivityIssueView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectivityIssueView()
			.background(Color.primaryBackground)
    }
}
