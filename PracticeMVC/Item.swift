import SwiftUI
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
}

class ItemViewModel: ObservableObject {
    @Published var items: Results<Item>

    private var realm: Realm

    init() {
        // Realm インスタンスを初期化
        realm = try! Realm()
        // データを読み込む
        items = realm.objects(Item.self)
    }

    func addItem(title: String) {
        // アイテムを追加
        let newItem = Item()
        newItem.title = title

        do {
            try realm.write {
                realm.add(newItem)
            }
        } catch {
            print("Error adding item: \(error)")
        }
    }
}
