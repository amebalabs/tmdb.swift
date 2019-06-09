import UIKit
import TMDB

typealias TableDataSource = UITableViewDataSource & UITableViewDelegate

struct Pages {
    var current: Int
    let total: Int

    var nextPage: Int? {
        if current + 1 <= total {
            return current + 1
        }
        return nil
    }
}
protocol DataRetrievable {
    var dataPages: Pages? { get set }
    func retrieveData(page: UInt, completionHandler:  @escaping (Bool) -> Void)
    func retrieveNextPage(completionHandler:  @escaping (Bool) -> Void)
}

extension DataRetrievable {
    func retrieveNextPage(completionHandler:  @escaping (Bool) -> Void) {
        guard let pages = dataPages else {
            //retrieve 1st page
            retrieveData(page: 1, completionHandler: completionHandler)
            return
        }

        guard let nextPageIndex = pages.nextPage else {
            return ///??????
        }

        retrieveData(page: UInt(nextPageIndex), completionHandler: completionHandler) // TODO: fix types
    }
}

typealias ExampleDataSource = TableDataSource & DataRetrievable

enum MediaType {
    case movie
    case tv
}

protocol Media {
    var id: Int64 { get }
    var title: String { get }
    var imagePath: URL? { get }
    var overview: String { get }
    var votes: UInt { get }
    var averageVote: Double { get }
    var type: MediaType {get}
}

extension TMDB.Movies.Movie: Media {
    var imagePath: URL? {
        return posterURL()
    }
    var type: MediaType {
        return .movie
    }
}
extension TMDB.TV.TVShow: Media {
    var imagePath: URL? {
        return posterURL()
    }

    var type: MediaType {
        return .tv
    }
}

protocol ExampleDataSourceDelegate: class {
    func selectItem(item: Media)
}

class ParentDataSource: NSObject, TableDataSource {
    var items = [Media]()
    weak var delegate: ExampleDataSourceDelegate?
    weak var vc: ViewController?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemTableViewCell.self), for: indexPath) as? ItemTableViewCell else {
            fatalError()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectItem(item: items[indexPath.row])
    }
}

class MovieDataSource: ParentDataSource, DataRetrievable {
    var dataPages: Pages?

    func retrieveData(page: UInt = 1, completionHandler: @escaping (Bool) -> Void) {
        TMDB.Movies.getPopular(page: page) { [weak self] (result) in
            guard let strongSelf = self else { return }

            switch result {
            case .failure:
                completionHandler(false)
            case .success(let pagedResponse):
                strongSelf.dataPages = Pages(current: pagedResponse.page, total: pagedResponse.totalPages)
                strongSelf.items.append(contentsOf: pagedResponse.results)
                completionHandler(true)
            }
        }
    }
}

class TVShowsDataSource: ParentDataSource, DataRetrievable {
    var dataPages: Pages?

    func retrieveData(page: UInt = 1, completionHandler: @escaping (Bool) -> Void) {
        TMDB.TV.getPopular(page: page) { [weak self] (result) in
            guard let strongSelf = self else { return }

            switch result {
            case .failure:
                completionHandler(false)
            case .success(let pagedResponse):
                strongSelf.dataPages = Pages(current: pagedResponse.page, total: pagedResponse.totalPages)
                strongSelf.items.append(contentsOf: pagedResponse.results)
                completionHandler(true)
            }
        }
    }
}
