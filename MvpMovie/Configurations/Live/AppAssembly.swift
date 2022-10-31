import MediaClient
import MediaClientLive
import Swinject
import SwinjectAutoregistration

class AppAssembly: Assembly {
    func assemble(container: Container) {
		container.register(MediaClient.self, factory: { _ in .live })
	}
}
