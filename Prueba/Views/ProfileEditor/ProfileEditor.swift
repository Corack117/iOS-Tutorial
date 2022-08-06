//
//  ProfileEditor.swift
//  Prueba
//
//  Created by Sergio Ordaz Romero on 06/08/22.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: 0, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Usuario")
                Divider()
                TextField("usernam", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Notificaciones").bold()
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Foto de estación").bold()
                Picker("Foto de estación", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Fecha programada").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
