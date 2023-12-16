import Foundation
import RealmSwift



class Category: UITableViewController {
    
    let realm = try! Realm()
    
    var categories = [Category]()
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = Array(realm.objects(Category.self))
        
        tableView.reloadData()
    }
    
    
    
}
