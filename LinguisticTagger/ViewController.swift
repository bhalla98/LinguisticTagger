//
//  ViewController.swift
//  LinguisticTagger
//
//  Created by siddharth bhalla on 8/29/17.
//  Copyright © 2017 sb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tagSchemes = NSLinguisticTagger.availableTagSchemes(forLanguage: "en")
        let options: NSLinguisticTagger.Options = [.joinNames, .omitWhitespace]
        let linguisticTagger = NSLinguisticTagger(tagSchemes: tagSchemes, options: Int(options.rawValue))
        
        let sentence = "I, funny Siddharth, am playing happily and friendly at school at noon. Wow!"
        
        linguisticTagger.string = sentence
        
        linguisticTagger.enumerateTags(in: NSMakeRange(0, (sentence as NSString).length), scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass, options: options) { (tag, tokenRange, _, _) in
            
            let token = (sentence as NSString).substring(with: tokenRange)
            print("\(token) -> \(tag)")
        }
    }
}


