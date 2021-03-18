//
//  MenuViewModel.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var selectedtab = "catalogue"
    @Published var drawer = false
    
    @Published var isdark = false
}


