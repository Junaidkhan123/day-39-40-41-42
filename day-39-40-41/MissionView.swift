//
//  MissionView.swift
//  day-39-40-41
//
//  Created by Jhon Khan on 28/07/2020.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronuts
    }
    
    let astronauts: [CrewMember]
    
    let mission: Mission
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                    .padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstrontView(astronaut: crewMember.astronaut)) {
                            HStack {
                                   Image(crewMember.astronaut.id)
                                       .resizable()
                                       .frame(width: 83, height: 60)
                                       .clipShape(Circle())
                                       .overlay(Circle().stroke(Color.primary, lineWidth: 1))

                                   VStack(alignment: .leading) {
                                       Text(crewMember.astronaut.name)
                                           .font(.headline)
                                       Text(crewMember.role)
                                           .foregroundColor(.secondary)
                                   }

                                   Spacer()
                               }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)

                }
            }
        }.navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [Astronuts]) {
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
        static let astronauts: [Astronuts] = Bundle.main.decode("astronauts.json")

        static var previews: some View {
            MissionView(mission: missions[0], astronauts: astronauts)
        }
}
