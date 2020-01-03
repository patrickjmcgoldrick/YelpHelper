//
//  SearchData.swift
//  YelpHelper
//
//  Created by dirtbag on 1/2/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//
import Foundation

// MARK: Root
public struct SearchData: Codable {
    public var businesses: [Business]?
    public var region: Region
}

// MARK: - Business Elements
public struct Business: Codable {
    public var id: String
    public var name: String
    public var image_url: String?
    public var location: Location
    public var phone: String?
    public var display_phone: String?
    public var distance: Double?
    public var rating: Double
    public var review_count: Int
    public var price: String?
    public var is_closed: Bool
    public var categories: [Category]
    public var coordinates: Coordinates

    public func toMiles(meters: Double) -> String {
        let distance = Measurement(value: meters, unit: UnitLength.meters)
        let miles = distance.converted(to: .miles)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter.maximumFractionDigits = 1
        formatter.numberFormatter.minimumFractionDigits = 1
        return formatter.string(from: miles)
    }
}

public struct Coordinates: Codable {
    public var latitude: Double
    public var longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

public struct Location: Codable {
    public var address1: String
    public var display_address: [String]
}

public struct Category: Codable {
    public var title: String
}

// MARK: - Region Elements
public struct Region: Codable {
    public var center: Coordinates
}
