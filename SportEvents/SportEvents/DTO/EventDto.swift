//
//  EventDto.swift
//  SportEvents
//
//  Created by Pavel Fedorchenko on 09.11.2021.
//

import Foundation

// MARK: - Event

struct EventDto: Codable {
    
    struct Event: Codable {
        let embedded: EventEmbedded
        let links: EventLinksClass
        let page: Page
        
        enum CodingKeys: String, CodingKey {
            case embedded = "_embedded"
            case links = "_links"
            case page
        }
    }
    
    // MARK: - EventEmbedded
    struct EventEmbedded: Codable {
        let events: [EventElement]
    }
    
    // MARK: - EventElement
    struct EventElement: Codable {
        let name: String
        let type: String
        let id: String
        let test: Bool
        let url: String
        let locale: String
        let images: [Image]
        let sales: Sales
        let dates: String
        let classifications: [Classification]
        let outlets: [Outlet]?
        let seatmap: Seatmap
        let links: EventLinks
        let embedded: EventEmbeddedClass
        let promoter: Promoter?
        let promoters: [Promoter]?
        let info, pleaseNote: String?
        let priceRanges: [PriceRange]?
        let products: [Product]?
        let accessibility: Accessibility?
        let ticketLimit: TicketLimit?
        let ageRestrictions: AgeRestrictions?
        let ticketing: Ticketing?
        
        enum CodingKeys: String, CodingKey {
            case name, type, id, test, url, locale, images, sales, dates, classifications, outlets, seatmap
            case links = "_links"
            case embedded = "_embedded"
            case promoter, promoters, info, pleaseNote, priceRanges, products, accessibility, ticketLimit, ageRestrictions, ticketing
        }
    }
    
    // MARK: - Accessibility
    struct Accessibility: Codable {
        let ticketLimit: Int
        let info: String?
    }
    
    // MARK: - AgeRestrictions
    struct AgeRestrictions: Codable {
        let legalAgeEnforced: Bool
    }
    
    // MARK: - Classification
    struct Classification: Codable {
        let primary: Bool
        let segment, genre, subGenre: Genre
        let type, subType: Genre?
        let family: Bool
    }
    
    // MARK: - Genre
    struct Genre: Codable {
        let id: String
        let name: String
    }
    
    // MARK: - Dates
    struct Dates: Codable {
        let start: Start
        let status: Status
        let spanMultipleDays: Bool
        let timezone: String?
    }
    
    // MARK: - Start
    struct Start: Codable {
        let localDate, localTime: String
        let dateTime: String
        let dateTBD, dateTBA, timeTBA, noSpecificTime: Bool
    }
    
    // MARK: - Status
    struct Status: Codable {
        let code: String
    }

    
    // MARK: - EventEmbeddedClass
    struct EventEmbeddedClass: Codable {
        let venues: [Venue]
        let attractions: [Attraction]
    }
    
    // MARK: - Attraction
    struct Attraction: Codable {
        let name: String
        let type: AttractionType
        let id: String
        let test: Bool
        let url: String
        let locale: String
        let externalLinks: ExternalLinks
        let aliases: [String]?
        let images: [Image]
        let classifications: [Classification]
        let upcomingEvents: UpcomingEvents
        let links: AttractionLinks
        
        enum CodingKeys: String, CodingKey {
            case name, type, id, test, url, locale, externalLinks, aliases, images, classifications, upcomingEvents
            case links = "_links"
        }
    }
    
    // MARK: - ExternalLinks
    struct ExternalLinks: Codable {
        let twitter, facebook, wiki, instagram: [Facebook]
        let homepage: [Facebook]
    }
    
    // MARK: - Facebook
    struct Facebook: Codable {
        let url: String
    }
    
    // MARK: - Image
    struct Image: Codable {
        let ratio: String
        let url: String
        let width, height: Int
        let fallback: Bool
        let attribution: String?
    }
    
    // MARK: - AttractionLinks
    struct AttractionLinks: Codable {
        let linksSelf: First
        
        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
        }
    }
    
    // MARK: - First
    struct First: Codable {
        let href: String
    }

    
    enum AttractionType: String, Codable {
        case attraction = "attraction"
    }
    
    // MARK: - UpcomingEvents
    struct UpcomingEvents: Codable {
        let total: Int
        let tmr, ticketmaster: Int?
        
        enum CodingKeys: String, CodingKey {
            case total = "_total"
            case tmr, ticketmaster
        }
    }
    
    // MARK: - Venue
    struct Venue: Codable {
        let name: String
        let type: VenueType
        let id: String
        let test: Bool
        let locale: String
        let postalCode: String
        let timezone: String
        let city: City
        let state: State
        let country: Country
        let address: Address
        let location: Location
        let dmas: [DMA]
        let upcomingEvents: UpcomingEvents
        let links: AttractionLinks
        let url: String?
        let images: [Image]?
        let markets: [Genre]?
        let boxOfficeInfo: BoxOfficeInfo?
        let parkingDetail, accessibleSeatingDetail: String?
        let generalInfo: GeneralInfo?
        let social: Social?
        
        enum CodingKeys: String, CodingKey {
            case name, type, id, test, locale, postalCode, timezone, city, state, country, address, location, dmas, upcomingEvents
            case links = "_links"
            case url, images, markets, boxOfficeInfo, parkingDetail, accessibleSeatingDetail, generalInfo, social
        }
    }
    
    // MARK: - Address
    struct Address: Codable {
        let line1: String
    }
    
    // MARK: - BoxOfficeInfo
    struct BoxOfficeInfo: Codable {
        let phoneNumberDetail, openHoursDetail: String
        let acceptedPaymentDetail, willCallDetail: String?
    }
    
    // MARK: - City
    struct City: Codable {
        let name: String
    }
    
    // MARK: - Country
    struct Country: Codable {
        let name: String
        let countryCode: String
    }
    
    // MARK: - DMA
    struct DMA: Codable {
        let id: Int
    }
    
    // MARK: - GeneralInfo
    struct GeneralInfo: Codable {
        let generalRule: String?
        let childRule: String
    }
    
    // MARK: - Location
    struct Location: Codable {
        let longitude, latitude: String
    }
    
    // MARK: - Social
    struct Social: Codable {
        let twitter: Twitter
    }
    
    // MARK: - Twitter
    struct Twitter: Codable {
        let handle: String
    }
    
    // MARK: - State
    struct State: Codable {
        let name, stateCode: String
    }
    
    enum VenueType: String, Codable {
        case venue = "venue"
    }
    
    // MARK: - EventLinks
    struct EventLinks: Codable {
        let linksSelf: First
        let attractions, venues: [First]
        
        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case attractions, venues
        }
    }
    
    // MARK: - Outlet
    struct Outlet: Codable {
        let url: String
        let type: String
    }
    
    // MARK: - PriceRange
    struct PriceRange: Codable {
        let type: String
        let currency: String
        let min, max: Int
    }
    
    // MARK: - Product
    struct Product: Codable {
        let name, id: String
        let url: String
        let type: String
        let classifications: [Classification]
    }
    
    
    // MARK: - Promoter
    struct Promoter: Codable {
        let id: String
        let name: String
        let promoterDescription: String
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case promoterDescription = "description"
        }
    }
    
    // MARK: - Sales
    struct Sales: Codable {
        let salesPublic: Public
        let presales: [Presale]?
        
        enum CodingKeys: String, CodingKey {
            case salesPublic = "public"
            case presales
        }
    }
    
    // MARK: - Presale
    struct Presale: Codable {
        let startDateTime, endDateTime: String
        let name: String
    }
    
    // MARK: - Public
    struct Public: Codable {
        let startDateTime: String
        let startTBD, startTBA: Bool
        let endDateTime: String
    }
    
    // MARK: - Seatmap
    struct Seatmap: Codable {
        let staticURL: String
        
        enum CodingKeys: String, CodingKey {
            case staticURL = "staticUrl"
        }
    }
    
    // MARK: - TicketLimit
    struct TicketLimit: Codable {
        let info: String
    }
    
    // MARK: - Ticketing
    struct Ticketing: Codable {
        let healthCheck: HealthCheck
        let safeTix: SafeTix
    }
    
    // MARK: - HealthCheck
    struct HealthCheck: Codable {
        let summary, healthCheckDescription: String
        let learnMoreURL: String
        
        enum CodingKeys: String, CodingKey {
            case summary
            case healthCheckDescription = "description"
            case learnMoreURL = "learnMoreUrl"
        }
    }
    
    // MARK: - SafeTix
    struct SafeTix: Codable {
        let enabled: Bool
    }
    
    
    // MARK: - EventLinksClass
    struct EventLinksClass: Codable {
        let first, linksSelf, next, last: First
        
        enum CodingKeys: String, CodingKey {
            case first
            case linksSelf = "self"
            case next, last
        }
    }
    
    // MARK: - Page
    struct Page: Codable {
        let size, totalElements, totalPages, number: Int
    }
    
}
