//
//  MissionDescriptionView.swift
//  Ssok
//
//  Created by 김민 on 2023/06/24.
//

import SwiftUI

struct MissionTypeView: View {
    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.system(size: 24, weight: .black))
            Text(description)
                .font(.system(size: 13, weight: .light))
        }}
}

struct MissionDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTypeView(title: "", description: "")
    }
}
