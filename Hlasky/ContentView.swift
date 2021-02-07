//
//  ContentView.swift
//  Hlasky
//
//  Created by Rastislav Bodi on 07/02/2021.
//

import SwiftUI

struct ContentView: View {

  @State private var currentLetter = DataModel.random()
  @State private var typSelection = TypHlasky.samohlaska
  @State private var podtypSelection = PodtypHlasky.none

  @State private var wrongCount = 0

  var body: some View {
    VStack {
      Text(currentLetter.znak)
        .font(.system(size: 140, weight: .bold))
      Picker("typ", selection: $typSelection) {
        Text("Samo").tag(TypHlasky.samohlaska)
        Text("Spolu").tag(TypHlasky.spoluhlaska)
        Text("Dvoj").tag(TypHlasky.dvojhlaska)
      }
      Picker("subtyp", selection: $podtypSelection) {
        if typSelection == .spoluhlaska {
          Text("Tvrda").tag(PodtypHlasky.tvrda)
          Text("Makka").tag(PodtypHlasky.makka)
          Text("Obojaka").tag(PodtypHlasky.obojaka)
        }
        if typSelection == .samohlaska {
          Text("Kratka").tag(PodtypHlasky.kratka)
          Text("Dlha").tag(PodtypHlasky.dlha)
        }
      }
      Button("Dalej", action: next)
      Text("Nespravne odpovede: \(wrongCount)")
    }.pickerStyle(SegmentedPickerStyle())
  }

  func next() {
    if currentLetter.je(typu: typSelection, podtypSelection) {
      currentLetter = DataModel.random()
    } else {
      wrongCount += 1
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
