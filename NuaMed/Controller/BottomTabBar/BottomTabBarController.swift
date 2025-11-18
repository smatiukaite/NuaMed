import UIKit

class BottomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        tabBar.tintColor = .systemTeal
//        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = false

        //Each tab's view controller
        let profileViewController = ProfileSideBarViewController()
        let searchViewController = SearchViewController()
        let favoritesViewController = FavoritesViewController()
        
        //Wrapping each tab's view controller into a navigation controller
        let profileNavigation = UINavigationController(rootViewController: profileViewController)
        let searchNavigation = UINavigationController(rootViewController: searchViewController)
        let favoritesNavigation = UINavigationController(rootViewController: favoritesViewController)
        
        //Tab bar icons and titles
        profileNavigation.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        searchNavigation.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.fill")
        )
        
        favoritesNavigation.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        
        //Assign each tab to the tab bar
        viewControllers = [profileNavigation, searchNavigation, favoritesNavigation]
        selectedIndex = 1 //profile = 0, search = 1, favorites = 2
    }
    
}
