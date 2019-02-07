import UIKit
import tmdb_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let moviesViewModel = MovieDataSource()
        let movieViewController = ViewController.createViewController(with: moviesViewModel)
        moviesViewModel.delegate = movieViewController
        movieViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "movie"), selectedImage: nil)

        let tvViewModel = TVShowsDataSource()
        let tvViewController = ViewController.createViewController(with: tvViewModel)
        tvViewModel.delegate = tvViewController
        tvViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        tvViewController.tabBarItem = UITabBarItem(title: "TV Shows", image: UIImage(named: "tv"), selectedImage: nil)

        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [movieViewController, tvViewController]

        window?.rootViewController = tabViewController
        window?.makeKeyAndVisible()
        return true
    }
}
