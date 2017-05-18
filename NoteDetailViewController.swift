//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Jordan Fraughton on 5/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    // Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let text = noteTextView.text else { return }
        
        // Updating a note and adding a new note
        if let note = self.note {
            NoteController.shared.update(note: note, text: text)
        } else {
            NoteController.shared.addNewNoteWith(text: text)
        }
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // Private 
    private func updateViews() {
        guard let note = note else { return }
        noteTextView.text = note.text
    }
    
    // Properties
    @IBOutlet weak var noteTextView: UITextView!
    
    var note: Note? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }

    
}
