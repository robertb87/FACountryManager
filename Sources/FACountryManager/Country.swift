//
//  Country.swift
//  Flags
//
//  Created by Robert Bradish on 09/10/2020.
//

import Foundation

public struct Country: Hashable {
    
    //MARK:- PUBLIC PROPERTIES
    
    public var flag: String
    public let alpha3: String
    public let name: String
    public let region: Region
    public let timesCorrect: Int
    public let timesWrong: Int
    public let lastPracticed: Int
    
    public var capital: String
    public var latlng: [Double]
    public var population: Int
    public var area: Double?
    public var borders: [String]
    public var nativeName: String

    //MARK:- PUBLIC INIT
    
    public init() {
        self.flag = ""
        self.alpha3 = ""
        self.name = ""
        self.region = .all
        self.timesCorrect = 0
        self.timesWrong = 0
        self.lastPracticed = 0
        
        self.capital = ""
        self.latlng = [1]
        self.population = 0
        self.area = 0
        self.borders = [String]()
        self.nativeName = ""
    }
    
    public init(flag: String, iso3: String, name: String, region: Region, capital: String, borders: [String], latlng: Double, nativeName: String, population: Int, area: Double) {
        
        self.alpha3 = iso3
        self.area =  area
        self.borders = borders
        self.capital = capital
        self.flag = flag
        self.latlng = [latlng]
        self.name = name
        self.nativeName = nativeName
        self.population = population
        self.region = region

        self.timesCorrect = 0
        self.timesWrong = 0
        self.lastPracticed = 0
    }


    //MARK:- PUBLIC FUNCS & ENUMS
    
    public enum UpdateValues {
        case correct
        case wrong
        case lastPractice
    }
    
    public func increment(property: UpdateValues, withValue value: Int) -> Country {
        switch property {
        
        case .correct:
            return Country(fromCountry: self, timesCorrect: timesCorrect + 1, timesWrong: timesWrong, lastPracticed: Int(Date().timeIntervalSince1970))
        case .wrong:
            return Country(fromCountry: self, timesCorrect: timesCorrect, timesWrong: timesWrong + 1, lastPracticed: Int(Date().timeIntervalSince1970))
        case .lastPractice:
            return Country(fromCountry: self, timesCorrect: timesCorrect, timesWrong: timesWrong, lastPracticed: Int(Date().timeIntervalSince1970))
        }
    }
    
    //MARK:- PRIVATE INIT
    
    private init(fromCountry country: Country, timesCorrect: Int, timesWrong: Int, lastPracticed: Int) {
        self.flag = country.flag
        self.alpha3 = country.alpha3
        self.name = country.name
        self.region = country.region
        self.timesCorrect = timesCorrect
        self.timesWrong = timesWrong
        self.lastPracticed = lastPracticed
        
        self.capital = country.capital
        self.latlng = country.latlng
        self.population = country.population
        self.area = country.area
        self.borders = country.borders
        self.nativeName = country.nativeName
    }
    
    private init(fromCountry country: Country, capital: String, latlng: [Double], population: Int, area: Double?, borders: [String], nativeName: String) {
        self.flag = country.flag
        self.alpha3 = country.alpha3
        self.name = country.name
        self.region = country.region
        self.timesCorrect = country.timesCorrect
        self.timesWrong = country.timesWrong
        self.lastPracticed = country.lastPracticed
        
        self.capital = capital
        self.latlng = latlng
        self.population = population
        self.area = area
        self.borders = borders
        self.nativeName = nativeName
    }
    
}

//MARK: - EXTENSION CODABLE

extension Country: Codable {
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(String.self, forKey: .flag) {
            flag = value
        } else { flag = "e" }
        
        if let value = try? values.decode(String.self, forKey: .alpha3) {
            alpha3 = CountryFlag(rawValue: value)?.alpha3() ?? value
        } else { alpha3 = "e" }
        
        if let value = try? values.decode(Region.self, forKey: .region) {
            region = value
        } else { region = Region.all }
        
        if let value = try? values.decode(String.self, forKey: .name) {
            name = value
        } else { name = "Error" }
        
        if let value = try? values.decode(Int.self, forKey: .timesCorrect) {
            timesCorrect = value
        } else { timesCorrect = 0 }
        
        if let value = try? values.decode(Int.self, forKey: .timesWrong) {
            timesWrong = value
        } else { timesWrong = 0 }
        
        if let value = try? values.decode(Int.self, forKey: .lastPracticed) {
            lastPracticed = value
        } else { lastPracticed = 0 }
        
        if let value = try? values.decode(String.self, forKey: .capital) {
            capital = value
        } else { capital = "" }
        
        if let value = try? values.decode([Double].self, forKey: .latlng) {
            latlng = value
        } else { latlng = [0.0, 0.0] }
        
        if let value = try? values.decode(Int.self, forKey: .population) {
            population = value
        } else { population = 0 }
        
        if let value = try? values.decode(Double?.self, forKey: .area) {
            area = value
        } else  { area = nil }
        
        if let value = try? values.decode([String].self, forKey: .borders) {
            borders = value
        } else { borders = [String]() }
        
        if let value = try? values.decode(String.self, forKey: .nativeName) {
            nativeName = value
        } else { nativeName = "" }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(flag, forKey: .flag)
        try container.encode(alpha3, forKey: .alpha3)
        try container.encode(name, forKey: .name)
        try container.encode(region, forKey: .region)
        try container.encode(timesCorrect, forKey: .timesCorrect)
        try container.encode(timesWrong, forKey: .timesWrong)
        try container.encode(lastPracticed, forKey: .lastPracticed)
        
        try container.encode(capital, forKey: .capital)
        try container.encode(latlng, forKey: .latlng)
        try container.encode(population, forKey: .population)
        try container.encode(area, forKey: .area)
        try container.encode(borders, forKey: .borders)
        try container.encode(nativeName, forKey: .nativeName)
        
    }
    
    //MARK:- PRIVATE ENUMS
    
    private enum CodingKeys: String, CodingKey{
        case flag
        case alpha3
        case name
        case region
        case timesCorrect
        case timesWrong
        case lastPracticed
        case capital
        case latlng
        case population
        case area
        case borders
        case nativeName
    }
}
