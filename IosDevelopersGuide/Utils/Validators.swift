//
//  Validators.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import Foundation

func textValidator(text: String?) -> String? {
    guard let text else {
        return "Input is empty"
    }

    if text.count < 3 {
        return "Input must be 3 characters"
    }

    return nil
}
