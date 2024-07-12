//
//  String+Extension.swift
//  Homework
//
//  Created by Vahagn Madoyan on 12.07.24.
//

import Foundation

extension String {
    func format(with mask: String) -> String {
        let filteredText = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        let numbers = Array(filteredText)
        var result = ""
        var index = numbers.startIndex

        for ch in mask.enumerated() {
            if ch.element == "X" {
                if let num = numbers[exist: index] {
                    result.append(num)
                } else {
                    result.append("_")
                }
                index = numbers.index(after: index)
            } else {
                result.append(ch.element)
            }
        }

        return result
    }
}
