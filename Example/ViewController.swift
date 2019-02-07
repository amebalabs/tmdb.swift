import UIKit
import tmdb_swift

class ViewController: UIViewController {

    static func createViewController(with viewModel: ExampleDataSource) -> ViewController {
        guard let VC = UIStoryboard(name: "Main", bundle: Bundle(for: ViewController.self)).instantiateInitialViewController() as? ViewController else {
            fatalError()
        }
        VC.dataSource = viewModel
        return VC
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func loadMoreTapped(_ sender: Any) {
        if !isNewDataLoading {
            isNewDataLoading = true
            activityIndicator.startAnimating()
            dataSource.retrieveNextPage { [weak self] (success) in
                guard let strongSelf = self else { return }

                strongSelf.isNewDataLoading = false
                DispatchQueue.main.async {
                    strongSelf.updateView(with: success)
                }
            }
        }
    }
    var dataSource: ExampleDataSource!
    var currentItem: Media!
    private var isNewDataLoading: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()

        dataSource.retrieveNextPage { [weak self] (success) in
            guard let strongSelf = self else { return }

            DispatchQueue.main.async {
                strongSelf.updateView(with: success)
            }
        }
    }

    func showGenericError() {
        let alertVC = UIAlertController(title: "Oops", message: "Something went wrong, Please try later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }

    func updateView(with success: Bool) {
        activityIndicator.stopAnimating()

        if success {
            tableView.reloadData()
            return
        }
        showGenericError()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue", let vc = segue.destination as? DetailsViewController {
            vc.item = currentItem
        }
    }
}

extension ViewController: ExampleDataSourceDelegate {
    func selectItem(item: Media) {
        currentItem = item
        performSegue(withIdentifier: "showDetailsSegue", sender: self)
    }
}
