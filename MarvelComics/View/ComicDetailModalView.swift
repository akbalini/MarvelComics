//
//  ComicDetailModalView.swift
//  MarvelComics
//
//  Created by Akbal Juarez on 3/7/22.
//

import SwiftUI
import Kingfisher

struct ComicDetailModalView: View {
    var comic: Comic
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    KFImage(URL(string: comic.thumbnail.getUrlStringFor(imageSize: .xlarge, imageMode: .portrait)))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 225)
                            .padding()
                    Text(comic.format)
                        .font(.footnote)
                        .padding(.top,5)
                        .foregroundColor(.white)
                    
                    Text(comic.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    HStack{
                        if let publishedDate = comic.getPublishedDate() {
                            VStack{
                                Text("Date Published:")
                                    .font(.title3).bold()
                                    .foregroundColor(.white)
                                    .padding(.leading,5)
                                Text(publishedDate)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding(.leading,8)
                            }
                            
                        }
                        Spacer()
                    }
                    .padding()
                    
                    
                    Text(comic.getTextForLenguage(leng: "en-us"))
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                    
                    HStack(){
                        VStack(alignment: .leading){
                            Text("Writers:")
                                .font(.title3).bold()
                                .foregroundColor(.white)
                                .padding(.leading,5)
                                .padding(.bottom,5)
                            if let writers = comic.getCreator(withRole: .writer), writers.count > 0 {
                                
                                ForEach(writers, id: \.self){ w in
                                    Text(w)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .padding(.leading,8)
                                }
                            }
                            Spacer()
                        }
                        .frame(maxWidth:.infinity)
                        .padding(.trailing,5)
                        .padding(.top, 5)
                        VStack(alignment: .leading){
                            Text("Pencilers:")
                                .font(.title3).bold()
                                .foregroundColor(.white)
                                .padding(.leading,5)
                                .padding(.bottom,5)
                            if let pencilers = comic.getCreator(withRole: .penciler), pencilers.count > 0 {
                                
                                ForEach(pencilers ,id:\.self){ p in
                                    Text(p)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .padding(.leading,8)
                                }
                            }
                            Spacer()
                        }
                        .frame(maxWidth:.infinity)
                        .padding(.leading,5)
                        .padding(.top, 5)
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
            
            
        }
        Button("Close"){
            dismiss()
        }
        .font(.title)
        .foregroundColor(.white)
        .padding()
    }
        
        
        
}

struct ComicDetailModalView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailModalView(comic: MOCK_COMIC[0])
    }
}
