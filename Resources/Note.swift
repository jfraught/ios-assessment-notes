//
//  Note.swift
//  Notes
//
//  Created by Jordan Fraughton on 5/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private static let noteKey = "note"
    
    var text: String
    
    // Initialiezer
    init(text: String) {
        self.text = text
    }
    
    // Dictionary Representation 
    
    var dictionaryRepresentation: [String: String] {
        let noteDictionary = [Note.noteKey: self.text]
        
        return noteDictionary
    }
    
    // Failable initializer 
    
    init?(noteDictionary: [String: String]) {
        guard let text = noteDictionary[Note.noteKey] else {
            
            self.text = "This is dumb"
            
            return nil
        }
        
        self.text = text
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    if lhs.text != rhs.text { return false }
    
    return true
}
