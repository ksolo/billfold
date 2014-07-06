//
//  AddViewController.swift
//  TodoApp
//
//  Created by Michael Pourhadi on 7/3/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class AddDinerViewController: UIViewController {
    
    @IBOutlet strong var addDinerField: UITextField = UITextField()
    
//    var tempDinerList:NSMutableArray = NSMutableArray()
    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        var dinerName = addDinerField.text
//        tempDinerList.addObject(dinerName)
//        let destinationTableViewController = segue.destinationViewController as DinerViewController
//        destinationTableViewController.diner = dinerName
//        destinationTableViewController.dinersList = tempDinerList
//    }
//    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IOS Touch functions
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    //UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder();
        return true
    }
    
    @IBAction func addDinerTap(sender: AnyObject) {
        var dinerName = addDinerField.text
        sharedDinerController.dinerList.addObject(dinerName)
        navigationController.popViewControllerAnimated(true)
        
//        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        
//        var dinerList:NSMutableArray? = userDefaults.objectForKey("dinerList") as? NSMutableArray
//        
//        var dataSet:NSMutableDictionary = NSMutableDictionary()
//        dataSet.setObject(addDinerField.text, forKey: "dinerName")
//        
//        if dinerList {
//            var newMutableList:NSMutableArray = NSMutableArray()
//            
//            for dict:AnyObject in dinerList!{
//                newMutableList.addObject(dict as NSDictionary)
//            }
//            
//            userDefaults.removeObjectForKey("dinerList")
//            newMutableList.addObject(dataSet)
//            userDefaults.setObject(newMutableList, forKey: "dinerList")
//            
//        } else {
//            dinerList = NSMutableArray()
//            dinerList!.addObject(dataSet)
//            userDefaults.setObject(dinerList, forKey: "dinerList")
//        }
//        userDefaults.synchronize()
//    }
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    }
}
