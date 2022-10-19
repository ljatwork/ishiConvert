//
//  ConvertViewModel.swift
//  ishiConvert
//
//  Created by Leah Joy Ylaya on 7/6/22.
//

import Foundation

final class ConvertViewModel: ObservableObject {
    
    private let service: ConvertServiceProvider!
    
    init(service: ConvertServiceProvider = ConvertService()) {
        self.service = service
    }
}
