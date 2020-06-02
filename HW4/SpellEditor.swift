//
//  SpellEditor.swift
//  HW4
//
//  Created by User15 on 2020/5/27.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI
import AVFoundation

struct SpellEditor: View {
 @Environment(\.presentationMode) var presentationMode
 var spellData: SpellData
 @State private var episode = 1
 @State private var episodenum = 0
 @State private var difficulty = 1
var editSpell: Spell?
var episodes = ["EP1", "EP2", "EP3", "EP4", "EP5", "EP6", "EP7"]

 var body: some View {
    Form {
        VStack {
           Image(self.episodes[self.episode])
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width:300, height:300)
            Picker("學院",selection: self.$episode) {
                 ForEach(0 ..< episodes.count) { (index) in
                               Text(self.episodes[index])
                }}
            .pickerStyle(SegmentedPickerStyle())
           part1(episode:self.$episode,episodenum:self.$episodenum)
           part2(episode:self.$episode,episodenum:self.$episodenum)
           part3(episode:self.$episode,episodenum:self.$episodenum)
           part4(episode:self.$episode,episodenum:self.$episodenum)
        }
        Stepper(value: $difficulty, in:0...5)
        {
            Text("我認為的難易度:\(difficulty)")
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0/255, green: 94/255, blue: 255/255))
            .font(Font.custom("GillSans-Bold", size: 18))
        }
    }
     .navigationBarTitle("")
     .navigationBarItems(trailing: Button("儲存") {
        let spell = Spell(episode: self.episode,difficulty: self.difficulty, episodenum: self.episodenum)
        
        if let editSpell = self.editSpell {
            let index = self.spellData.spells.firstIndex {
                $0.id == editSpell.id
                }!
            self.spellData.spells[index] = spell
        } else {
            self.spellData.spells.insert(spell, at: 0)
        }
         
        
        self.presentationMode.wrappedValue.dismiss()
     })
        .onAppear {
        
            if let editSpell = self.editSpell {
                self.episode = editSpell.episode
                self.episodenum = editSpell.episodenum
                self.difficulty = editSpell.difficulty
            }
        }
    }
}


struct SpellEditor_Previews: PreviewProvider {
    static var previews: some View {
        SpellEditor(spellData: SpellData())
    }
}

struct part1: View {
    @Binding var episode: Int
    @Binding var episodenum: Int

    
    let episode1spell=["復復修(Reparo)","阿咯哈姆拉(Alohomora)","整整石化(Petrificus Totalus)","溫咖癲啦唯啊薩(Wingardium Leviosa)","榫頭(Locomotor Mortis)"]
     let episode2spell=["路摸思(Lumos)","去去武器走(Expelliarmus)","哩吐三卜啦(Rictusempra)","塔朗泰拉跳(Tarantallegra)","止止魔咒消(Finite Incantatem)","蛇蛇攻(Serpensortia)","阿八拉象(Aparecium)","空空遺忘(Obliviate)","吃蛞蝓(Eat Slugs)"]
    var body: some View{
        return VStack{
        if (episode==0){
            Picker("咒語",selection: self.$episodenum) {
                 ForEach(0..<episode1spell.count) { (index) in
                        Text(self.episode1spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
                Text(episode1[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode1[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }
        }
       else if (episode==1){
            Picker("咒語",selection: self.$episodenum) {
                 ForEach(0..<episode2spell.count) { (index) in
                            Text(self.episode2spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
            Text(episode2[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode2[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }

            }
        }
    }
}

struct part2: View {
    @Binding var episode: Int
    @Binding var episodenum: Int
    let episode3spell=["終極路摸思(LumosMaxima)","哇嘀哇唏(Waddiwasi)","叱叱荒唐(Riddikulus)","止止不透(Impervius)","惡作劇完成(Mischief managed)","浮浮僵屍行(Mobiliarbus):","疾疾護法現身(Expecto Patronum)","吶剋斯(Nox)"]
     let episode4spell=["吼吼燒(Incendio)","速速前(Accio)","哄哄響(Sonorus)","魔魔斃(Morsmordre)","咄咄失(Stupefy)","萎萎起(Enervate)","呼呼，前咒現(Prior Incantato)","噩噩令(Imperio)","咒咒虐(Crucio)","啊哇呾喀呾啦(AvadaKedavra)","熔熔沸(Furnunculus)","涎涎牙(Densaugeo)","吩吩綻(Diffindo)","噴噴障(Impedimenta)","啾啾縮(Reducio)","嚗嚗消(Reducto)"]
    var body: some View{
        return VStack{
        if (episode==2){
            Picker("學院",selection: self.$episodenum) {
                 ForEach(0..<episode3spell.count) { (index) in
                            Text(self.episode3spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
            Text(episode3[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode3[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }

        }
       else if (episode==3){
            Picker("學院",selection: self.$episodenum) {
                 ForEach(0..<episode4spell.count) { (index) in
                            Text(self.episode4spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
            Text(episode4[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode4[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }

            }
        }
    }
}

struct part3: View {
    @Binding var episode: Int
    @Binding var episodenum: Int
    let episode5spell=["港口現(Portus)","破破心(Legilimens)","破心護(Protego)","消消藏(Evanesco)","滅滅淨(Scourgify)","密密膠(Colloportus)","默默靜(Silencio)","打包(pack)","疾疾動箱(LocomotorTrunk)","多身咒(ProteanCharm)","倒倒吊(Levicorpus)","驅逐咒(BanishingCharm)","繩繩禁(Incarcerous)"]
     let episode6spell=["撕淌三步殺(SectumSempra)","速速癒合(VulneraSanentur)","水水噴(Aguamenti)","哆哆潔(Tergeo)","路路通(Anapneo)","嗡嗡鳴(Muffliato)","衝衝攻(Oppugno)","退退降(Liberacorpus)"]
    var body: some View{
        return VStack{
        if (episode==4){
            Picker("學院",selection: self.$episodenum) {
                 ForEach(0..<episode5spell.count) { (index) in
                            Text(self.episode5spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
            Text(episode5[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode5[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }

        }
       else if (episode==5){
            Picker("學院",selection: self.$episodenum) {
                 ForEach(0..<episode6spell.count) { (index) in
                            Text(self.episode6spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
            Text(episode6[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode6[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }

            }
        }
    }
}

struct part4: View {
    @Binding var episode: Int
    @Binding var episodenum: Int
    let episode7spell=["窟窿現(Deprimo)","洞洞鑿(Defodio)","爆爆炸(Confringo)","人人現(HomenumRevelio)","撒撒氣象(MeteolojinxRecanto)","雕像行行起(PiertotumLocomotor)","破心護(ProtegoHorribilis)","全全破心護(ProtegoTotalum)","去去麻瓜走(RepelloMuggletum)","安安除惡咒(SalvioHexia)","雙雙製(Geminio)","光光滑(Glisseo)","硬硬堅(Duro)","糊糊迷(Confundo)"]
    var body: some View{
        return VStack{
        if (episode==6){
            Picker("學院",selection: self.$episodenum) {
                 ForEach(0..<episode7spell.count) { (index) in
                            Text(self.episode7spell[index])
                }}
            .pickerStyle(WheelPickerStyle())
            Text(episode7[self.episodenum].description)
            .multilineTextAlignment(.center)
            .font(Font.custom("Copperplate-Bold", size: 25))
            .foregroundColor(Color(red: 77/255, green: 77/255, blue: 255/255))
            .padding()
            .background(Color(red: 184/255, green: 184/255, blue: 255/255))
                .cornerRadius(20)
            .onTapGesture {
                let utterance = AVSpeechUtterance(string: "\(episode7[self.episodenum].name)")
                utterance.rate = 0.3
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }
            }
        }
    }
}





