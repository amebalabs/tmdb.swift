import XCTest
@testable import tmdb_swift

class TMDBPeopleTests: XCTestCase {
    override func setUp() {
        TMDB.apiKey = "875d63e82430bda808931486a0123f2c"
    }
    func testPersonGetDetails() {
        let expect = expectation(description: "GET")

        TMDB.People.getDetails(287) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.name == "Brad Pitt")
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 10)
    }
}
