//
//  AnimalDetail.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 09.04.2023.
//

import SwiftUI

struct AnimalDetail: View {
    
    let animal: Animal
    
    @State private var showMessangerAlert: Bool = false
    @State private var showAdoptMeAlert: Bool = false
    @State private var likeButtonPressed: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                photo
                metaInfoSection
                aboutMeSection
                quickInfoSection
                ownerInfoSection
                adoptMeButton
            }            
        }
        .padding(.top, 1)
        .navigationBarHidden(true)
    }
    
    // MARK: - Subviews
    
    var backButton: some View {
        Button { 
            presentationMode.wrappedValue.dismiss()
        } label: { 
            Image.assetImage(.leftArrow)
        }
    }
    
    var heartButton: some View {
        Button { 
            likeButtonPressed.toggle()
        } label: { 
            Image.assetImage(.heart)
                .foregroundColor(likeButtonPressed ? Color.projectRed : .white)
        }
    }
    
    var photo: some View {
        ZStack(alignment: .top) {
            PhotoView(photoURL: animal.largePhotoURL, photoSize: .large)
            
            HStack {
                backButton
                Spacer()
                heartButton
            }
            .padding()
        }
    }
    
    var metaInfoSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 18) {
                NameView(name: animal.name, fontSize: .large)
                DistanceView(distance: animal.distance)
                PublishedAtView(publishedAt: animal.publishedAtString)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 32) {
                GenderView(gender: animal.gender)
                Age_TagView(age: animal.age, tags: animal.tags)
            }
        }
        .padding(.horizontal, 24)
    }
    
    var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("About me")
                .font(.sailec(.medium, size: 16))
            
            Text(animal.description ?? "No description")
                .font(.sailec(.light, size: 14))
                .lineSpacing(8)
        }
        .padding(.horizontal, 24)
    }
    
    var quickInfoSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Quick Info")
                .font(.sailec(.medium, size: 16))
            
            HStack {
                QuickInfoView(value: animal.age?.rawValue, parameter: .age)
                QuickInfoView(value: animal.colors?.primary, parameter: .color)
                QuickInfoView(value: animal.size?.rawValue, parameter: .weight)
            }
        }
        .padding(.horizontal, 24)
    }
    
    var ownerInfoSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Owner Info")
                .font(.sailec(.medium, size: 16))
            
            HStack(spacing: 16) {
                // 1
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                // 2
                VStack(alignment: .leading, spacing: 16) {
                    Text("First/Last Name")
                        .font(.sailec(.medium, size: 14))
                    Text("Credo for Life")
                        .font(.sailec(.light, size: 12))
                }
                // 3
                Spacer()
                Button {
                    showMessangerAlert.toggle()
                } label: { 
                    Image.assetImage(.messangerButton)
                }
                .padding(.trailing)
                .alert(isPresented: $showMessangerAlert) { 
                    Alert(title: Text("😉"),
                          message: Text("Contact me!"), 
                          dismissButton: .default(Text("OK")))
                }
            }
        }
        .padding(.horizontal, 24)
    }
    
    var adoptMeButton: some View {
        Button { 
            showAdoptMeAlert.toggle()
        } label: { 
            Text("Adopt me")
                .foregroundColor(.white)
                .font(.sailec(.medium, size: 16))
                .frame(height: 52)
                .frame(maxWidth: .infinity)
                .background(Color.projectBlue)
                .cornerRadius(10)
        }
        .padding(.horizontal, 24)
        .alert(isPresented: $showAdoptMeAlert) { 
            Alert(title: Text("🐒"),
                  message: Text("How about adopt me?"), 
                  dismissButton: .default(Text("Sure!")))
        }
    }
}

struct AnimalDetail_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundMain
                .edgesIgnoringSafeArea(.all)
            AnimalDetail(animal: Animal.mockAnimals.first!)                
        }
        .foregroundColor(.text)
    }
}
