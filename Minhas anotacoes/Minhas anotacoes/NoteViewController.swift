//
//  ViewController.swift
//  Minhas anotacoes
//
//  Created by Gilberto da Luz on 04/02/21.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var noteTextView: UITextView!
    private let keyNote = "NOTE"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNote()
    }
    private func loadNote(){
        noteTextView.text = UserDefaults.standard.string(forKey: keyNote)
    }
    
    @IBAction func salveButtonClick(_ sender: UIButton) {
        if let noteText = noteTextView.text, !noteTextView.text.isEmpty {
            UserDefaults.standard.set(noteText, forKey: keyNote)
            print("Note salve")
        }else{
            UserDefaults.standard.removeObject(forKey: keyNote)
            print("Note delete")
        }
        showMessage()
    }
    
    private func showMessage(){
        let alertViewController = UIAlertController(title: "Message", message: "Anotação salva com sucesso!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
    
}
