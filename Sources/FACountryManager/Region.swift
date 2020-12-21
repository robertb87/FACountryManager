//
//  Regions.swift
//  Flags
//
//  Created by Robert Bradish on 29/09/2020.
//

import Foundation

public enum Region: String, CaseIterable, Identifiable, Encodable, Decodable {
    public var id : String { UUID().uuidString }
    case africa = "Africa"
    case antartica = "Antarica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case australia = "Australia"
    case southAmerica = "South America"
    case oceania = "Oceania"
    case all = "All Continents"
    
    private enum CodingKeys: String, CodingKey {
        case rawValue
    }
    
    private enum CodingError: Error {
         case unknownValue
     }
    
    public init(from code: String) {
        switch code {
        case "AF": self = .africa
        case "AN": self = .antartica
        case "AS": self = .asia
        case "EU": self = .europe
        case "NA": self = .northAmerica
        case "AU": self = .australia
        case "SA": self = .southAmerica
        case "OC": self = .oceania
        case "AC": self = .all
        default:
            self = .all
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawValue = try container.decode(String.self, forKey: .rawValue)
        switch rawValue {
        case "Africa": self = .africa
        case "Antarica": self = .antartica
        case "Asia": self = .asia
        case "Europe": self = .europe
        case "North America": self = .northAmerica
        case "Australia": self = .australia
        case "South America": self = .southAmerica
        case "Oceania": self = .oceania
        case "All Continents": self = .all
        default:
                   throw CodingError.unknownValue
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .africa: try container.encode(self.rawValue, forKey: .rawValue)
        case .antartica:  try container.encode(self.rawValue, forKey: .rawValue)
        case .asia: try container.encode(self.rawValue, forKey: .rawValue)
        case .europe: try container.encode(self.rawValue, forKey: .rawValue)
        case .northAmerica: try container.encode(self.rawValue, forKey: .rawValue)
        case .australia: try container.encode(self.rawValue, forKey: .rawValue)
        case .southAmerica: try container.encode(self.rawValue, forKey: .rawValue)
        case .oceania: try container.encode(self.rawValue, forKey: .rawValue)
        case .all: try container.encode(self.rawValue, forKey: .rawValue)
        }
    }
    

}


