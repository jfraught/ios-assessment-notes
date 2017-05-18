//
//  Note.swift
//  Notes
//
//  Created by Jordan Fraughton on 5/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private static let entryKey = "entry"
    
    var entry: String
    
    // Initialiezer
    init(entry: String) {
        self.entry = entry 
    }
    
    // Dictionary Representation 
    
    var dictionaryRepresentation: [String: String] {
        let noteDictionary = [Note.entryKey: self.entry]
        
        return noteDictionary
    }
    
    // Failable initializer 
    
    init?(noteDictionary: [String: String]) {
        guard let entry = noteDictionary[Note.entryKey] else {
            
            self.entry = "This is dumb"
            
            return nil
        }
        
        self.entry = entry
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    if lhs.entry != rhs.entry { return false }
    
    return true
}
