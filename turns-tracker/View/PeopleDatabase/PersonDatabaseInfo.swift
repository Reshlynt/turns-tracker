//
//  PersonDatabaseInfo.swift
//  turns-tracker
//
//  Created by Scott Do on 4/28/26.
//

import SwiftUI

struct PersonDatabaseInfo: View {
    
    @State var person: Person
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var payRateText: String {
        numberFormatter.string(from: person.payRate as NSDecimalNumber) ?? "0.00"
    }
    
    var body: some View {
        HStack {
            if let testPic = DataToImageConverter.convertDataToImage(photoData: person.profilePictureData){
                testPic
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
            }
//            Image("cat-meme")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50)
//                .clipShape(RoundedRectangle(cornerRadius: 6))
//                .padding(.horizontal, 10)
//                .padding(.vertical, 5)
            
            VStack {
                Text(person.name)
                    .font(.headline)
                    .foregroundStyle(.blue)
                Text("PIN: " + person.pin)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Text("Pay: \(payRateText)")
                
            Spacer()
        }
    }
}

#Preview {
    let guy: Person = Person(name: "James")
    PersonDatabaseInfo(person: guy)
}
