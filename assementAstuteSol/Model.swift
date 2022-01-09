import Foundation
import Foundation

class images : NSObject {
      
    var id : String?
    var title: String?
    var title_long: String?
    var year: String?
    var rating: String?
    var genres: String?
    var background_image: String?
    var cover_image: String?
    var summary: String?
    var language: String?
    var created_at : String?


     init?(dictionary: NSDictionary) {

         id = dictionary["id"] as? String
         title = dictionary["title"] as? String
         title_long = dictionary["title_long"] as? String
         year = dictionary["year"] as? String
         rating = dictionary["rating"] as? String
         genres = dictionary["genres"] as? String
         background_image = dictionary["background_image"] as? String
         cover_image = dictionary["cover_image"] as? String
         summary = dictionary["summary"] as? String
         language = dictionary["language"] as? String
         created_at = dictionary["created_at"] as? String
         
    }


}
