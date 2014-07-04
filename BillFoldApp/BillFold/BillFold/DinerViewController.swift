//
//  MasterTableViewController.swift
//  TodoApp
//
//  Created by Michael Pourhadi on 7/3/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class DinerViewController: UITableViewController {
    
    
    //I ADDED THIS I THINK IT SHOULD BE DECLARED HERE??????
    var tesseract:STesseract = STesseract();
    
    var dinersList:NSMutableArray = NSMutableArray()
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
        [tesseract setVariableValue:@"0123456789" forKey:@"tessedit_char_whitelist"];
        [tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]];
        [tesseract recognize];
        
        NSLog(@"%@", [tesseract recognizedText]);
        [tesseract clear];
        
        
        
    }
    
    override func viewDidAppear(animated: Bool){
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var dinerListFromDefaults:NSMutableArray? = userDefaults.objectForKey("dinerList") as? NSMutableArray
        
        if dinerListFromDefaults {
            dinersList = dinerListFromDefaults!
        }
        
        self.tableView.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return dinersList.count
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("diner", forIndexPath: indexPath) as UITableViewCell
        
        var specificDiner:NSDictionary = dinersList.objectAtIndex(indexPath!.row) as NSDictionary
        cell.text = specificDiner.objectForKey("dinerName") as String
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}