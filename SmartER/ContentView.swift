import SwiftUI

struct ContentView: View {
    @EnvironmentObject var logoutModel: LogoutModel
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0/255, green: 56/255, blue: 99/255, alpha: 1)

        //set colors for selected and unselected items
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]

        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        Group {
            if logoutModel.isLoggedIn {
                //main tabview after login
                TabView {
                    ForYouView()
                        .tabItem {
                            Label("For You", systemImage: "sparkles")
                        }
                    
                    ExploreView()
                        .tabItem {
                            Label("Explore", systemImage: "magnifyingglass")
                        }
                    //PostView()
//                        .tabItem {
//                            Label("Post", systemImage: "plus")
//                        } // buggy
                    
                    SavedView()
                        .tabItem {
                            Label("Saved", systemImage: "heart")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
            } else {
                //login screen if logged out
                NavigationStack {
                    LoginView()
                }
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(LogoutModel())
}
