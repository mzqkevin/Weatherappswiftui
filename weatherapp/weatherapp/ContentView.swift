import SwiftUI

struct ContentView: View {
    @State private var IsNight = true
    var body: some View {
        
        ZStack{
            backgroundcolor(topcolor: IsNight ?  .gray : .blue, bottomcolor: IsNight ? .black : .white)
            
            VStack{
                cityname(City: "Santa marta, mag")
                VStack (spacing: 8){
                    citybigicon(bigicon: IsNight ? "moon.stars.fill" : "cloud.sun.fill")
                    bigtemperature(temperature: 40)
                    
                }
                .padding(.bottom, 50)
                
                HStack(spacing: 22){
                    
                    VStack{
                        Weatherdayview(Dayofweek: "Monday",
                                       Imagename: "sun.max.fill",
                                       Temperature: 74)
                    }
                    VStack{
                        Weatherdayview(Dayofweek: "Tuesday",
                                       Imagename: "cloud.drizzle.fill",
                                       Temperature: 50)
                    }
                    VStack{
                        Weatherdayview(Dayofweek: "Wednesday",
                                       Imagename: "cloud.sun.rain.fill",
                                       Temperature: 60)
                    }
                    VStack{
                        Weatherdayview(Dayofweek: "Thursday",
                                       Imagename: "cloud.sun.fill",
                                       Temperature: 65)
                    }
                    
                }
                Spacer()
                    
                Button{
                    IsNight.toggle()
                } label: {
                    Weatherbutton(text: ("change theme"), textcolor: .blue, backgroundcolor: .white)
                }
                
                    
                }
                .padding(.bottom, 70)
            }
        }
    }



#Preview {
    ContentView()
}

//refactoring phase, stay away for now
struct backgroundcolor: View {
    var topcolor: Color
    var bottomcolor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topcolor, bottomcolor]),
                       startPoint: .topTrailing,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityname: View {
    var City: String
    var body: some View {
        Text(City)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct citybigicon: View {
    var bigicon: String
    var body: some View {
        Image(systemName: bigicon)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct bigtemperature: View {
    var temperature: Int
    var body: some View {
        Text("\(temperature)°")
            .font(.system(size: 100, weight: .medium))
            .foregroundColor(.white)
    }
    
}

struct Weatherdayview: View {
    var Dayofweek: String
    var Imagename: String
    var Temperature: Int
    
    
    var body: some View {
        
            Text(Dayofweek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: Imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(Temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
    }
}




