//
//  SNViewModel.swift
//  SpaceNews
//
//  Created by Hidayat Abisena on 06/02/23.
//

import Foundation

class SNViewModel: ObservableObject {
    @Published var news: [SNModel] = []
    @Published var url = "https://api.spaceflightnewsapi.net/v3/articles"
    
    func fetchNews() {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,_,error in
            guard let data = data, error == nil else { return }
            
            do {
                let news = try JSONDecoder().decode([SNModel].self, from: data)
                DispatchQueue.main.async {
                    self?.news = news
                }
            } catch {
                print(error as Any)
            }
        }
        task.resume()
    }
}
