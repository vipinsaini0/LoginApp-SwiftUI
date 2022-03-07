//
//  ContentView.swift
//  LoginApp
//
//  Created by Vipin Saini on 07/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home().preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var index = 0
    
    var body: some View {
        GeometryReader {_ in
            ScrollView {
                VStack {
                    //Logo
                    Image("logo")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                    //Login/Signup
                    ZStack {
                            //Sign up
                        Signup(index: $index)
                            .zIndex(Double(self.index))
                            //Login View
                        Login(index: $index)
                    }
                    
                    //Divider
                    HStack(spacing: 15) {
                        Rectangle()
                            .fill(Color("Color1"))
                            .frame(height: 1)
                        
                        Text("OR")
                        
                        Rectangle()
                            .fill(Color("Color1"))
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    
                    //Social button
                    SocialButton()
                }
                .padding(.vertical)
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

//MARK: - Login
struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                
                    //Email Field
                VStack {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                    //Password Field
                VStack {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField ("Password", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                    //Forget Password
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Text("Forget Passward?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShapeRight())
            .contentShape(CShapeRight())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
                //Login Butto
            Button(action: {
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
     
    
}

//MARK: - Sign up
struct Signup: View {
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    VStack(spacing: 10) {
                        Text("Signup")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                    //Email Field
                VStack {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                    //Password Field
                VStack {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField ("Password", text: self.$pass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                    //Repassword Field
                VStack {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField ("Password", text: self.$repass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShapeLeft())
            .contentShape(CShapeLeft())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
                //Login Butto
            Button(action: {
                
            }) {
                Text("Sign up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
    
    
}


//MARK: - Social Button
struct SocialButton: View {
    
    var body: some View {
        HStack(spacing: 25) {
            
            //Apple
            Button(action: {
                
            }) {
                Image("apple")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 50, height: 50)
            }
            
            //Facebook
            Button(action: {
                
            }) {
                Image("fb")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 50, height: 50)
            }
            
            Button(action: {
                
            }) {
                Image("twitter")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 50, height: 50)
            }
        }
        .padding(.top, 30)
    }
}
