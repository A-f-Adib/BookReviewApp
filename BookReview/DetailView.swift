//
//  DetailView.swift
//  BookReview
//
//  Created by A.f. Adib on 11/19/23.
//

import SwiftUI

struct DetailView: View {
    let book : Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
    var body: some View {
        ScrollView{
            ZStack(alignment : .bottomTrailing){
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "unknown")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "no")
                .padding()
                .font(.largeTitle)
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "unknown")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role:.cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button{
                showAlert = true
            } label : {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book())
    }
}
