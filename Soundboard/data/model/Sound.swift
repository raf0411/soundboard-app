//
//  Sound.swift
//  Soundboard
//
//  Created by Raissa Raffi Darmawan on 09/07/26.
//

import Foundation

struct Sound: Identifiable {
    let id: UUID
    var name: String
    var fileName: String
    var icon: String
    let isCustom: Bool
}
