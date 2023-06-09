//
//  MissionPedometerView.swift
//  Ssok
//
//  Created by 김민 on 2023/05/14.
//

import SwiftUI
import CoreMotion

struct MissionShakeView: View {
    @StateObject private var shakeModel = MissionShakeViewModel()
    @State var title: String
    @State var goalCount: String
    @State private var progressValue: Int = 0
    @Binding var state: Bool
    @Binding var largePearlIndex: Int
    @State var progressTintColor = Color(.orange)
    let progressColors = [Color("Progress1"), Color("Progress2"), Color("Progress3"), Color("Progress4")]
    let moreIndexes = [1, 2, 3, 4]
    
    var body: some View {
        ZStack {
            VStack {
                MissionTopView(title: "만보기",
                               description: "춤을 춰서 만보기의 횟수를 채워야 해요.")
                MissionTitleView(missionTitle: title,
                                 missionColor: Color("MissionShake"))
                .padding(.top, UIScreen.getHeight(5))
                .padding(.bottom, UIScreen.getHeight(60))
                
                ZStack {
                    ZStack {
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: UIScreen.getHeight(25),
                                                       lineCap: .round,
                                                       lineJoin: .round))
                            .foregroundColor(Color("Gray"))
                            .shadow(color: Color.black.opacity(0.25),
                                    radius: 2,
                                    x: 0,
                                    y: -2)
                        
                        Circle()
                            .trim(from: 0.0,
                                  to: goalCount == "40.0" ? CGFloat(shakeModel.stepCount/40.0) :
                                    CGFloat(shakeModel.stepCount/10.0))
                            .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(progressTintColor)
                            .rotationEffect(.degrees(270))
                            .onChange(of: shakeModel.stepCount) { percentage in
                                switch percentage {
                                case ..<(Float(goalCount)!*0.25):
                                    progressValue = 1
                                    progressTintColor = progressColors[0]
                                case (Float(goalCount)!*0.25)..<(Float(goalCount)!*0.5):
                                    progressValue = 2
                                    progressTintColor = progressColors[1]
                                case (Float(goalCount)!*0.5)..<(Float(goalCount)!*0.75):
                                    progressValue = 3
                                    progressTintColor = progressColors[2]
                                default:
                                    progressValue = 4
                                    progressTintColor = progressColors[3]
                                }
                            }
                    }
                    .padding(.horizontal, UIScreen.getWidth(41))
                    
                    VStack {
                        Text("\(shakeModel.stepCount, specifier: "%.0f")")
                            .font(Font.custom60bold()) + Text("회")
                            .font(Font.custom40bold())
                        Text("목표 진동수\n\(goalCount == "40.0" ? "40회" : "10회")")
                            .font(Font.customTitle4())
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("GoalRed"))
                    }
                }
                
                HStack {
                    ForEach(moreIndexes, id: \.self) { index in
                        Text("더")
                            .foregroundColor(progressValue >= index ? Color.black : Color("Gray"))
                    }
                }
                .font(Font.custom48bold())
                .padding(.top, UIScreen.getHeight(60))
                .padding(.bottom, UIScreen.getHeight(50))
                
                Spacer()
            }
            .navigationBarHidden(true)
            
            if String(shakeModel.stepCount) == goalCount {
                MissionCompleteView(
                    title: title,
                    background: Color("MissionShake"),
                    state: $state,
                    largePearlIndex: $largePearlIndex)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            shakeModel.startUpdate(goalCount)
        }
    }
}

struct MissionShakeView_Previews: PreviewProvider {
    static var previews: some View {
        MissionShakeView(title: "HI",
                             goalCount: "40.0",
                             state: .constant(true),
                             largePearlIndex: .constant(2))
    }
}
