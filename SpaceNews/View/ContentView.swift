//
//  ContentView.swift
//  SpaceNews
//
//  Created by Hidayat Abisena on 06/02/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @StateObject var vm = SNViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.news, id: \.id) { news in
                    VStack {
                        AsyncImage(url: URL(string: news.imageUrl)) { image in
                            image.resizable().scaledToFill().frame(width: 350, height: 200).cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(news.title)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text(news.summary)
                                .font(.callout)
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                            
                            Link(destination: URL(string: news.url)!) {
                                Text("Visit Website")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .background {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 100, height: 20)
                                    }
                                    .padding(.top, 4)
                                    .offset(x: 14)
                            }
                            
                        } //: VSTACK

                    } //: VSTACK
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(InsetListStyle())
            .task {
                vm.fetchNews()
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
