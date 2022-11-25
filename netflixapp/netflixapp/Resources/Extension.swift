//
//  Extension.swift
//  netflixapp
//
//  Created by Kholod Sultan on 01/05/1444 AH.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
