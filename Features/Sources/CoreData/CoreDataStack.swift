import CoreData

final class CoreDataStack {

	private init() {}
	static let shared = CoreDataStack()

	private(set) lazy var backgroundContext: NSManagedObjectContext = createNewBackgroundContext()

	private(set) lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "MediaDataModel")

		container.loadPersistentStores(completionHandler: { _, error in
			guard let error = error as NSError? else { return }
			fatalError("Unresolved error: \(error), \(error.userInfo)")
		})

		container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyStoreTrumpMergePolicyType)
		container.viewContext.undoManager = nil
		container.viewContext.shouldDeleteInaccessibleFaults = true
		container.viewContext.automaticallyMergesChangesFromParent = true

		return container
	}()

	private func createNewBackgroundContext() -> NSManagedObjectContext {
		let backgroundContext = persistentContainer.newBackgroundContext()
		backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
		backgroundContext.undoManager = nil
		return backgroundContext
	}
}
