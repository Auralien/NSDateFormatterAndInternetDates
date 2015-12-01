import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parse()
    }
    
    func parse() {
        let date1 = "2015-12-16T23:00:00+00:00"
        let date2 = "2015-12-16T23:00:00+01:00"
        
        // Works for 24-Hour time format, doesn't work for 12-Hour format.
        // To enable/disable 24-Hour time format go to Settings -> General -> Date & Time -> 24-Hour Time.
        parseDate(date1, false)
        parseDate(date2, false)
        
        // This works for both 12/24-Hour time format.
        parseDate(date1, true)
        parseDate(date2, true)
        
        /* 24-Hour time enabled
        Parsed date '2015-12-16T23:00:00+00:00' into '2015-12-16 23:00:00 +0000'
        Parsed date '2015-12-16T23:00:00+01:00' into '2015-12-16 22:00:00 +0000'
        Parsed date '2015-12-16T23:00:00+00:00' into '2015-12-16 23:00:00 +0000'
        Parsed date '2015-12-16T23:00:00+01:00' into '2015-12-16 22:00:00 +0000'
        */
        
        /* 24-Hour time disabled
        Can't parse date '2015-12-16T23:00:00+00:00'
        Can't parse date '2015-12-16T23:00:00+01:00'
        Parsed date '2015-12-16T23:00:00+00:00' into '2015-12-16 11:00:00 PM +0000'
        Parsed date '2015-12-16T23:00:00+01:00' into '2015-12-16 10:00:00 PM +0000'
        */
    }
    
    func parseDate(dateString: String, _ enforceEnUSPOSIXLocale: Bool) {
        let formatter = NSDateFormatter()
        if enforceEnUSPOSIXLocale { formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") }
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZ'"
        
        if let date = formatter.dateFromString(dateString) {
            print("Parsed date '\(dateString)' into '\(date)'")
        } else {
            print("Can't parse date '\(dateString)'")
        }
    }
}
