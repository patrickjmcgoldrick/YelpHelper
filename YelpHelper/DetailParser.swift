//
//  BusinessDetailParser.swift
//  YelpHelper
//
//  Created by dirtbag on 1/2/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//

import Foundation

class DetailParser {

    func parse(data: Data, parsed: @escaping (DetailData) -> Void) {

        // create decoder
        let jsonDecoder = JSONDecoder()

        do {
            // decode json into structs
            let detailData = try jsonDecoder.decode(DetailData.self, from: data)

            parsed(detailData)

        } catch {
            print("Error Parsing SearchData from JSON: \(error.localizedDescription)")
        }

    }

}
