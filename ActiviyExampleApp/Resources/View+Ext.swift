//
//  View+Ext.swift
//  ActiviyExampleApp
//
//  Created by User on 20/03/25.
//

import SwiftUI

extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
