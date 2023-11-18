//
//  EmojiView.swift
//  BookReview
//
//  Created by A.f. Adib on 11/19/23.
//

import SwiftUI

struct EmojiView: View {
    
    let rating : Int16
    
    
    var body: some View {
        switch rating {
        case 1:
            return Text("1️⃣★")
        case 2:
            return Text("2️⃣★")
        case 3:
            return Text("3️⃣★")
        case 4:
            return Text("4️⃣★")
        default:
            return Text("5️⃣★")
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(rating: 3)
    }
}
