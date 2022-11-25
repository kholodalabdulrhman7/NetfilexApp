//
//  YoutubeSearchResponse.swift
//  netflixapp
//
//  Created by Kholod Sultan on 26/04/1444 AH.
//

import Foundation



struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}

