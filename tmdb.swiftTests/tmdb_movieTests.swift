import XCTest
@testable import tmdb_swift

class TMDBMovieTests: XCTestCase {
    override func setUp() {
        TMDB.apiKey = "875d63e82430bda808931486a0123f2c"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMovieGetDetails() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getDetails(100) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.originalTitle == "Lock, Stock and Two Smoking Barrels")
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 10)
    }

    func testMovieGetReviews() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getReviews(100) { response in
            switch response {
            case .success(let dataContainer):
                XCTAssert(dataContainer.results.count == 3)
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTAssert(false)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 10)
    }

    func testMovieGetRecomendations() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getRecommendations(100) { response in
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

    func testMovieGetSimilar() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getSimilar(100) { response in
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

    func testMovieGetLists() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getLists(100) { response in
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

    func testMovieLatest() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getLatest { response in
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

    func testMovieNowPlaying() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getNowPlaying { response in
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

    func testMoviePopular() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getPopular(page: 5) { response in
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

    func testMovieTopRated() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getTopRated { response in
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

    func testMovieUpcoming() {
        let expect = expectation(description: "GET")

        TMDB.Movies.getUpcoming { response in
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

}
