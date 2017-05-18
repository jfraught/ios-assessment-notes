//
//  NoteListTableViewController.swift
//  Notes
//
//  Created by Jordan Fraughton on 5/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
  
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        let note = NoteController.shared.notes[indexPath.row]
        
        cell.textLabel?.text = note.text
        
        return cell
    }
 
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteDetail" {
            if let noteDetailViewController = segue.destination as? NoteDetailViewController, let selectedRow = tableView.indexPathForSelectedRow?.row {
                let note = NoteController.shared.notes[selectedRow]
                noteDetailViewController.note = note
            }
        }
    }
}
