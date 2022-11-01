import Swinject
import SwinjectAutoregistration

public class FeaturesAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
		container.autoregister(ContentViewModel.self, initializer: ContentViewModel.init)
		container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
		container.autoregister(DetailViewModel.self, initializer: DetailViewModel.init)
		container.autoregister(FavoritesViewModel.self, initializer: FavoritesViewModel.init)

		container.autoregister(SearchUseCase.self, initializer: SearchUseCase.init)
		container.autoregister(MediaUseCase.self, initializer: MediaUseCase.init)

		container.autoregister(MediaRepository.self, initializer: MediaRepository.init).inObjectScope(.container)

		container.autoregister(MediaDatabaseWorker.self, initializer: MediaDatabaseWorker.init)
	}
}
