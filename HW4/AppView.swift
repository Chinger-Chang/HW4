//
//  AppView.swift
//  HW4
//
//  Created by User15 on 2020/5/28.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

import SwiftUI

struct AppView: View {
    @ObservedObject var spellData = SpellData()
    var body: some View {
        TabView{
            SpellList(spellData: self.spellData)
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("")
            }
            ChartView(spellData: self.spellData)
            .tabItem{
                Image(systemName: "chart.pie.fill")
                Text("")
                
            }
        }
        .accentColor(Color(red: 51/255, green: 102/255, blue: 102/255))
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
