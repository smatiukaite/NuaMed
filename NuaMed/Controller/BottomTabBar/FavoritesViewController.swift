import UIKit

class FavoritesViewController: UIViewController {
    let favoritesScreen = FavoritesView()
    private var favoritedProducts: [Product] = []
    
    struct Product{
        let itemName: String
        let safetyIndex: String
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        title = "Favorites"
        
        let tableView = favoritesScreen.productsTableView
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func loadView(){
        view = favoritesScreen
    }
    
    //When search result should be added to favorites, call this function
    func addFavoriteProduct(_ product: Product){
        favoritedProducts.append(product)
        favoritesScreen.productsTableView.reloadData()
    }
    
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = favoritedProducts[indexPath.row]
        cell.textLabel?.text = "\(product.itemName)   \(product.safetyIndex)"
        cell.textLabel?.textColor = .black
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = favoritedProducts[indexPath.row]
        print("Selected:", product.itemName)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.systemGray6
            } else {
                cell.backgroundColor = .white
            }
        }
}
