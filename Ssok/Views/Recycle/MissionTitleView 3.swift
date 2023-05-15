//
//  MissonTitleView.swift
//  Ssok
//
//  Created by 김민 on 2023/05/14.
//

import SwiftUI

struct MissionTitleView: View {
    
    @State var missionTitle: String
    @State var backgroundColor: Color
    @State var borderColor: Color
    
    var body: some View {
        
        Text(missionTitle)
            .font(.system(size: 20, weight: .semibold))
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(backgroundColor.cornerRadius(15))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(borderColor, lineWidth: 1.5)
            )
    }
}

struct MissionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTitleView(missionTitle: "소리 지르기 💥", backgroundColor: Color("MissionOrange"), borderColor: Color("MissionOrangeBorder"))
    }
}
