import SwiftUI

struct CategoryListView: View {
    var body: some View {
        NavigationView {
            CategoryTableViewController()
                .navigationBarTitle("カテゴリリスト")
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView:()
    }
}
