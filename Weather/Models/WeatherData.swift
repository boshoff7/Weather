

import Foundation
struct Current : Codable {
    var dt : Int?
    var sunrise : Int?
    var sunset : Int?
    var temp : Double?
    var feelslike : Double?
    var pressure : Int?
    var humidity : Int?
    var dewpoint : Double?
    var uvi : Double?
    var clouds : Int?
    var visibility : Int?
    var windspeed : Double?
    var winddeg : Int?
    var windgust : Double?
    var weather : [Weather]?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feelslike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewpoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windspeed = "wind_speed"
        case winddeg = "wind_deg"
        case windgust = "wind_gust"
        case weather = "weather"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        feelslike = try values.decodeIfPresent(Double.self, forKey: .feelslike)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        dewpoint = try values.decodeIfPresent(Double.self, forKey: .dewpoint)
        uvi = try values.decodeIfPresent(Double.self, forKey: .uvi)
        clouds = try values.decodeIfPresent(Int.self, forKey: .clouds)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        windspeed = try values.decodeIfPresent(Double.self, forKey: .windspeed)
        winddeg = try values.decodeIfPresent(Int.self, forKey: .winddeg)
        windgust = try values.decodeIfPresent(Double.self, forKey: .windgust)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
    }

}


struct Daily : Codable {
    var dt : Int?
    var sunrise : Int?
    var sunset : Int?
    var moonrise : Int?
    var moonset : Int?
    var moonphase : Double?
    var temp : Temp?
    var feelslike : Feels_like?
    var pressure : Int?
    var humidity : Int?
    var dewpoint : Double?
    var windspeed : Double?
    var winddeg : Int?
    var windgust : Double?
    var weather : [Weather]?
    var clouds : Int?
    var pop : Double?
    var uvi : Double?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moonphase = "moon_phase"
        case temp = "temp"
        case feelslike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewpoint = "dew_point"
        case windspeed = "wind_speed"
        case winddeg = "wind_deg"
        case windgust = "wind_gust"
        case weather = "weather"
        case clouds = "clouds"
        case pop = "pop"
        case uvi = "uvi"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
        moonrise = try values.decodeIfPresent(Int.self, forKey: .moonrise)
        moonset = try values.decodeIfPresent(Int.self, forKey: .moonset)
        moonphase = try values.decodeIfPresent(Double.self, forKey: .moonphase)
        temp = try values.decodeIfPresent(Temp.self, forKey: .temp)
        feelslike = try values.decodeIfPresent(Feels_like.self, forKey: .feelslike)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        dewpoint = try values.decodeIfPresent(Double.self, forKey: .dewpoint)
        windspeed = try values.decodeIfPresent(Double.self, forKey: .windspeed)
        winddeg = try values.decodeIfPresent(Int.self, forKey: .winddeg)
        windgust = try values.decodeIfPresent(Double.self, forKey: .windgust)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        clouds = try values.decodeIfPresent(Int.self, forKey: .clouds)
        pop = try values.decodeIfPresent(Double.self, forKey: .pop)
        uvi = try values.decodeIfPresent(Double.self, forKey: .uvi)
    }

}

struct Feels_like : Codable {
    var day : Double?
    var night : Double?
    var eve : Double?
    var morn : Double?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decodeIfPresent(Double.self, forKey: .day)
        night = try values.decodeIfPresent(Double.self, forKey: .night)
        eve = try values.decodeIfPresent(Double.self, forKey: .eve)
        morn = try values.decodeIfPresent(Double.self, forKey: .morn)
    }

}

struct Hourly : Codable {
    var dt : Int?
    var temp : Double?
    var feelslike : Double?
    var pressure : Int?
    var humidity : Int?
    var dewpoint : Double?
    var uvi : Double?
    var clouds : Int?
    var visibility : Int?
    var windspeed : Double?
    var winddeg : Int?
    var windgust : Double?
    var weather : [Weather]?
    var pop : Int?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case temp = "temp"
        case feelslike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewpoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windspeed = "wind_speed"
        case winddeg = "wind_deg"
        case windgust = "wind_gust"
        case weather = "weather"
        case pop = "pop"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        feelslike = try values.decodeIfPresent(Double.self, forKey: .feelslike)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        dewpoint = try values.decodeIfPresent(Double.self, forKey: .dewpoint)
        uvi = try values.decodeIfPresent(Double.self, forKey: .uvi)
        clouds = try values.decodeIfPresent(Int.self, forKey: .clouds)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        windspeed = try values.decodeIfPresent(Double.self, forKey: .windspeed)
        winddeg = try values.decodeIfPresent(Int.self, forKey: .winddeg)
        windgust = try values.decodeIfPresent(Double.self, forKey: .windgust)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        pop = try values.decodeIfPresent(Int.self, forKey: .pop)
    }

}


struct WeatherData : Codable {
    var lat : Double?
    var lon : Double?
    var timezone : String?
    var timezoneoffset : Int?
    var current : Current?
    var hourly : [Hourly]?
    var daily : [Daily]?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lon = "lon"
        case timezone = "timezone"
        case timezoneoffset = "timezone_offset"
        case current = "current"
        case hourly = "hourly"
        case daily = "daily"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        timezoneoffset = try values.decodeIfPresent(Int.self, forKey: .timezoneoffset)
        current = try values.decodeIfPresent(Current.self, forKey: .current)
        hourly = try values.decodeIfPresent([Hourly].self, forKey: .hourly)
        daily = try values.decodeIfPresent([Daily].self, forKey: .daily)
    }

}

struct Temp : Codable {
    var day : Double?
    var min : Double?
    var max : Double?
    var night : Double?
    var eve : Double?
    var morn : Double?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decodeIfPresent(Double.self, forKey: .day)
        min = try values.decodeIfPresent(Double.self, forKey: .min)
        max = try values.decodeIfPresent(Double.self, forKey: .max)
        night = try values.decodeIfPresent(Double.self, forKey: .night)
        eve = try values.decodeIfPresent(Double.self, forKey: .eve)
        morn = try values.decodeIfPresent(Double.self, forKey: .morn)
    }

}

struct Weather : Codable {
    var id : Int?
    var main : String?
    var description : String?
    var icon : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
    }

}
