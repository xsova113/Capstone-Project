//
//  LogoView.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Image("Logo")
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background(Color.white)
        }
        .padding(.bottom, 5)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
