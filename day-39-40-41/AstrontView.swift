//
//  AstrontView.swift
//  day-39-40-41
//
//  Created by Jhon Khan on 28/07/2020.
//

import SwiftUI

struct AstrontView: View {
    let astronaut: Astronuts

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstrontView_Previews: PreviewProvider {
    static let astronauts: [Astronuts] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstrontView(astronaut: astronauts[0])
    }
}
