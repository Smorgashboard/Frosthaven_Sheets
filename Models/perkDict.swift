//
//  perkDict.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/28/23.
//

import Foundation

var perkDict: [String : [Int : (String, Int, Int)]] = [
    
    "deathwalker" :
        [1 : ("Remove two (-1) cards", 1, 1),
        2: ("Replace one (-2) card with one (+0) card", 1, 1),
        3: ("Replace one (-1) card with one (+1) card", 3, 1),
        4: ("Replace one (+0) card with one (+1 curse) card", 3, 1),
        5: ("Add one (+2 darkness) card", 2, 1),
        6: ("Add one (stun draw again) and one (muddle draw again) card", 2, 1),
        7: ("Add two (Heal +1, target 1 ally draw again) cards", 2, 1),
        8: ("Ignore scenario effects", 1, 1),
        9: ("Whenever you long rest, you may move one (Deathwalker token) up to three hexes", 1, 1),
        10: ("Whenever you short rest, you may (consume darkness) to perform (muddle, curse range 2) as if you were occupying a hex with a (Deathwalker token)", 1, 1),
        11: ("While you are occupying a hex with a (Deathwalker Token), all attacks targeting you gain disadvantage", 1, 1)],
    "geminate" :
        [1 : ("Replace one (-2) card with a (+0) card",1,1),
         2 : ("Replace one (-1) card with one (+0 Consume Element: Generate Element) card", 3, 1),
         3 : ("Replace one (+0) card with one (+1 poison) card", 2, 1),
         4 : ("Replace one (+0) card with one (+1 wound) card", 2, 1),
         5 : ("Replace two (+0) cards with two (pierce 3 draw again) cards", 1, 1),
         6 : ("Add two (+1 push 3) cards", 1, 1),
         7 : ("Add one (2x brittle self) card", 1, 1),
         8 : ("Add one (+1 regenerate self draw again) card", 2, 1),
         9 : ("Ignore scenario effects", 1, 1),
         10 : ("Whenever you short rest you may remove one negative condition from one ally within range 3", 1, 1),
         11 : ("Once each Scenario, when you would give yourself a negative condition, prevent the condition.", 1, 1),
         12 : ("Whenever you perform an action with a lost icon, you may discard one card to recover one card from your discard pile of equal or lower level", 1, 2) ],
    "blinkblade" :
        [1 : ("Remove one (-2) card", 1, 1),
        2: ("Replace one (-1) card with one (+1) card", 2, 1),
        3: ("Replace one (-1) card with one (+0 wound) card", 2, 1),
        4: ("Replace one (+0) card with one (+1 immobilize) card", 2, 1),
        5: ("Replace one(+0) card with one Place this card in your active area. On your next attack, discard this card to add +2 draw again card", 3, 1),
        6: ("Replace two (+1) cards with two (+2) cards", 1, 1),
        7: ("Add one (-1) Gain 1 turn card", 2, 1),
        8: ("Add one (+2 regenerate self draw again) card", 2, 1),
        9: ("Whenever you short rest, you may spend one unspent item for no effect to recover a different spent item", 1, 1),
        10: ("At the start of your fist turn each scenario, you may perform move 3", 1, 1),
        11: ("Whenever you would gain immobilize prevent the condition", 1, 1)],
    "drifter": [
            1: ("Replace one (-1) card with one (+1) card", 3, 1),
            2: ("Replace one (-2) card with one (+0) card", 1, 1),
            3: ("Replace one (+1) card with two (+0) Move one of your character tokens backward one slot cards", 2, 1),
            4: ("Replace two (+0) cards with two (Pierce 3 draw again) cards", 1, 1),
            5: ("Replace two (+0) cards with two (Push 2 draw again) cards", 1, 1),
            6: ("Add one (+3) card", 1, 1),
            7: ("Add one (+2 immobilize) card", 2, 1),
            8: ("Add two (+1 heal self redraw) cards", 1, 1),
            9: ("Ignore scenario effects and add one (+1) card", 1, 1),
            10: ("Ignore item (-1) effects and add one (+1) card", 1, 1),
            11: ("Whenever you long rest, you may move one of your character tokens backward one slot", 1, 2),
            12: ("You may bring one additional (hand) item into each scenario", 1, 1),
            13: ("At the end of each scenario, you may discard up to two loot cards, except Random Item, to draw that many new loot cards", 1, 1)],
    "boneshaper": [
           1: ("Replace one (-1) card with one (+0 curse) card", 2, 1),
           2: ("Replace one (-1) card with one (+0 poison)card", 2, 1),
           3: ("Replace one (-2) card with one (+0) card", 1, 1),
           4: ("Replace one (+0) card with one (+1) Kill the attacking summon to instead add (+4)", 3, 1),
           5: ("Add three (+1 health, target Boneshaper draw again) cards", 2, 1),
           6: ("Add one (+2 leaf/dark) card", 3, 1),
           7: ("Ignore scenario effects and add two (+1) cards", 1, 1),
           8: ("Immediately before each of your rests, you may kill one of your summons to perform (bless) self", 1, 1),
           9: ("Once each scenario, when any character ally would become exhausted by suffering (damage), you may suffer 2 damage to reduce their hit point value to 1 instead", 1, 1),
           10: ("At the start of each scenario, you may play a level 1 card from your hand to perform a summon action of the card", 1, 2)
       ],
    "bannerspear": [
        1: ("Replace one (-1) card with one (shield 1 draw again) card", 3, 1),
        2: ("Replace one (+0) card with one (+1) Add +1  for each ally adjacent to the target card", 2, 1),
        3: ("Add one (+1 disarm) card", 2, 1),
        4: ("Add one (+2 push 1) card", 2, 1),
        5: ("Add two (+1 draw again) cards", 2, 1),
        6: ("Add two (+1 health self draw again) cards", 2, 1),
        7: ("Ignore item (-1) effects and remove one (-1) card", 1, 1),
        8: ("At the end of each of your long rests, grant one ally within range 3, move 2", 1, 1),
        9: ("Whenever you open a door with a move ability, add +3 move", 1, 1),
        10: ("Once each scenario, during your turn, gain 2 shield for the round", 1, 2)]

    ]
