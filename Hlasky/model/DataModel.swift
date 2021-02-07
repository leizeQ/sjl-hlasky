//
//  Model.swift
//  Hlasky
//
//  Created by Rastislav Bodi on 07/02/2021.
//

import Foundation

class DataModel {

  private static let hlasky : [Pismeno] = {
    var values : [Pismeno] = []
    for pismeno in ["h", "ch", "k", "g", "d", "t", "n", "l"] {
      values.append(Pismeno(znak: pismeno, typ: .spoluhlaska, podtyp: .tvrda))
    }
    for pismeno in ["b", "m", "p", "r", "v", "z", "s", "f"] {
      values.append(Pismeno(znak: pismeno, typ: .spoluhlaska, podtyp: .obojaka))
    }
    for pismeno in ["č", "dž", "ž", "š", "c", "dz", "j", "ď", "ť", "ň", "ľ"] {
      values.append(Pismeno(znak: pismeno, typ: .spoluhlaska, podtyp: .makka))
    }
    for pismeno in ["á", "é", "í", "ý", "ó", "ú"] {
      values.append(Pismeno(znak: pismeno, typ: .samohlaska, podtyp: .dlha))
    }
    for pismeno in ["a", "ä", "e", "i", "y", "o", "u"] {
      values.append(Pismeno(znak: pismeno, typ: .samohlaska, podtyp: .kratka))
    }
    for pismeno in ["ia", "ie", "iu", "ô"] {
      values.append(Pismeno(znak: pismeno, typ: .dvojhlaska, podtyp: .none))
    }
    return values
  }()

  static func random() -> Pismeno {
    return hlasky[Int.random(in: 0..<hlasky.count)]
  }
}
