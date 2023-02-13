//
//  DetailView.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import SwiftUI


struct DetailView: View {
    @Environment(\.managedObjectContext) private var context
    let persistence = PersistenceController.shared

    func getMenuData() {
        PersistenceController.shared.clear()

        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"

        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(MenuList.self, from: data) {
                        let menu = decodedData.menu
                        for menu in menu {
                            let dish = Dish(context: context)
                            dish.title = menu.title
                            dish.image = menu.image
                            dish.price = menu.price
                            dish.describ = menu.description
                        }
                        try? context.save()
                    }
                } else if error != nil {
                    print(error?.localizedDescription ?? "Error occurred")
                }
            }
            task.resume()
        }
    }

    var body: some View {

        NavigationStack {
            VStack {
                Text("Your Dish")
                    .font(.title)
                    .padding()
                FetchedObjects() { (dish: [Dish]) in

                    List(dish) { dish in
                        Text(dish.title!)
                    }
                }
            }
            .onAppear {
                getMenuData()
            }
            .padding()
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
