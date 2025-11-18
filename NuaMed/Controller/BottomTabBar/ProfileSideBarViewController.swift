import UIKit

class ProfileSideBarViewController: UIViewController {
    let profileSideBarScreen = ProfileSideBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Profile"
    }
    
    override func loadView() {
        view = profileSideBarScreen
    }
}
