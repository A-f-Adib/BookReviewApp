//
//  AddBookView.swift
//  BookReview
//
//  Created by A.f. Adib on 11/19/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 1
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    
    var body: some View {
        NavigationView{
            Form{
//              1
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Authors name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
//              2
                Section{
                    TextEditor(text: $review)
                    
                   RatingView(rating: $rating)
                    
                } header: {
                    Text("Write a review")
                }
                
//              3
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Books")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
