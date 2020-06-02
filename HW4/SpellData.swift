//
//  SpellData.swift
//  HW4
//
//  Created by User15 on 2020/5/27.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import Combine

class SpellData: ObservableObject {
    var cancellable: AnyCancellable?
    @Published var spells = [Spell]()
    var number = 0
    
    init(){
        
        if let data = UserDefaults.standard.data(forKey: "spells") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Spell].self, from: data) {
                spells = decodedData
            }
        }
        
        cancellable = $spells
            .sink(receiveValue:{(value) in
                let encoder = JSONEncoder()
                if let data = try?encoder.encode(value){
                    UserDefaults.standard.set(data, forKey: "spells")
                }
            })
    }
}
