import Swinject
import SwinjectAutoregistration

public class FeaturesAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
		container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
	}
}
