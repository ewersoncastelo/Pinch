//
//  ContentView.swift
//  Pinch
//
//  Created by Ewerson on 16/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		 NavigationView {
			 ZStack{
				 Image("magazine-front-cover")
					 .resizable()
					 .aspectRatio(contentMode: .fit)
					 .cornerRadius(10)
					 .padding()
					 .shadow(color: .black.opacity(0.4), radius: 12, x: 2, y: 2)
			 }
			 .navigationTitle("Pinch e Zoom")
			 .navigationBarTitleDisplayMode(.inline)
		 }
		 .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
