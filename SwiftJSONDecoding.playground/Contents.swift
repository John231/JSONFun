/* Author: J.Bones
 * Date Created: 17.06.2017
 * Date Last Modified: 30.07.2020
 *
 * Description: Swift playground to aid understanding decoding JSON data
 */

import Foundation

// Model of expected JSON schema
struct DataModel: Codable {
    var nest: [Nest]
    
    struct Nest: Codable {
        var id: Int
        var latitude: Double
        var longitude: Double
        var pokemon: String
        var pokedexEntry: Int
        var verified: Bool
    }
}

//Locate the JSON file in the main project resources
if let jsonFilePath = Bundle.main.url(forResource: "NestData", withExtension: "json"){
    do {
        //Read the raw JSON data from the local file
        let jsonData = try Data(contentsOf: jsonFilePath)
        
        //Decode the raw data using the typesafe DataModel struct
        let decoder = JSONDecoder()
        let nestData = try decoder.decode(DataModel.self, from: jsonData)
        
        // Print information about each nest
        nestData.nest.forEach { (nest) in
            print("Nest #\(nest.id) is a \(nest.pokemon) nest")
        }
    } catch {
        print(error)
    }
}
