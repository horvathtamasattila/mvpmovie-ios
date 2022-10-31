import Swinject
import SwinjectAutoregistration

public class FeaturesAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
		container.autoregister(FavoritesViewModel.self, initializer: FavoritesViewModel.init)
	}
}
