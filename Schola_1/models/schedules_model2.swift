//
//  schedules_model2.swift
//  Schola_1
//
//  Created by Rodrigo Sánchez Yuste on 12/4/24.
//

import Foundation

struct Class {
    let startTime: String
    let endTime: String
    let subject: String
    let teacher: String
    let room: String
}

struct Schedule {
    let day: String
    let classes: [Class]
}

struct User {
    let id: String
    let schedules: [Schedule]
}

struct BlockClass {
    let subject: String
    let teacher: String
    let room: String
}

struct BUser {
    let id: String
    let blockDictionary: [String: BlockClass]
}

struct Block {
    let letter: String
    let startTime: String
    let endTime: String
}

struct BlockDay {
    let dayName: String
    let blocks: [Block]
}

struct BlockSchedule {
    let scheduleName: String
    let days: [BlockDay]
    let vacationDays: [String]
}

let users = [
    User(
        id: "0001",
        schedules: [
            Schedule(
                day: "Day 1",
                classes: [
                    Class(startTime: "8:00", endTime: "8:55", subject: "Math", teacher: "Mr. Johnson", room: "Room 101"),
                    Class(startTime: "9:00", endTime: "9:55", subject: "History", teacher: "Ms. Smith", room: "Room 202"),
                    Class(startTime: "10:00", endTime: "10:55", subject: "English", teacher: "Mrs. Brown", room: "Room 303"),
                    Class(startTime: "11:00", endTime: "11:55", subject: "Lunch", teacher: "", room: ""),
                    Class(startTime: "12:00", endTime: "12:55", subject: "Science", teacher: "Dr. White", room: "Lab 1"),
                    Class(startTime: "13:00", endTime: "13:55", subject: "Physical Ed", teacher: "Coach Davis", room: "Gym"),
                    Class(startTime: "14:00", endTime: "14:55", subject: "Art", teacher: "Mrs. Turner", room: "Art Studio")
                ]
            )
        ]
    )
    // Add more users and their schedules as needed
]

let busers = [
    BUser(
        id: "0001",
        blockDictionary: [
            "a": BlockClass(subject: "Econ HL", teacher: "Jorge Ruel", room: "M7"),
            "b": BlockClass(subject: "Free Period or HL", teacher: "", room: ""),
            "c": BlockClass(subject: "Chemistry HL", teacher: "James Kearsley", room: "403lab")
        ]
    ),
    BUser(
        id: "2025rsanchez",
        blockDictionary: [
            "a": BlockClass(subject: "Econ HL", teacher: "Jorge Ruel", room: "M7"),
            "b": BlockClass(subject: "Free Period or HL", teacher: "", room: ""),
            "c": BlockClass(subject: "Chemistry HL", teacher: "James Kearsley", room: "403lab"),
            "d": BlockClass(subject: "Compsci HL", teacher: "Matthew Moran", room: "501lab"),
            "e": BlockClass(subject: "English SL Lang and Lit", teacher: "Sarah Waldron", room: "NC12"),
            "f": BlockClass(subject: "ESP SL Lang and Lit", teacher: "Javier Sanchez", room: "Conf564"),
            "g": BlockClass(subject: "Free Period or HL", teacher: "", room: ""),
            "h": BlockClass(subject: "Microcourse", teacher: "", room: ""),
            "i": BlockClass(subject: "Math SL AA", teacher: "Summer Long", room: "LL6")
        ]
    )
    // Add more busers as needed
]

let schedules = [
    BlockSchedule(
        scheduleName: "testschedule1",
        days: [
            BlockDay(
                dayName: "day 1",
                blocks: [
                    Block(letter: "a", startTime: "", endTime: ""),
                    Block(letter: "b", startTime: "", endTime: ""),
                    Block(letter: "c", startTime: "", endTime: ""),
                    Block(letter: "lunch", startTime: "", endTime: ""),
                    Block(letter: "d", startTime: "", endTime: ""),
                    Block(letter: "e", startTime: "", endTime: ""),
                    Block(letter: "f", startTime: "", endTime: "")
                ]
            )
        ],
        vacationDays: []
    ),
    BlockSchedule(
        scheduleName: "11grade",
        days: [
            BlockDay(
                dayName: "day 1",
                blocks: [
                    Block(letter: "a", startTime: "8:00", endTime: "8:55"),
                    Block(letter: "b", startTime: "9:00", endTime: "9:55"),
                    Block(letter: "c", startTime: "10:00", endTime: "10:55"),
                    Block(letter: "lunch", startTime: "11:00", endTime: "11:55"),
                    Block(letter: "d", startTime: "12:00", endTime: "12:55"),
                    Block(letter: "e", startTime: "13:00", endTime: "13:55"),
                    Block(letter: "f", startTime: "14:00", endTime: "14:55")
                ]
            ),
            // Add more days as needed
        ],
        vacationDays: []
    )
    // Add more schedules as needed
]

