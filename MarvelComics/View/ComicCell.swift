//
//  ComicCell.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import SwiftUI
import Kingfisher


struct ComicCell: View {
    let comic: Comic
    let backgroundColor: Color
    @State private var showingDetails = false
    var body: some View {
        HStack(){
            KFImage(URL(string: comic.thumbnail.getUrlStringFor(imageSize: .small, imageMode: .portrait)))
                .resizable()
                .frame(width: 50, height: 75)
                .scaledToFit()
                .padding(.leading,5)
                VStack(alignment:.leading){
                    Text(comic.title.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(comic.format).foregroundColor(.white)
                        .font(.subheadline)
                }
                Spacer()

            }
        

        .frame(height: 90.0)
        .background(backgroundColor)
        .cornerRadius(5)
        .shadow(color: backgroundColor, radius: 5, x: 0.0, y: 0.0)
        .onTapGesture {
            showingDetails.toggle()
        }
        .sheet(isPresented: $showingDetails) {
        } content: {
            ComicDetailModalView(comic: comic)
                .background(
                    KFImage(URL(string:comic.thumbnail.getUrlStringFor(imageSize: .incredible, imageMode: .portrait)))
                        .resizable()
                        .blur(radius: 4)
                        .overlay(color: .black)
                    
                        
                )
                .edgesIgnoringSafeArea(.all)
        }

        
    }
}

struct ComicCell_Previews: PreviewProvider {
    static var previews: some View {
        ComicCell(comic: MOCK_COMIC[0],backgroundColor: .blue)
    }
}
