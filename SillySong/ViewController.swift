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

    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var lyrics: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        enterName.delegate = self
        lyrics.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    @IBAction func rest(_ sender: Any) {
        enterName.text = " "
        lyrics.text = " "
        lyrics.isHidden = true
    }
    @IBAction func displayLyrics(_ sender: Any) {
        lyrics.text = lyricsForName(lyrics: bananaFanaTemplate, name: enterName.text!)
        lyrics.isHidden = false
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
