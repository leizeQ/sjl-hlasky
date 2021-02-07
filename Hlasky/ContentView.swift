//
//  ContentView.swift
//  Hlasky
//
//  Created by Rastislav Bodi on 07/02/2021.
//

import SwiftUI

struct ContentView: View {

  @State private var currentLetter = DataModel.random()
  @State private var selection = TypHlasky.samohlaska

  var body: some View {
    VStack {
      Text(currentLetter.znak)
        //.font(.system(size: 140, weight: .bold))
      Picker("typ", selection: $selection) {
        Text("Samo").tag(TypHlasky.samohlaska)
        Text("Spolu").tag(TypHlasky.spoluhlaska)
        Text("Dvoj").tag(TypHlasky.dvojhlaska)
      }
      Button("Dalej", action: next)
    }.pickerStyle(SegmentedPickerStyle())
  }

  func next() {
    currentLetter = DataModel.random()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
