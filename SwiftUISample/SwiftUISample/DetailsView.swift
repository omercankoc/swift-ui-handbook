//
//  DetailsView.swift
//  SwiftUISample
//
//  Created by Ömer Can Koç on 8.10.2021.
//

import SwiftUI

struct DetailsView: View {
    
    var chosenLanguage : LanguageModel
    
    var body: some View {
        VStack {
            Image(chosenLanguage.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4, alignment: .center)
            Text(chosenLanguage.language)
                .font(.title)
                .foregroundColor(Color.black)
            Text(chosenLanguage.description)
                .font(.title3)
                .foregroundColor(Color.gray)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(chosenLanguage: swift)
    }
}
