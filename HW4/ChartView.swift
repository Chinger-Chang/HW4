//
//  ChartView.swift
//  HW4
//
//  Created by User20 on 2020/5/29.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var spellData = SpellData()
    var angles = [Angle]()
    var episodeCount: [Double] = [0,0,0,0,0,0,0]
    var episodePercentages: [Double] = [0,0,0,0,0,0,0]
     var sum: Double = 0
    var startDegree: Double = 0
    var scoreCount: [Double] = [0,0,0,0,0,0]
    @State private var chart = "圓餅圖"
    var charts = ["圓餅圖", "柱狀圖"]
    
    init (spellData: SpellData)
    {
        for index in spellData.spells{
            episodeCount[index.episode] += 1
            sum += 1
        }
        for i in 0..<7{
            episodePercentages[i] = episodeCount[i] / sum
        }
        angles = [Angle]()
        for episodePercentage in episodePercentages{
            angles.append(.degrees(startDegree))
            startDegree += 360 * episodePercentage
        }
        for index in spellData.spells{
            scoreCount[index.difficulty] += 1
        }
    }
    var body: some View {
        NavigationView{
                VStack{
                    Picker(selection: $chart, label: Text("請選擇分析圖表")) {
                         ForEach(self.charts, id: \.self) { (chart) in
                             Text(chart)
                         }
                     }
                     .labelsHidden()
                     .pickerStyle(SegmentedPickerStyle())
                     .position(x: 210, y: 0)
                     .navigationBarTitle(Text("圖表分析"))
                    if self.chart == "圓餅圖" {
                        DrawPieChart(angles: angles).padding(.top,20)
                    }
                    else if self.chart == "柱狀圖" {
                        DrawBarChart(scoreCount: scoreCount)
                            .frame(width: 400, height: 600, alignment: .bottom)
                    }
                }
                .padding(.top,20)
        }
    }
}

struct PieChart: Shape{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        Path{(path) in
            let center = CGPoint(x: rect.midX, y:rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct DrawPieChart: View {
    var angles: [Angle]
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Circle().fill(Color.red)
                    Text("EP1")
                    Circle().fill(Color.orange)
                    Text("EP2")
                    Circle().fill(Color.yellow)
                    Text("EP3")
                    Circle().fill(Color.green)
                    Text("EP4")
                }
                HStack{
                    Circle().fill(Color.blue)
                    Text("EP5")
                    Circle().fill(Color(red: 0/255, green: 76/255, blue: 153/255))
                    Text("EP6")
                    Circle().fill(Color.purple)
                    Text("EP7")
                    }
                }.padding(30)
            .frame(height: 30)
            ZStack{
                PieChart(startAngle:self.angles[6], endAngle: .zero)
                .fill(Color.purple)
                PieChart(startAngle:self.angles[5], endAngle: self.angles[6])
                    .fill(Color(red: 0/255, green: 76/255, blue: 153/255))
                PieChart(startAngle:self.angles[4], endAngle: self.angles[5])
                    .fill(Color.blue)
                PieChart(startAngle:self.angles[3], endAngle: self.angles[4])
                    .fill(Color.green)
                PieChart(startAngle:self.angles[2], endAngle: self.angles[3])
                    .fill(Color.yellow)
                PieChart(startAngle:self.angles[1], endAngle: self.angles[2])
                    .fill(Color.orange)
                PieChart(startAngle:self.angles[0], endAngle: self.angles[1])
                    .fill(Color.red)
            }
        }
        .padding(.top,-250)
    }
}

struct DrawBarChart: View {
    var scoreCount: [Double]
    var body: some View {
        HStack
        {
            ZStack
            {
                DrawLine()
                CountText().offset(x: -150)
                BarChart(scoreCount: scoreCount).offset(y:85)
            }
        }
    }
}

struct DrawLine: View
{
    var body: some View
    {
       Path{ (path) in
            path.move(to: CGPoint(x: 75, y: 150))
            path.addLine(to: CGPoint(x: 75, y: 465))
            path.addLine(to: CGPoint(x: 375, y: 465))
        }
        .stroke(Color.black, lineWidth: 2)
    }
}

struct CountText: View
{
    var body: some View
    {
        Group {
            Text("0").offset(x:10, y:170)
            Text("5").offset(x:10, y:115)
            Text("10").offset(x:10, y:65)
            Text("15").offset(x:10, y:15)
            Text("20").offset(x:10, y:-35)
            Text("25").offset(x:10, y:-85)
            Text("30").offset(x:10, y:-135)
        }
        .font(Font.system(size: 25))
    }
}
struct BarChart: View {
    @State private var height: [CGFloat] = [0,0,0,0,0,0]
    var scoreCount: [Double] = [0,0,0,0,0,0]
    var body: some View
    {
        HStack{
            ForEach(0..<scoreCount.count){ (index) in
                VStack{
                    Text(String(Int(self.scoreCount[index])))
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red,Color.orange,Color.yellow,Color.green,Color.blue,Color.purple]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 25, height: self.height[index])
                        .animation(.linear(duration: 1))
                        .onAppear
                        {
                            self.height[index] = CGFloat(self.scoreCount[index]) * 10
                        }
                    Text(String(index))
                        .font(Font.system(size: 25))
                    Image(systemName: "wand.and.stars")
                    .resizable()
                    .frame(width: 20, height:20)
                    .foregroundColor(Color(red: 133/255, green: 44/255, blue: 0/255))
                }
                .padding(.trailing,10)
                .offset(x:10, y: 102 + CGFloat(self.scoreCount[index] * -5))
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(spellData: SpellData())
    }
}
