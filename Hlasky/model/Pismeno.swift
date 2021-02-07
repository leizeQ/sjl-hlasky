//
//  Letter.swift
//  Hlasky
//
//  Created by Rastislav Bodi on 07/02/2021.
//

import Foundation

struct Pismeno {
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
