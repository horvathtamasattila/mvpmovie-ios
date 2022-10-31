import Features
import SwiftUI

@main
struct BaseProject: App {
    init() {
		//UITabBar.appearance().barTintColor = .black

        DI.initialize(assemblies: [
            AppAssembly(),
            FeaturesAssembly()
        ])
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
