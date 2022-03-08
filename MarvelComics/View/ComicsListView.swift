//
//  ComicsListView.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import SwiftUI

struct ComicsListView: View {
    private let gridItems = [GridItem(.flexible())]
    @ObservedObject var viewModel = ComicViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems,spacing: 10){ ForEach(viewModel.comics, id: \.id){
                    comic in
                    
                    ComicCell(comic: comic,backgroundColor: Color(viewModel.backGroundColor(forFormat: comic.format)))
                        .onAppear(){
                            viewModel.loadMoreComics(currentComic: comic)
                        }
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        
                }

                }
            }

            .navigationTitle("Comics")
        }
        .navigationViewStyle(.stack)
        .background(.red)
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView()
    }
}
