//
//  Caravan_uzApp.swift
//  Caravan.uz
//
//  Created by riddinuz on 7/24/22.
//

import SwiftUI

@main
struct Caravan_uzApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
