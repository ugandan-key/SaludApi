//
//  SaludApiWidget.swift
//  SaludApiWidget
//
//  Created by Geovany Monroy Garcia on 20/10/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct SaludApiWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Link(destination: URL(string: "saludapi://open")!) {
            HStack {
                VStack {
                    Image(systemName: "drop.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                    Text("Lavado de\nmanos")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "facemask")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                    Text("Uso de\nCubrebocas")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "person.2")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                    Text("Mantener\ndistancia")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("I.V.U.")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("G.E.P.I.")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("COVID-19")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct SaludApiWidget: Widget {
    let kind: String = "SaludApiWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            SaludApiWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }.configurationDisplayName("SaludAPI Widget")
            .description("Widget de SaludAPI")
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemMedium) {
    SaludApiWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
