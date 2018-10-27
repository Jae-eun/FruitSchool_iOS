//
//  API+User.swift
//  FruitSchool
//
//  Created by Presto on 09/10/2018.
//  Copyright © 2018 YAPP. All rights reserved.
//

/*
 사용자 정보와 관련된 API
 */
extension API {
    /// 승급심사 통과시 서버의 grade값 갱신.
    ///
    /// - Parameters:
    ///   - grade: 사용자의 현재 등급
    ///   - completion: 컴플리션 핸들러
    static func requestGradeUp(_ grade: Int, completion: @escaping (GradeUpResponse?, Int?, Error?) -> Void) {
        Network.post("\(baseURL)/users/grade/\(grade)", parameters: [:], successHandler: { data, statusCode in
            do {
                let decoded = try jsonDecoder.decode(GradeUpResponse.self, from: data)
                completion(decoded, statusCode, nil)
            } catch {
                completion(nil, statusCode, error)
            }
        }, errorHandler: { error in
            completion(nil, nil, error)
        })
    }
    
    /// 사용자 정보 요청하기.
    ///
    /// - Parameter completion: 컴플리션 핸들러
    static func requestUserInfo(completion: @escaping (UserInfoResponse?, Int?, Error?) -> Void) {
        Network.get("\(baseURL)/users/mypage", successHandler: { data, statusCode in
            do {
                let decoded = try jsonDecoder.decode(UserInfoResponse.self, from: data)
                completion(decoded, statusCode, nil)
            } catch {
                completion(nil, statusCode, error)
            }
        }, errorHandler: { error in
            completion(nil, nil, error)
        })
    }
}