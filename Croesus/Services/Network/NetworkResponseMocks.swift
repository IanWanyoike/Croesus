//
//  NetworkResponseMocks.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

struct NetworkResponseMocks {
    
    static let surveysResponse: Data = {
        let data =
        """
        {
            "surveys" : [
                {
                    "id": "9876",
                    "title": "A short review of the Croesus iOS app.",
                    "questions": [
                        {
                            "id": "3",
                            "title": "Question 3",
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["5", "6"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["4", "6"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["4", "5"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "4",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "5",
                            "title": "Question 5",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "6",
                            "title": "Question 6",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "7",
                            "title": "Question 7",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "Yes", "skip": ["8"]
                                }
                            ]
                        },
                        {
                            "id": "8",
                            "title": "Question 8",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)

        guard let surveyListJSON = data else {
            fatalError("Mock Survey List Not In Correct Format")
        }
        return surveyListJSON
    }()

    static let questionsData: Data = {
        let data =
        """
        {
            "questions": [
                    {
                        "id": "1",
                        "title": "Question 1",
                        "label": "Which city are located in?",
                        "type": "radio",
                        "options": [
                            "Nairobi",
                            "Mombasa",
                            "Kisumu"
                        ]
                    },
                    {
                        "id": "2",
                        "title": "Question 2",
                        "label": "How did you hear about Croesus?",
                        "required": true,
                        "type": "text"
                    },
                    {
                        "id": "3",
                        "title": "Question 3",
                        "label": "Which one of the following apps have you used before?",
                        "type": "radio",
                        "skip_rules": [
                            {
                                "answer": "Mint", "skip": ["5", "6"]
                            },
                            {
                                "answer": "Numbrs", "skip": ["4", "6"]
                            },
                            {
                                "answer": "CashApp", "skip": ["4", "5"]
                            }
                        ],
                        "options": [
                            "Mint",
                            "Numbrs",
                            "CashApp",
                        ]
                    },
                    {
                        "id": "4",
                        "title": "Question 4",
                        "label": "How does Croesus compare to Mint?",
                        "type": "text"
                    },
                    {
                        "id": "5",
                        "title": "Question 5",
                        "label": "How does Croesus compare to Numbrs?",
                        "type": "text"
                    },
                    {
                        "id": "6",
                        "title": "Question 6",
                        "label": "How does Croesus compare to CashApp?",
                        "type": "text"
                    },
                    {
                        "id": "7",
                        "title": "Question 7",
                        "label": "Would you recommend Croesus to a friend?",
                        "type": "radio",
                        "options": ["Yes", "No"],
                        "skip_rules": [
                            {
                                "answer": "Yes", "skip": ["8"]
                            }
                        ]
                    },
                    {
                        "id": "8",
                        "title": "Question 8",
                        "label": "What issue have you had with Croesus that disappointed you?",
                        "type": "text"
                    },
                    {
                        "id": "9",
                        "title": "Question 9",
                        "label": "How can we improve to serve you better?",
                        "type": "text"
                    }
                ]
            }
        """.data(using: .utf8)

        guard let questionListJSON = data else {
            fatalError("Mock Questions List Not In Correct Format")
        }
        return questionListJSON
    }()
}
