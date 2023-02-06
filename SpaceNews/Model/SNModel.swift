//
//  SpaceNews.swift
//  SpaceNews
//
//  Created by Hidayat Abisena on 06/02/23.
//

import Foundation

struct SNModel: Codable {
    let id: Int
    let title: String
    let imageUrl: String
    let summary: String
    let url: String
    let newsSite: String
}
