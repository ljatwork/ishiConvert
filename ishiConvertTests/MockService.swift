//
//  MockService.swift
//  ishiConvertTests
//
//  Created by Leah Joy Ylaya on 7/6/22.
//
@testable import ishiConvert
import Combine
import Foundation

final class MockService: ConvertServiceProvider {
    var fetchLatestResult: AnyPublisher<Latest, NetworkError>!
    func getLatest() -> AnyPublisher<Latest, NetworkError> {
        return fetchLatestResult
    }
    
    
}
