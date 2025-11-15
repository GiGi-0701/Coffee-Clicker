//
//  Widget_ExtensionBundle.swift
//  Widget Extension
//
//  Created by Giuseppe Mancuso on 17.10.25.
//

import WidgetKit
import SwiftUI

@main
struct Widget_ExtensionBundle: WidgetBundle {
    var body: some Widget {
        Widget_Extension()
        Widget_ExtensionControl()
        BrewingActivityWidget()
    }
}
