import Foundation

struct Hlaska {
  let znak: String
  let typ: TypHlasky
  let podtyp: PodtypHlasky

  func je(typu typ: TypHlasky, _ podtyp: PodtypHlasky) -> Bool {
    if self.podtyp == .none {
      return self.typ == typ
    }
    return self.typ == typ && self.podtyp == podtyp
  }
}

enum TypHlasky {
  case samohlaska
  case spoluhlaska
  case dvojhlaska
  case none
}

enum PodtypHlasky {
  case kratka
  case dlha
  case tvrda
  case makka
  case obojaka
  case none
}
