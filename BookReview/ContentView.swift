//
//  ContentView.swift
//  BookReview
//
//  Created by A.f. Adib on 11/18/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)]) var books : FetchedResults<Book>
    
    @State private var showingAddSc = false
    
  var body: some View {
      NavigationView{
          List{
              ForEach(books) { book in
                  NavigationLink {
                     DetailView(book: book)
                  } label: {
                      HStack {
                          EmojiView(rating: book.rating)
                              .font(.largeTitle)
                          
                          VStack(alignment : .leading) {
                              Text(book.title ?? "Unknown")
                                  .font(.headline)
                              Text(book.author ?? "unknown")
                                  .foregroundColor(.secondary)
                          }
                      }
                  }
              }
              .onDelete(perform: deleteBooks)
          }
              .navigationTitle("BookReview")
              .toolbar {
                  ToolbarItem(placement: .navigationBarLeading) {
                      EditButton()
                  }
                  
                  ToolbarItem(placement: .navigationBarTrailing) {
                      Button {
                          showingAddSc.toggle()
                      } label: {
                          Label("Add Book", systemImage: "plus")
                      }
                  }
              }
              .sheet(isPresented: $showingAddSc) {
                  AddBookView()
              }
      }
    }
    
    func deleteBooks(at offsets : IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
