//
//  Spell.swift
//  HW4
//
//  Created by User15 on 2020/5/27.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

struct Spell : Identifiable,Codable {
 let id = UUID()
 var episode: Int
 var difficulty: Int
 var episodenum: Int
}
