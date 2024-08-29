//
//  ExampleWidgetBundle.swift
//  ExampleWidget
//
//  Created by Mayank Upadhyay on 29/08/24.
//

import WidgetKit
import SwiftUI

@main
struct ExampleWidgetBundle: WidgetBundle {
    var body: some Widget {
        ExampleWidget()
        ExampleWidgetLiveActivity()
    }
}
