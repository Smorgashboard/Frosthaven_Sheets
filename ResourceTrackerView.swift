//
//  ResourceTrackerView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/3/23.
//

import SwiftUI

struct ResourceTrackerView: View {
    
    @Binding var axenut : Int16
    @Binding var lumber : Int16
    @Binding var metal : Int16
    @Binding var hide : Int16
    @Binding var arrowvine: Int16
    @Binding var corpsecap: Int16
    @Binding var flamefruit : Int16
    @Binding var rockroot : Int16
    @Binding var snowthistle : Int16
    
    var body: some View {
        VStack{
            Text("Resources:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(CustomColor.blueish)
                .multilineTextAlignment(.center)
            Divider()
                .padding(.bottom)
            LazyHGrid(rows: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Rows@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/) {
                VStack{
                    Image("Lumber_White")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 45)
                        .clipShape(Rectangle())
                        .shadow(radius: 5)
                    Text("\(lumber)")
                    Stepper(value: $lumber) {
                    }
                }
                Divider()
                VStack{
                    Image("Metal_White")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 45)
                        .clipShape(Rectangle())
                        .shadow(radius: 5)
                        .padding(.trailing, 10)
                    Text("\(metal)")
                    Stepper(value: $metal) {
                    }
                }
                Divider()
                VStack{
                    Image("Hide_White")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 45)
                        .clipShape(Rectangle())
                        .shadow(radius: 5)
                        .padding(.trailing, 10)
                    Text("\(hide)")
                    Stepper(value: $hide) {
                    }
                }
            }
            Divider()
                .padding(.vertical)
            LazyHGrid(rows: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Rows@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/){
                VStack{
                    Image("ArrowVine_White")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 45)
                        .clipShape(Rectangle())
                        .shadow(radius: 5)
                        .padding(.trailing, 10)
                    Text("\(arrowvine)")
                    Stepper(value: $arrowvine) {
                    }
                }
                Divider()
                VStack{
                    Image("Axenut_White")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 45)
                        .clipShape(Rectangle())
                        .shadow(radius: 5)
                        .padding(.trailing, 10)
                    Text("\(axenut)")
                    Stepper(value: $axenut) {
                    }
                }
                Divider()
                VStack{
                    Image("Corpsecap_White")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 45)
                        .clipShape(Rectangle())
                        .shadow(radius: 5)
                        .padding(.trailing, 10)
                    Text("\(corpsecap)")
                    Stepper(value: $corpsecap) {
                    }
                }
            }
            Divider()
                .padding(.vertical)
            
                LazyHGrid(rows: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Rows@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/){
                    VStack{
                        Image("Flamefruit_White")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 45)
                            .clipShape(Rectangle())
                            .shadow(radius: 5)
                            .padding(.trailing, 10)
                        Text("\(flamefruit)")
                        Stepper(value: $flamefruit) {
                        }
                    }
                    Divider()
                    VStack{
                        Image("Rockroot_White")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 45)
                            .clipShape(Rectangle())
                            .shadow(radius: 5)
                            .padding(.trailing, 10)
                        Text("\(rockroot)")
                        Stepper(value: $rockroot) {
                        }
                    }
                    Divider()
                    VStack{
                        Image("Snowthistle_White")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 45)
                            .clipShape(Rectangle())
                            .shadow(radius: 5)
                            .padding(.trailing, 10)
                        Text("\(snowthistle)")
                        Stepper(value: $snowthistle) {
                        }
                    }
                }
            Divider()
                .padding(.top)
            }.preferredColorScheme(.dark)
            
    }
}
/*struct ResourceTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceTrackerView()
    }
}
*/
