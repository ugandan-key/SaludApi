//
//  SaludApiWidgetBundle.swift
//  SaludApiWidget
//
//  Created by Geovany Monroy Garcia on 20/10/24.
//

import WidgetKit
import SwiftUI

@main
struct SaludApiWidgetBundle: WidgetBundle {
    var body: some Widget {
        SaludApiWidget()
        SaludApiWidgetControl()
        SaludApiWidgetLiveActivity()
    }
}
