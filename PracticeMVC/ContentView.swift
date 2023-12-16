import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ItemViewModel()
    @State private var newItemTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item.title)
                    }
                }
                .listStyle(InsetGroupedListStyle())

                HStack {
                    TextField("新しいアイテム", text: $newItemTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        viewModel.addItem(title: newItemTitle)
                        newItemTitle = ""
                    }) {
                        Text("追加")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("アイテムリスト")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
