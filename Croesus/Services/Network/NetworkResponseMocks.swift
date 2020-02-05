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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 5",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 6",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 7",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "Yes", "skip": ["347244"]
                                }
                            ]
                        },
                        {
                            "id": "347244",
                            "title": "Question 8",
                            "label": "What issue have you had with Croesus that disappointed you?",
                            "type": "text"
                        },
                        {
                            "id": "347245",
                            "title": "Question 9",
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
                            "required": true,
                            "type": "text"
                        },
                        {
                            "id": "347241",
                            "title": "Question 3",
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
                            "label": "Which one of the following apps have you used before?",
                            "type": "radio",
                            "skip_rules": [
                                {
                                    "answer": "Mint", "skip": ["347272", "347262"]
                                },
                                {
                                    "answer": "Numbrs", "skip": ["347282", "347262"]
                                },
                                {
                                    "answer": "CashApp", "skip": ["347282", "347272"]
                                }
                            ],
                            "options": [
                                "Mint",
                                "Numbrs",
                                "CashApp",
                            ]
                        },
                        {
                            "id": "347282",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Mint?",
                            "type": "text"
                        },
                        {
                            "id": "347272",
                            "title": "Question 4",
                            "label": "How does Croesus compare to Numbrs?",
                            "type": "text"
                        },
                        {
                            "id": "347262",
                            "title": "Question 4",
                            "label": "How does Croesus compare to CashApp?",
                            "type": "text"
                        },
                        {
                            "id": "347243",
                            "title": "Question 5",
                            "label": "Would you recommend Croesus to a friend?",
                            "type": "radio",
                            "options": ["Yes", "No"],
                            "skip_rules": [
                                {
                                    "answer": "No", "skip": ["347244"]
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
