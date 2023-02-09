//
//  Menu.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-08.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var context
    let persistence = PersistenceController.shared
    @State private var searchText = ""
    
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

    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText == "" {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    
    var body: some View {
        VStack( alignment: .leading) {
            Text("Little Lemon")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            Text("Richmond")
                .font(.title2)
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            TextField("Search menu", text: $searchText)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.green, lineWidth: 0.5))
            
            NavigationStack {
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dish: [Dish]) in
                    List {
                        ForEach(dish) { dish in
                            NavigationLink {
                                DetailView()
                            } label: {
                                HStack {
                                    VStack {
                                        Text(dish.title ?? "No more")
                                        Spacer()
                                        Text(dish.price ?? "Unavailable")
                                    }
                                    Spacer()
                                    let url = URL(string: dish.image ?? "unavailable")
                                    AsyncImage(url: url) { image in image
                                            .image?.resizable()
                                    }
                                    .frame(width: 100, height: 100, alignment: .trailing)
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            getMenuData()
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
