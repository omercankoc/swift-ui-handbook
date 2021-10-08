//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Ömer Can Koç on 8.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(languages) { languages in
                    Section(header: Text(languages.title)){
                        ForEach(languages.languageType){ language in
                            NavigationLink(destination : DetailsView()){
                                Text(language.language)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("Languages")
                                    .font(.largeTitle))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
