import Foundation
import Reachability
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var isShowingNetworkAlert: Bool
    private let reachability: Reachability?
    init() {
        reachability = try? Reachability()
        isShowingNetworkAlert = false
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            print("could not start reachability notifier")
        }
    }

    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .unavailable:
            withAnimation(.linear(duration: 0.3)) {
                isShowingNetworkAlert = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
                withAnimation(.linear(duration: 0.3)) {
                    self?.isShowingNetworkAlert = false
                }
            }
        default:
            break
        }
    }
}
