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
	@NSManaged public var isHidden: Bool

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

extension SearchResult {
	func toCDMedia(context: NSManagedObjectContext, isHidden: Bool) -> CDMedia {
		let CDMedia = CDMedia(context: context)
		CDMedia.backdropPath = self._backdrop_path
		CDMedia.name = self._name
		CDMedia.overview = self._overview
		CDMedia.posterPath = self._poster_path
		CDMedia.title = self._title
		CDMedia.voteAverage = self._vote_average ?? 0
		CDMedia.isHidden = isHidden
		return CDMedia
	}
}
