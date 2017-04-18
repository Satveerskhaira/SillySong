//
//  ViewController.swift
//  SillySong
//
//  Created by Satveer Singh on 11/04/17.
//  Copyright © 2017 Satveer Singh. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        lyricsView.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    @IBAction func rest(_ sender: Any) {
        nameField.text = " "
        lyricsView.text = " "
        lyricsView.isHidden = true
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text == " " {
            lyricsView.text = "Please enter name"
            lyricsView.isHidden = false
        } else{
            lyricsView.text = lyricsForName(lyrics: bananaFanaTemplate, name: nameField.text!)
            lyricsView.isHidden = false
        }
    }
}

func shortNameFromName (name : String) -> String {
    var shortName = name.lowercased()
    let vowels : [Character] = ["a","e","o","u","i"]
    for char in shortName.characters {
        if !vowels.contains(char) {
            shortName.remove(at: shortName.startIndex)
        }else {break}
    }
    if shortName == "" {
        shortName = name
    }
    return shortName
}


func lyricsForName(lyrics: String, name : String) -> String{
    let lyric = lyrics
        .replacingOccurrences(of: "<FULL_NAME>", with: name)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: name))
    return lyric
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
