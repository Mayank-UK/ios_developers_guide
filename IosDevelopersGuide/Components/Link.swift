//
//  Link.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 05/03/24.
//

import SwiftUI

struct Link: View {
    let title: String
    var onTap: () -> Void
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 22))
            .padding(.vertical, 16)
            .padding(.leading, 16)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(8)
            .onTapGesture {
                self.onTap()
            }

    }
}
