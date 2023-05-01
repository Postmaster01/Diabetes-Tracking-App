//
//  InfoView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/21/23.
//

import SwiftUI

struct InfoView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User
    
    
    var body: some View {
        
        VStack {
            Text(userVM.user.fn)
        }
        .onAppear() {
            self.userVM.getData()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InfoView(user: User())
                .environmentObject(UserViewModel())
        }
    }
}
