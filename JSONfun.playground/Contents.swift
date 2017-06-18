/* Author: J.Bones
 * Date Created: 17.06.2017
 * Date Last Modified: 18.06.2016
 *
 * Description: Playground for better understanding of parsing JSON data (in readiness for York Pokemon Go Nest app)
 */

import Foundation

//Locate the JSON file in the main project resources
let fileName = Bundle.main.path(forResource: "NestData", ofType: "json")

//Initialise a Data variable
var jsonData: Data = Data()

//If a file is located then assign it to the jsonData variable
if let locatedFile = fileName {
    jsonData = try Data(contentsOf: URL(fileURLWithPath: locatedFile))
}

//Read the JSON data from file as a dictionary with type String: Any
if let allNests = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
    //If nest entry found, read the data as an array of dictionaries with type String: Any
    if let nests = allNests["nest"] as? [[String: Any]]{
        //Cycle through nest entries and access elements
        for nest in nests{
            print("Nest #\(nest["id"]!) is a \(nest["pokemon"]!) nest")
        }
    }

}
