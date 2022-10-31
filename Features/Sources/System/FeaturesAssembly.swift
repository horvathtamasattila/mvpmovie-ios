import Swinject
import SwinjectAutoregistration

public class FeaturesAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
		container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
		container.autoregister(DetailViewModel.self, initializer: DetailViewModel.init)

		container.autoregister(SearchUseCase.self, initializer: SearchUseCase.init)
	}
}
