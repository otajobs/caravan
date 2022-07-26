//
//  ViewModel.swift
//  Caravan.uz
//
//  Created by riddinuz on 7/24/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let mapCloserSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    // Show list of locations
    @Published var showLocationList: Bool = false
    @Published var showLocationDetail: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextBtnTapped() {
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could not find the current index of locations")
            return }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Restart the locations rotation
            if let firstLocation = locations.first {
                showNextLocation(location: firstLocation) }
            return }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
