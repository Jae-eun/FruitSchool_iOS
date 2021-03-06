//
//  Grade.swift
//  FruitSchool
//
//  Created by Presto on 30/09/2018.
//  Copyright © 2018 YAPP. All rights reserved.
//

/*
 등급을 나타내는 열거형 모델
 현재 3단계만 있음
 */
enum Grade: Int {
    case dog = 0
    case student
    case teacher
    var expression: String {
        switch self {
        case .dog:
            return "서당개"
        case .student:
            return "학도"
        case .teacher:
            return "훈장"
        }
    }
}
