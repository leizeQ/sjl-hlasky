import SwiftUI

struct HlaskyView: View {

  @State private var currentLetter = DataModel.nahodnaHlaska()
  @State private var typSelection = TypHlasky.samohlaska
  @State private var podtypSelection = PodtypHlasky.none

  @State private var wrongCount = 0

  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
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
      Text("Nespravne odpovede: \(wrongCount)")
      Button("Dalej", action: next)
        .padding(.top, 20.0)
    }.pickerStyle(SegmentedPickerStyle())
  }

  func next() {
    if currentLetter.je(typu: typSelection, podtypSelection) {
      typSelection = .none
      podtypSelection = .none
      currentLetter = DataModel.nahodnaHlaska()
    } else {
      wrongCount += 1
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    HlaskyView()
  }
}
