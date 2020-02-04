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
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "switch",
                            "skip_rules": [
                                {
                                    "answer": 1, "skip": [347244]
                                }
                            ]
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9877",
                    "title": "Thoughts on the 2020 Roadmap and Milestones.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9878",
                    "title": "Review of the highs and lows of 2019.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9879",
                    "title": "Overview of customer experience trends in 2020.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9880",
                    "title": "Ideas on reaching more unbanked people.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9881",
                    "title": "A short review of the Croesus iOS app.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9882",
                    "title": "Thoughts on the 2020 Roadmap and Milestones.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9883",
                    "title": "Review of the highs and lows of 2019.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9884",
                    "title": "Overview of customer experience trends in 2020.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9885",
                    "title": "Ideas on reaching more unbanked people.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9886",
                    "title": "A short review of the Croesus iOS app.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9887",
                    "title": "Thoughts on the 2020 Roadmap and Milestones.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9888",
                    "title": "Review of the highs and lows of 2019.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9889",
                    "title": "Overview of customer experience trends in 2020.",
                    "questions": [
                        {
                            "id": "347239",
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
                            "id": "347240",
                            "title": "Question 2",
                            "label": "How did you hear about Croesus?",
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which of the following financial management apps have you used before?",
                            "type": "checkbox",
                            "required": false,
                            "skip_rules": [
                                {
                                    "answer": "", "skip": [347242]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Spendee",
                                "Numbrs",
                                "CashApp",
                                "Square"
                            ]
                        },
                        {
                            "id": "347242",
                            "title": "Question 4",
                            "label": "How does Croesus compare to the app/s selected above?",
                            "type": "text"
                        },
                        {
                            "id": "347244",
                            "title": "Question 6",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 7",
                            "label": "How can we improve to serve you better?",
                            "type": "text"
                        }
                    ]
                },
                {
                    "id": "9890",
                    "title": "Ideas on reaching more unbanked people.",
                    "questions": [
                        {
                          "id": "347239",
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
                          "id": "347240",
                          "title": "Question 2",
                          "label": "How did you hear about Croesus?",
                          "required": true,
                          "type": "text"
                        },
                        {
                          "id": "347241",
                          "title": "Question 3",
                          "label": "Which of the following financial management apps have you used before?",
                          "type": "checkbox",
                          "required": false,
                          "skip_rules": [
                            {
                              "answer": "", "skip": [347242]
                            }
                          ],
                          "options": [
                            "Mint",
                            "Spendee",
                            "Numbrs",
                            "CashApp",
                            "Square"
                          ]
                        },
                        {
                          "id": "347242",
                          "title": "Question 4",
                          "label": "How does Croesus compare to the app/s selected above?",
                          "type": "text"
                        },
                        {
                          "id": "347244",
                          "title": "Question 6",
                          "label": "What issue have you had with Croesus that disappointed you?",
                          "type": "text"
                        },
                        {
                          "id": "347245",
                          "title": "Question 7",
                          "label": "How can we improve to serve you better?",
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
}