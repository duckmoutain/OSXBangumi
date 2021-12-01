//
//  Profile.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/1.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        Image("shimarin")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
