//
//  ContentView.swift
//  Pinch
//
//  Created by Ewerson on 16/04/22.
//

import SwiftUI

struct ContentView: View {
	// MARK: - PROPERTY
	@State private var isAnimating: Bool = false
	@State private var imageSacale: CGFloat = 1
	@State private var imageOffset: CGSize = CGSize(width: 0, height: 0) //.zero
	
	// MARK: - BODY
    var body: some View {
		 NavigationView {
			 ZStack{
				 Image("magazine-front-cover")
					 .resizable()
					 .aspectRatio(contentMode: .fit)
					 .cornerRadius(10)
					 .padding()
					 .shadow(color: .black.opacity(0.4), radius: 12, x: 2, y: 2)
					 .opacity(isAnimating ? 1: 0)
					 .offset(x: imageOffset.width, y: imageOffset.height)
					 .scaleEffect(imageSacale)
				 // MARK: - TAP GESTURE
					 .onTapGesture(count: 2) {
						 if imageSacale == 1 {
							 withAnimation(.spring()){
								 imageSacale = 5
							 }
						 } else {
							 withAnimation(.spring()){
								 imageSacale = 1
							 }
						 }
					 }
				 // MARK: - DRAG GESTURE
					 .gesture(
							DragGesture()
								.onChanged({ value in
									withAnimation(.linear(duration: 1)){
										imageOffset = value.translation
									}
								})
					 )
			 }
			 .navigationTitle("Pinch e Zoom")
			 .navigationBarTitleDisplayMode(.inline)
			 .onAppear{
				 withAnimation(.linear(duration: 1)){
					 isAnimating = true
				 }
			 }
		 }
		 .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
