//
//  NoteController.swift
//  Notes
//
//  Created by Jordan Fraughton on 5/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    static let shared = NoteController()
    private static let noteKey = "note"
    private(set) var notes = [Note]()
    
    init() {
        loadFromPersistentStorage()
    }
    
    // Create
    func addNewNoteWith(text: String) {
        let newNote = Note(text: text)
        notes.append(newNote)
        saveToPersistentStorage()
    }
    
    // Update
    func update(note: Note, text: String) {
        note.text = text
        saveToPersistentStorage()
    }
    
    // Delete 
    func remove(note: Note) {
        if let noteIndex = notes.index(of: note) {
            let index = noteIndex as Int
            notes.remove(at: index)
        }
        saveToPersistentStorage()
    }
    
    // Data Persistence 
    private func saveToPersistentStorage() {
        // Set up the dictionary to save, map it, and save it ot UserDefaults
        let notesDictionary = notes.map { $0.dictionaryRepresentation }
        UserDefaults.standard.set(notesDictionary, forKey: NoteController.noteKey)
    }
    
    private func loadFromPersistentStorage() {
        // Dictionary from plist 
        let notesDictionaryFromUserDefaults = UserDefaults.standard.object(forKey: NoteController.noteKey) as? [[String: String]]
        
        // Unwrap it 
        if let notesDictionary = notesDictionaryFromUserDefaults {
            notes = notesDictionary.flatMap { Note(noteDictionary: $0) }
        }
    }
}
