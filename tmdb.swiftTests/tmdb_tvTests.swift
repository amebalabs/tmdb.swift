import XCTest
@testable import tmdb_swift

class TMDBTVTests: XCTestCase {
    override func setUp() {
        TMDB.apiKey = "875d63e82430bda808931486a0123f2c"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTVGetDetails() {
        let expect = expectation(description: "GET")

        TMDB.TV.getDetails(1399) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.originalTitle == "Game of Thrones")
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 10)
    }

    func testTVGetRecomendations() {
        let expect = expectation(description: "GET")

        TMDB.TV.getRecommendations(1399) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count == 20)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVGetSimilar() {
        let expect = expectation(description: "GET")

        TMDB.TV.getSimilar(1399) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count == 20)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVLatest() {
        let expect = expectation(description: "GET")

        TMDB.TV.getLatest { response in
            switch response {
            case .success:
                XCTAssert(true)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVGetAiringToday() {
        let expect = expectation(description: "GET")

        TMDB.TV.getAiringToday { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count > 0)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVGetOnAir() {
        let expect = expectation(description: "GET")

        TMDB.TV.getOnAir { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count > 0)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVGetPopular() {
        let expect = expectation(description: "GET")

        TMDB.TV.getPopular { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count > 0)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVGetToprated() {
        let expect = expectation(description: "GET")

        TMDB.TV.getTopRated { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count > 0)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }

    func testTVSeasonGetDetails() {
        let expect = expectation(description: "GET")

        TMDB.TV.getSeasonDetails(1399, season: 5) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.name == "Season 5")
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 10)
    }

    func testTVEpisodeGetDetails() {
        let expect = expectation(description: "GET")

        TMDB.TV.getEpisodeDetails(1399, season: 5, episode: 9) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.name == "The Dance of Dragons")
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
