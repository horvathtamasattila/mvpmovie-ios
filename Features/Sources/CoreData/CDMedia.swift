import CoreData
import MediaClient

@objc(CDMedia)
public class CDMedia: NSManagedObject {
	@NSManaged public var backdropPath: String?
	@NSManaged public var name: String?
	@NSManaged public var overview: String?
	@NSManaged public var posterPath: String?
	@NSManaged public var title: String?
	@NSManaged public var voteAverage: Double

	@nonobjc public class func fetchRequest() -> NSFetchRequest<CDMedia> {
		return NSFetchRequest<CDMedia>(entityName: "CDMedia")
	}

	func toMedia() -> SearchResult {
		SearchResult(
			_title: self.title,
			_name: self.name,
			_overview: self.overview,
			_poster_path: self.posterPath,
			_backdrop_path: self.backdropPath,
			_vote_average: self.voteAverage
		)
	}
}


//func toSavedRecipe() -> SavedRecipe {
//	SavedRecipe(
//		id: self.id,
//		detail: self.detail.toRecipeItem()
//	)
//}
//}
//
//extension SavedRecipe {
//func toCDSavedRecipe(context: NSManagedObjectContext, listIndex: Int) -> CDSavedRecipe {
//	let cdSavedRecipe = CDSavedRecipe(context: context)
//	cdSavedRecipe.id = self.id
//	cdSavedRecipe.detail = self.detail.toCDRecipeItem(context: context)
//	cdSavedRecipe.listIndex = Int16(listIndex)
//	return cdSavedRecipe
//}
//}
//extension CDMedia {
//
//	@nonobjc public class func fetchRequest() -> NSFetchRequest<CDMedia> {
//		return NSFetchRequest<CDMedia>(entityName: "CDMedia")
//	}
//
//	@NSManaged public var backdropPath: String?
//	@NSManaged public var name: String?
//	@NSManaged public var overview: String?
//	@NSManaged public var posterPath: String?
//	@NSManaged public var title: String?
//	@NSManaged public var voteAverage: Double
//
//}
//
//extension CDMedia : Identifiable {
//
//}

//	func toInstruction() -> Instruction {
//		Instruction(
//			start_time: Int(self.start_time),
//			end_time: Int(self.end_time),
//			display_text: self.display_text
//		)
//	}
//}
//
//extension Instruction {
//	func toCDInstruction(context: NSManagedObjectContext, listIndex: Int) -> CDInstruction {
//		let cdInstruction = CDInstruction(context: context)
//		cdInstruction.display_text = self.display_text
//		cdInstruction.start_time = Int32(self.start_time)
//		cdInstruction.end_time = Int32(self.end_time)
//		cdInstruction.listIndex = Int16(listIndex)
//		return cdInstruction
//	}
//}
