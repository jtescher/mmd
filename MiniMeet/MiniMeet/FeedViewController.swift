//
//  FeedViewController.swift
//  MiniMeet
//
//  Created by Hi_Hu on 3/10/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

// Event Custom Struct

struct Event {
    let title: String
    let description: String
    let location: String
    let dateString: String
    let timeString: String
    
    var subtitle: String {
        get {
            return "D \(dateString)   T \(timeString)   L \(location)"
        }
    }
    
    var image: UIImage {
        get {
            let image = UIImage(named: title)
            
            if let image = image {
                return image
            } else {
                return UIImage()
            }
        }
    }
}
// End Event Custom Struct


// Classes
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    // Global Variables & Outlets
    @IBOutlet weak var eventTableView: UITableView!
    
    var events: [Event] = []
    var imageTransition: ImageTransition!
    var translationY: CGFloat!
    var translationPoint: CGPoint!
//    var scale: CGFloat!: 1
    
    
    // Load the View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
//        eventTableView.rowHeight = 163
        
        
        // Event Listings
        let nerdFun = Event(
            title: "Nerd Fun",
            description: "You like learning things, going to museums, science lectures, and you can't get your regular crew to go with you. Perhaps you went to engineering school, but you use hair conditioner anyway. You're intelligent and you have social skills, even tho you might have a video game or two on your hard drive. If you're willing to let your geek flag fly, please join us.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let photowalk = Event(
            title: "Lands End Photowalk",
            description: "Just bring something to take pictures with (any and all devices welcome all levels are encouraged, I myself am a perpetual beginner) and come on a photo walk. We'll convene at a checkpoint, then go for an hour or so photowalk. We'll end at a cafe, where we can sip a beverage, share tips, edit pictures, upload to a social networking sites.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let midnightRide = Event(
            title: "Midnight Mystery Ride",
            description: "It’s kind of a flash mob in that dozens of total strangers converge at a location (announced the day of the ride).  We are an adhoc group of anyone dastardly enough to show up for the midnight ride.  12 months out of the year, we meet up at midnight then follow the leader to a secret mystery location.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let technofeminism = Event(
            title: "Technofeminism",
            description: "Technofeminism is global 501(c)(3) non-profit inspiring women to excel in technology careers with 20,000+ members in 50 cities spanning 15 countries (and counting). Women are invited to come learn about coding.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let iosForDesigners = Event(
            title: "iOS for Designers",
            description: "Designers talk and learn about prototyping iOS apps with Swift and Xcode. There is a focus on views, navigation, transitions, and animations. We'll also look into the Apple Watch and talk about how we can start making useful apps for it. ",
            location: "thoughtbot",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let justMoved = Event(
            title: "Just Moved to SF",
            description: "New to the Valley and interested in technology startups? This meetup helps you interact with like minded people. Discover new places, learn from the experiences of others, connect with similar folks and get best practices for navigating and excelling within the Silicon Valley ecosystem.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let cocoaPods = Event(
            title: "CocoaPods",
            description: "CocoaPods helps developers build apps with Swift and Objective-C. It has thousands of libraries and can help you scale your projects elegantly. We started a group for CocoaPods authors and users in San Francisco, so come by to talk about how you are using CocoaPods in your project or to learn how to do it!",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let handLettering = Event(
            title: "Hand Lettering",
            description: "This month's event is themed around using lettering to raise awareness for charities here in Portland that could use some exposure and positive vibes. We will be selecting 5 charities to create lettered artwork for the night of the event, and when you arrive, you'll be able to choose a team to join.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let hackersFounders = Event(
            title: "Hackers and Founders",
            description: "Hackers and Founders started with a small group of only five members, but the combination of beer, burgers and talk about big problems proved potent. We've grown to over 150,000 members, but wanted to run some Mini Meets to go back to our roots and start with five people sitting around a table talking about big problems.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        let digitalMusic = Event(
            title: "Digital Music Production",
            description: "We are a small group of music producers and musicians looking to collaborate with like minded cats. We have a large venue and a well suited recording studio. We create music in many genres and also mash many up. Rock, Hip-Hop, House, Drum and Bass, Acoustic and Orchestral compositions.",
            location: "Sightglass Coffee",
            dateString: "3.20.15",
            timeString: "1:00 pm")
        
        // Events Array
        events = [nerdFun, photowalk, midnightRide, technofeminism, iosForDesigners, justMoved, cocoaPods, handLettering, hackersFounders, digitalMusic]
    
        self.title = "Events"
        
        
        // Attendee Dots as Circles
        //   self.attendeeDot.layer.cornerRadius = self.attendeeDot.frame.size.width / 2;
        //   self.attendeeDot.clipsToBounds = true;
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table View Method #1
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    // Table View Method #2
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    // Table View Method #3
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("eventCellId") as EventCell
        let event = events[indexPath.row]
        
        let titleAttributes = [NSKernAttributeName: 1.05]
        
        let attributedEventTitle = NSAttributedString(string: event.title, attributes:titleAttributes)
        
        cell.eventTitle.attributedText = attributedEventTitle
        cell.eventSubtitle.text = event.subtitle
        cell.eventImage.image = event.image
        
        cellTransition(cell) // Insert cell animation in the table view
        return cell
        
    }
    
    // Animate the cell
            func cellTransition(cell: UITableViewCell) {
                let view = cell.contentView
                view.transform = CGAffineTransformMakeScale(0.83, 0.83)
                view.layer.opacity = 0.9
                UIView.animateWithDuration(0.5) {
                    view.transform = CGAffineTransformMakeScale(1, 1)
                    view.layer.opacity = 1
                }
            }
    
    // Trigger cell when ready to get pushed into view
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        cellTest = cell
//        var x = translationY + CGFloat(indexPath.item * 187)
//        println( cell.frame.origin.y )
//    }
    
    
    // Scroll to get the cell frame origin value
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let niceCell = eventTableView.frame.origin.y
        translationY = scrollView.contentOffset.y + 64
        

        println("translation: \(translationY)")
        println("table view: \(eventTableView)")
    }
    
    
    @IBAction func createButtonDidPress(sender: AnyObject) {
        self.performSegueWithIdentifier("createEventSegue", sender: self)
    }
    
    // Segue to Event Detail Vc
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if sender.isEqual(UITableViewCell) {
        }
        println("sender \(sender)")

        
        let cell = sender as EventCell
        let indexPath = eventTableView.indexPathForCell(cell)
        
        var destinationVC = segue.destinationViewController as DetailsViewController
        destinationVC.event = events[indexPath!.row]
        
        imageTransition = ImageTransition()
        imageTransition.snapshot = cell.snapshot()
        imageTransition.snapshotStartFrame = eventTableView.rectForRowAtIndexPath(indexPath!)
        imageTransition.duration = 0.3
        
        destinationVC.transitioningDelegate = imageTransition
        // cell.hidden = true
    }
}
