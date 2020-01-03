//
//  YelpSearch.swift
//  YelpHelper
//
//  Created by dirtbag on 1/2/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//

import Foundation

class YelpURLs {

    static let businessSearchEndpoint = "https://api.yelp.com/v3/businesses/search?"

    static let searchParamTerm = "term=" // waffle house
    static let searchParamLatitude = "&latitude="
    static let searchParamLongitude = "&longitude="
    static let searchParamLocation = "&location="

    static let businessDetailEndpoint = "https://api.yelp.com/v3/businesses/" // + {id}
}
