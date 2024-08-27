import SwiftUI
import Combine

struct ProfileView: View {

    @State var selection: Int? = nil
    let arrProfile = ProfileModel.all()
    @State var show = false

    // Replacing the NavigationBarView with the one from HomeView
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Spacer()
            Button(action: {
                self.show.toggle()
                print("Tapped on notification")
            }) {
//                Image(systemName: "bell")
            }
            .frame(height: 30)
            .foregroundColor(Constants.AppColor.secondaryBlack)
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Profile")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // Use VStack to keep the navigation bar fixed at the top
                NavigationBarView()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("banner2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 15)
                            VStack(alignment: .leading) {
                                Text("Lucy")
                                    .font(.headline)
                                    .bold()
                                Text("Lucy@gmail.com")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal, 5)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        
                        VStack(spacing: 10) {
                            ForEach(self.arrProfile, id: \.id) { profile in
                                ProfileRow(profile: profile)
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                }
                Spacer()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileRow: View {

    let profile: ProfileModel

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: Constants.AppColor.shadowColor, radius: 1, x: 0.8, y: 0.8)
            VStack(alignment: .leading) {
                Text(profile.title)
                    .font(.subheadline)
                    .bold()
                    .padding(.bottom, 1)
                Text(profile.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(15)
            Spacer()
        }
    }
}
