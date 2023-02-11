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
            ScrollView {
                Section {
                    LogoView()
                }
                .padding(.top, 10)
                Section {
                    HeroView()
                        .padding(.bottom)
                }
                .background(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
                
                VStack(alignment: .center) {
                    VStack {
                        Text("First Name *")
                            .foregroundColor(.gray)
                        TextField("First name", text: $firstName)
                        
                        Text("Last Name *")
                            .foregroundColor(.gray)
                        TextField("Last name", text: $lastName)
                        
                        Text("Email *")
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                        
                        Text("Password *")
                            .foregroundColor(.gray)
                        TextField("Password", text: $password)
                    }
                    .textFieldStyle(.roundedBorder)
                    
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
            .scrollDismissesKeyboard(.immediately)
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
