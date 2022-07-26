//
//  LocationPreviewView.swift
//  Caravan.uz
//
//  Created by riddinuz on 7/24/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
                buttonSection
                .padding(.top, 40)
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThinMaterial)
                        .offset(y: 65))
        .cornerRadius(10)
    }
}


extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var buttonSection: some View {
        VStack(spacing: 8.0) {
            Button {
                vm.showLocationDetail = location
            } label: {
                Text("Learn more")
                    .font(.headline)
                    .frame(width: 125, height: 30, alignment: .center)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                vm.nextBtnTapped()
            } label: {
                Text("Next")
                    .font(.headline)
                    .frame(width: 125, height: 30, alignment: .center)
            }
            .buttonStyle(.bordered)
        }
    }
}




struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
            .environmentObject(LocationViewModel())
    }
}
