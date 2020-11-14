//
//  ClosetItem.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import Foundation

struct ClosetItem {
    var filename: String // Used for the image and AR model
    var name: String
    var company: String
    var favorited: Bool

    static func getSampleCloset() -> [ClosetItem] {
        return [
            .init(filename: "dress1", name: "Sleeveless dress", company: "Pendleton", favorited: false),
            .init(filename: "dress2", name: "Short pink dress", company: "Dolce Vita", favorited: false),
            .init(filename: "dress3", name: "Plain white dress", company: "Le Mystère", favorited: false),
            .init(filename: "dress4", name: "Black dress", company: "Monrow", favorited: false)
        ]
    }
}
