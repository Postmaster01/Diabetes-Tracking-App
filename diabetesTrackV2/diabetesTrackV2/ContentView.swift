//
//  ContentView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Spacer()
            Text("Diabetes Tracker")
                .font(.title)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
