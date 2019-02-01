//
//  Decoders.swift
//  PulseMia
//
//  Created by Gökhan Işıker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

public enum Decoders {
    static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
