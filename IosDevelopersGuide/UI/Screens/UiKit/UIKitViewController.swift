//
//  UIKitViewController.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 29/08/24.
//

import UIKit
import SwiftUI

class UIKitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the UI
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "UIKit Screen"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let label2 = UILabel()
        label2.text = "Since this app is using SwiftUI-based navigation at the root, the UIKit view can't be pushed directly into the navigation stack and needs a wrapper."
        label2.textAlignment = .center
        label2.font = UIFont.systemFont(ofSize: 16)
        label2.numberOfLines = 0 // Allow label to wrap text
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Center the first label horizontally and vertically
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Position the second label below the first one
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20), // Add space between labels
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), // Optional: Add padding to the sides
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

// this wrapper is required to make UIKit view work with swiftUI easily, without it UIKit view can't be pushed into swiftUI based navigation stack
struct UIKitWrapperView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIKitViewController {
        return UIKitViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIKitViewController, context: Context) {
        // Update the UIKit view controller if needed
    }
}
