import SwiftUI

struct TabBarVisibilityKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(true)
}

extension EnvironmentValues {
    var isTabBarHidden: Binding<Bool> {
        get { self[TabBarVisibilityKey.self] }
        set { self[TabBarVisibilityKey.self] = newValue }
    }
}

struct TabBarView: View {
    @State var selected = 0
    @State private var isTabBarHidden: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: "f9f9f9")
                .edgesIgnoringSafeArea(.all)
            
            if !isTabBarHidden {
                TabView(selection: $selected) {
                    HomeView() // Existing HomeView
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }.tag(0)
                    Shopping() // Assuming Shopping is another existing view
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Shop")
                        }.tag(1)
                    FavoriteView() // Existing FavoriteView
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Favorite")
                        }.tag(2)
                    BagView() // Existing BagView
                        .tabItem {
                            Image(systemName: "bag.fill")
                            Text("Cart")
                        }.tag(3)
                    ProfileView() // Existing ProfileView
                        .tabItem {
                            Image(systemName: "person.circle.fill")
                            Text("Profile")
                        }.tag(4)
                        
                }
                .accentColor(Color(hex: "DB3022"))
                
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .environment(\.isTabBarHidden, $isTabBarHidden)
    }
}



struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
