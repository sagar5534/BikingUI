//
//  ActivityView.swift
//  BikingUI
//
//  Created by Sagar on 2021-05-14.
//

import MapKit
import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ActivityView: View {
    @State private var showPopover: Bool = false
    @State private var off = CGFloat.zero

    @ObservedObject var test = testData()

    var x = [
        CLLocation(latitude: 43.67973480328126, longitude: -79.82698370506066),
        CLLocation(latitude: 43.67972791420599, longitude: -79.82698629711327),
        CLLocation(latitude: 43.679729534382716, longitude: -79.82698371605805),
        CLLocation(latitude: 43.67974648277309, longitude: -79.82697248341128),
        CLLocation(latitude: 43.67977243294835, longitude: -79.82694888178037),
        CLLocation(latitude: 43.67981100549799, longitude: -79.82692598307393),
        CLLocation(latitude: 43.67986535889647, longitude: -79.82689907710353),
        CLLocation(latitude: 43.67990986130114, longitude: -79.82687400169291),
        CLLocation(latitude: 43.67995682196687, longitude: -79.82684386899652),
        CLLocation(latitude: 43.68001353620167, longitude: -79.82681138844676),
        CLLocation(latitude: 43.68006970725363, longitude: -79.82677909796928),
        CLLocation(latitude: 43.68008883152372, longitude: -79.8266567676174),
        CLLocation(latitude: 43.68013529572905, longitude: -79.8266293118548),
        CLLocation(latitude: 43.68016927578684, longitude: -79.82661160722273),
        CLLocation(latitude: 43.68019981478129, longitude: -79.82659569548778),
        CLLocation(latitude: 43.680229609342845, longitude: -79.82658253252612),
        CLLocation(latitude: 43.68024526803552, longitude: -79.82658534460526),
        CLLocation(latitude: 43.680229885688114, longitude: -79.82653709633404),
        CLLocation(latitude: 43.68023501901704, longitude: -79.82648667667588),
        CLLocation(latitude: 43.68022919095768, longitude: -79.82647534419146),
        CLLocation(latitude: 43.6802282542086, longitude: -79.82647352270958),
        CLLocation(latitude: 43.68022706917019, longitude: -79.82647121843634),
        CLLocation(latitude: 43.680224221278465, longitude: -79.82646568079501),
        CLLocation(latitude: 43.68020304764244, longitude: -79.82646452712886),
        CLLocation(latitude: 43.680199516119636, longitude: -79.82643984413878),
        CLLocation(latitude: 43.68019564905512, longitude: -79.82640331601141),
        CLLocation(latitude: 43.68017026779408, longitude: -79.82633493377008),
        CLLocation(latitude: 43.680126586499156, longitude: -79.8262707201247),
        CLLocation(latitude: 43.68007309452224, longitude: -79.82620336132095),
        CLLocation(latitude: 43.680015218285355, longitude: -79.82613173366865),
        CLLocation(latitude: 43.67996205792782, longitude: -79.82607001676323),
        CLLocation(latitude: 43.67990542299304, longitude: -79.826012649088),
        CLLocation(latitude: 43.67984909433713, longitude: -79.82594871434854),
        CLLocation(latitude: 43.679791663436, longitude: -79.82592445343913),
        CLLocation(latitude: 43.67971203144466, longitude: -79.82596483045015),
        CLLocation(latitude: 43.67965579375111, longitude: -79.82603311078672),
        CLLocation(latitude: 43.6795878295659, longitude: -79.82607366854566),
        CLLocation(latitude: 43.679515971128, longitude: -79.82611420779729),
        CLLocation(latitude: 43.67944047519125, longitude: -79.8261559684062),
        CLLocation(latitude: 43.67936223239095, longitude: -79.82620288922071),
        CLLocation(latitude: 43.67928424082657, longitude: -79.82624990018986),
        CLLocation(latitude: 43.67920782786226, longitude: -79.82629716435385),
        CLLocation(latitude: 43.67913297840594, longitude: -79.82634373542747),
        CLLocation(latitude: 43.67906771200908, longitude: -79.82638406852521),
        CLLocation(latitude: 43.679006144344676, longitude: -79.82642263499353),
        CLLocation(latitude: 43.67896675964998, longitude: -79.82644669309998),
        CLLocation(latitude: 43.67894599182941, longitude: -79.82645958294783),
        CLLocation(latitude: 43.67893960525955, longitude: -79.82646342752292),
        CLLocation(latitude: 43.67894106768844, longitude: -79.8264624832024),
        CLLocation(latitude: 43.67894675247103, longitude: -79.82645901593676),
        CLLocation(latitude: 43.67893580313331, longitude: -79.8264657070969),
        CLLocation(latitude: 43.678916180720385, longitude: -79.8264783162931),
        CLLocation(latitude: 43.67890217277601, longitude: -79.82648852614278),
        CLLocation(latitude: 43.678872426881306, longitude: -79.82652401471974),
        CLLocation(latitude: 43.67886103496056, longitude: -79.82652465544962),
        CLLocation(latitude: 43.678853016777694, longitude: -79.8265440616769),
        CLLocation(latitude: 43.678918071764286, longitude: -79.82673695790729),
        CLLocation(latitude: 43.678955763147684, longitude: -79.82683744244241),
        CLLocation(latitude: 43.678995062719935, longitude: -79.82694853740219),
        CLLocation(latitude: 43.67903293644175, longitude: -79.82704465304772),
        CLLocation(latitude: 43.679074321918115, longitude: -79.82712085710526),
        CLLocation(latitude: 43.67911428573998, longitude: -79.82716509733487),
        CLLocation(latitude: 43.67911881835384, longitude: -79.827213862736),
    ]

    var body: some View {
        GeometryReader { geometry in

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Image("")
                        .resizable()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height * 0.66,
                               alignment: .center)

                    ActivityDetail()
                        .frame(width: geometry.size.width,
                               height: 1000,
                               alignment: .center)
                        .cornerRadius(30)
                }
            }
            .background(
                Map_Summary(coordinates: x.map { $0.coordinate }, bottomSpacing: geometry.size.height * 0.33)
                    .edgesIgnoringSafeArea(.top)
            )
        }
    }
}

private struct ActivityDetail: View {
    @State var x = ""
    var body: some View {
            
            VStack {
                
                Capsule(style: .circular)
                    .foregroundColor(.backgroundColor)
                    .frame(width: 60, height: 6, alignment: .center)
                    .padding()
                
                GroupBox(label: Label("Trip Name", systemImage: "mappin.and.ellipse")) {
                    TextField("Monday Morning Trip", text: $x)
                        .font(.system(size: 24 * 1, weight: .bold, design: .rounded))
                        
                }
                .groupBoxStyle(InfoCardGroupBox(color: .blue))
                
                Divider()
                    .padding(.horizontal)

                GroupBox(label: Label("Details", systemImage: "rosette")) {
                    HStack {
                        Spacer()
                        InfoLabel(value: "40", unit: "km/h")
                        Spacer()

                        Divider()

                        Spacer()
                        InfoLabel(value: "40", unit: "km/h")
                        Spacer()

                        Divider()

                        Group {
                            Spacer()
                            InfoLabel(value: "40", unit: "km/h")
                            Spacer()
                        }
                    }
                    .frame(height: 70, alignment: .center)
                }
                .groupBoxStyle(InfoCardGroupBox(color: .blue))

                Divider()
                    .padding(.horizontal)
                
                Spacer()
            }
            .background(Color.white)

        
    }
}


private struct InfoCardGroupBox: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label: HStack {
            configuration.label
                .foregroundColor(color)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .lineLimit(2)

            Spacer()
        }) {
            configuration.content.padding(.top)
        }
    }
}


private struct InfoLabel: View {
    var value: String
    var unit: String

    @ScaledMetric var size: CGFloat = 1

    @ViewBuilder
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer(minLength: 0)
            Text(value)
                .font(.system(size: 24 * size, weight: .bold, design: .rounded))

            Text(" \(unit)")
                .font(.system(size: 16 * size, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
            Spacer(minLength: 0)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
