//
//  MissonTitleView.swift
//  Ssok
//
//  Created by 김민 on 2023/05/14.
//

import SwiftUI

struct MissionTitleView: View {

    @State var missionTitle: String
    @State var missionColor: Color

    var body: some View {
        Text(missionTitle)
            .font(Font.custom20semibold())
            .padding(.vertical, UIScreen.getHeight(6))
            .padding(.horizontal, UIScreen.getWidth(10))
            .background(missionColor.opacity(0.35).cornerRadius(15))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(missionColor.opacity(0.71), lineWidth: 1.5)
            )
            .padding(.top, UIScreen.getHeight(10))
    }
}

struct MissionTitleView_Previews: PreviewProvider {

    static var previews: some View {
        MissionTitleView(
            missionTitle: "소리 지르기 💥",
            missionColor: Color("MissionOrange")
        )
    }
}
