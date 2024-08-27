import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    var arrImage = ["collage", "collage", "collage", "collage"]
    let arrCloth = Cloth.all()
    @State private var selection: Int? = nil
    @State var show = false
    @State var isTabBarHidden = false  // State to control tab bar visibility
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Spacer()
            Button(action: {
                self.show.toggle()
                print("Tapped on notification")
            }) {
                Image(systemName: "bell")
            }
            .frame(height: 30)
            .foregroundColor(Constants.AppColor.secondaryBlack)
           
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Home")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    fileprivate func ImageSlider() -> some View {
        return PagingView(index: $index.animation(), maxIndex: self.arrImage.count - 1) {
            ForEach(self.arrImage, id: \.self) { image in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 210)
            }
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: UIScreen.main.bounds.width, height: 210)
    }
    
    fileprivate func SaleView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sale")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.bottom, -1)
                    Text("Festive Season Sale")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                        .padding(.trailing, 15)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    ForEach(self.arrCloth.filter { $0.type == "sale" }, id: \.id) { cloth in
                        ItemRow(cloth: cloth)
                            .onTapGesture {
                                hideTabBar()  // Hide tab bar on item tap
                            }
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 10)
    }
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.bottom, -1)
                    Text("You have never seen it before")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                        .padding(.trailing, 15)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    ForEach(self.arrCloth.filter { $0.type == "new" }, id: \.id) { cloth in
                        ItemRow(cloth: cloth)
                            .onTapGesture {
                                hideTabBar()  // Hide tab bar on item tap
                            }
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 10)
    }
    
    // Function to hide the tab bar
    fileprivate func hideTabBar() {
        isTabBarHidden = true
        print("Tab bar hidden")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    NavigationBarView()
                    ScrollView {
                        VStack {
                            ImageSlider()
                            SaleView()
                            TrendingView()
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                UITabBar.appearance().isHidden = isTabBarHidden
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
