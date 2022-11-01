import MediaClient
import XCTest

@testable import Features

final class DevelopmentTests: XCTestCase {

	var mediaUseCase: MediaUseCase!
	var viewModel: DetailViewModel!

    override func setUp() {
		mediaUseCase = TestMediaUsecase()
		viewModel = DetailViewModel(mediaUseCase: mediaUseCase)
    }

    override func tearDown() {
        viewModel = nil
    }

    func test_DetailViewOpened_UserTapsSaveButton_SaveTextChanges() {
		viewModel.saveTapped(media: .mock)
		XCTAssert(viewModel.isSaved == true)
		XCTAssert(viewModel.isHidden == false)
    }

	func test_DetailViewOpened_UserTapsSaveButtonTwice_SaveTextRemainsChangedAndSavedOnlyOnce() {
		let usecase = mediaUseCase as! TestMediaUsecase
		viewModel.saveTapped(media: .mock)
		viewModel.saveTapped(media: .mock)
		XCTAssert(viewModel.isSaved == true)
		XCTAssert(viewModel.isHidden == false)
		XCTAssert(usecase.saveCounter == 1)
		XCTAssert(usecase.hideCounter == 0)
	}

	func test_DetailViewOpened_UserTapsHideButton_SaveTextChanges() {
		viewModel.hideTapped(media: .mock)
		XCTAssert(viewModel.isHidden == true)
		XCTAssert(viewModel.isSaved == false)
	}

	func test_DetailViewOpened_UserTapsHideButtonTwice_SaveTextRemainsChangedAndHiddenOnlyOnce() {
		let usecase = mediaUseCase as! TestMediaUsecase
		viewModel.hideTapped(media: .mock)
		viewModel.hideTapped(media: .mock)
		XCTAssert(viewModel.isHidden == true)
		XCTAssert(viewModel.isSaved == false)
		XCTAssert(usecase.saveCounter == 0)
		XCTAssert(usecase.hideCounter == 1)
	}

	final class TestMediaUsecase: MediaUseCase {
		var saveCounter: Int = 0
		var hideCounter: Int = 0

		func saveMedia(media: SearchResult) {
			saveCounter += 1
		}

		func hideMedia(media: SearchResult) {
			hideCounter += 1
		}

		func getSavedMedia() -> [SearchResult] { [] }


	}
}
