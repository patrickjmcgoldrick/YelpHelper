//
//  YelpSearcher.swift
//  YelpHelper
//
//  Created by dirtbag on 1/2/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//

import Foundation

public class YelpSearcher {

    var yelpAPIKey: String
    
    public init(apiKey: String) {
        yelpAPIKey = apiKey
    }
    
    /// Call Yelp API to the points of interest for the Map
    public func readPointsFromYelp(url: URL, found: @escaping ((SearchData) -> Void)) {

        let network = NetworkController()

        network.loadYelpData(apiKey: yelpAPIKey, url: url) { (data) in

            let parser = SearchParser()

            parser.parse(data: data) { (searchData) in

                found(searchData)
            }
        }
    }

    /// Create URL with search term and location
    public func createURL(searchTerm: String, location: String) -> URL? {

        let paramString = YelpURLs.searchParamTerm + searchTerm
            + YelpURLs.searchParamLocation + location

        return encodeURL(paramString: paramString)
    }

    /// Create URL with search term and position (lat,long)
    /// Note: Don't encode the ''?' or the URL will be invalid
    public func createURL(searchTerm: String, latitude: Double, longitude: Double) -> URL? {

        // url encoding
        let paramString = YelpURLs.searchParamTerm + searchTerm
            + YelpURLs.searchParamLatitude + String(latitude)
            + YelpURLs.searchParamLongitude + String(longitude)

        return encodeURL(paramString: paramString)
    }

    func encodeURL(paramString: String) -> URL? {

        let encodedParams = paramString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        guard let urlEncodedParams = encodedParams else { return nil }

        let fullURL = YelpURLs.businessSearchEndpoint + urlEncodedParams

        return URL(string: fullURL)
    }

    /// Call Yelp API with business {id] to get business Details
    public func readDetails(id: String, read: @escaping ((DetailData) -> Void)) {

        let urlString = YelpURLs.businessDetailEndpoint + id

        guard let url = URL(string: urlString) else { return }

        let network = NetworkController()

        network.loadYelpData(apiKey: yelpAPIKey, url: url) { (data) in

            let parser = DetailParser()

            parser.parse(data: data) { (detailData) in

                read(detailData)
            }
        }
    }
}
