//
//  WeatherTileView.swift
//  X
//
//  Created by AndrewStack on 2023-06-29.
//

import SwiftUI

struct WeatherTileView: View {
    @EnvironmentObject var wm: WeatherModel
    @EnvironmentObject var wp: WPService
    
    var title: String

    var body: some View {
        let cornerRadius:CGFloat = 20
        ZStack{
            Rectangle()
                .cornerRadius(cornerRadius)
                .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)))
                .frame(width:180, height: 180)
            VStack(spacing: 10){
                
                HStack{
                    Image(systemName: "sunrise.fill")
                        .padding(.trailing)
                    VStack{
                        Text(title)
                            .fontWeight(.bold)
                        Text(wm.formatDaylightHours(date: wm.sunrise))
                    }
                }
                
//                HStack{
//                    Image(systemName: "sunset.fill")
//                        .padding(.trailing)
//                    VStack{
//                        Text("Sunset")
//                            .fontWeight(.bold)
//                        Text(wm.formatDaylightHours(date: wm.sunset))
//                    }
//                }
            }
            .foregroundColor(wp.setIconColor())
            .imageScale(.large)
        }
    }
}

struct WeatherTileView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTileView(title: "Sunrise")
            .environmentObject(WeatherModel())
            .environmentObject(WPService())
    }
}
