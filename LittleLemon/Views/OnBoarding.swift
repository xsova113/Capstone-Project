//
//  OnBoarding.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-08.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let KEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct OnBoarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            Section {
                LogoView()
            }
            .padding()
           Section {
                HeroView()
            }
            .background(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
            
            VStack(alignment: .center) {
                VStack {
                    TextField("First name", text: $firstName)
                        .padding()
                    TextField("Last name", text: $lastName)
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                    TextField("Password", text: $password)
                        .padding()
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                
                Button {
                    if !firstName.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    }
                    if !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: KEmail)
                    }
                    
                } label: {
                    RegisterButton()
                }
                .padding()
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear(perform: {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .multilineTextAlignment(.center)
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
