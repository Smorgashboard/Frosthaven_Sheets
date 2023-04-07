//
//  FAQS.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/18/23.
//

import Foundation

struct FAQItem {
    let question: String
    let answer: String
}

let faqs = [
    FAQItem(question: "Why did you make this app?", answer: "I am trying to allieviate some of the annoyances I've had while playing Gloomhaven and in my first couple of Frosthaven games. Things like tracking gold, xp and now all the different resources as well as having the right attack modifier deck every time."),
    FAQItem(question: "What does hiding the class names do?", answer: "It simply hides the class names until selected during character creation and while looking at the card list. It is simply to help remove some spoilers."),
    FAQItem(question: "Does the app track my modifier deck for me automatically?", answer: "Yup! By unlocking a perk on your character sheet the attack modifier deck in the Game View will automatically update."),
    FAQItem(question: "Whats Conner mode?", answer: "Its my wife's mode, it always draws a 2x. Otherwise known as Conner Shuffling."),
    FAQItem(question: "Who can I contact if I find a bug?", answer: "Support@soteriatechsolutions.com."),
    FAQItem(question: "Are my characters stored in the cloud?", answer: "No, this current iteration uses your phone's storage."),
    FAQItem(question: "Why didn't I level up in Game Mode?", answer: "Game Mode is meant to be used while playing a Scenario. Typically you only level up when you have returned to Frosthaven."),
    FAQItem(question: "Where can I find restore purchases?", answer: "In the settings view. Click the gear in the top left hand corner on the main page.")
]
