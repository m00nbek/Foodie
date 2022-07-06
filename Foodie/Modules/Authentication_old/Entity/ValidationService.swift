//
//  ValidationService.swift
//  ValidationService
//
//  Created by Oybek on 8/17/21.
//

import Foundation

struct ValidationService {
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            if results.count != 0 {
                return true
            } else {
                return false
            }
        } catch {
            fatalError("Regex error: \(error.localizedDescription)")
        }
    }
    func validate(_ validationCase: ValidationCase, for text: String) -> Bool {
        switch validationCase {
        case .email:
          return isValidEmail(text)
        case .username:
            return text.count >= 3 && text.count <= 10 && !text.contains(" ")
        case .password:
            return text.count >= 5 && text.count <= 12 && !text.contains(" ")
        case .fullName:
            return text.count >= 3 && text.count <= 12
        case .address:
            return text.count >= 5 && text.count <= 30
        case .phone:
            return text.count == 13 && !text.contains(" ")
        }
    }
}

enum ValidationCase {
    case email
    case username
    case password
    case fullName
    case address
    case phone
}
