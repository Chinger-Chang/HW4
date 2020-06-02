//
//  SpellRow.swift
//  HW4
//
//  Created by User15 on 2020/5/28.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct SpellRow: View {
    var spell: Spell
    var body: some View {
         HStack {
            if(spell.episode==0)
            {
                Text(episode1[spell.episodenum ].name)
                .font(Font.custom("Copperplate-Bold", size: 23))
                .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
            else if(spell.episode==1)
            {
                Text(episode2[spell.episodenum ].name)
                    .font(Font.custom("Copperplate-Bold", size: 20))
                    .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
            else if(spell.episode==2)
            {
                Text(episode3[spell.episodenum ].name)
                .font(Font.custom("Copperplate-Bold", size: 20))
                .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
            else if(spell.episode==3)
            {
                Text(episode4[spell.episodenum ].name)
                .font(Font.custom("Copperplate-Bold", size: 20))
                .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
            else if(spell.episode==4)
            {
                Text(episode5[spell.episodenum ].name)
                .font(Font.custom("Copperplate-Bold", size: 20))
                .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
            else if(spell.episode==5)
            {
                Text(episode6[spell.episodenum ].name)
                .font(Font.custom("Copperplate-Bold", size: 20))
                .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
            else if(spell.episode==6)
            {
                Text(episode7[spell.episodenum ].name)
                .font(Font.custom("Copperplate-Bold", size: 20))
                .foregroundColor(Color(red: 0/255, green: 97/255, blue: 48/255))
            }
                   Spacer()
            //Text("\(spell.difficulty) 分")
            ForEach(0..<spell.difficulty)
            { (index) in
                Image(systemName: "wand.and.stars")
                    .resizable()
                    .frame(width: 25, height:25)
                    .foregroundColor(Color(red: 0/255, green: 117/255, blue: 0/255))
            }
        }.padding(5)
    }
}

struct SpellRow_Previews: PreviewProvider {
    static var previews: some View {
        SpellRow(spell: Spell(episode: 1, difficulty: 1,episodenum: 0))
    }
}
