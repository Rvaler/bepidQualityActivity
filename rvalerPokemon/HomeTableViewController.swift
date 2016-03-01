//
//  HomeTableViewController.swift
//  
//
//  Created by Rafael Valer on 2/29/16.
//
//

import UIKit
import SwiftyJSON

class HomeTableViewController: UITableViewController {
    
    var jsonData : NSData? {
        didSet {
            if let data = jsonData {
                self.json = JSON(data: data)
            }
        }
    }

    var json : JSON? {
        didSet{
            if let json = self.json {
                self.onHandPokemons = json["data"]["onHandPokemons"]
            }
        }
    }
    
    var onHandPokemons : JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.onHandPokemons.count + 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row != 0{
            self.performSegueWithIdentifier("segueFromHomeToPokemonDetails", sender: indexPath.row)
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("homeTrainer", forIndexPath: indexPath) as! HomeTrainerTableViewCell
            if let json = self.json {
                cell.lblAge.text = String(json["data"]["age"].numberValue)
                cell.lblName.text = json["data"]["name"].string
                cell.lblTown.text = json["data"]["town"].string
                
                if let url = NSURL(string: json["data"]["photo"].string!), data = NSData(contentsOfURL: url) {
                    cell.imgPhoto.image = UIImage(data: data)
                }
            }
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("homePokemon", forIndexPath: indexPath) as! HomePokemonTableViewCell
            let pokemon = self.onHandPokemons[indexPath.row - 1]
            
            cell.lblName.text = pokemon["name"].string
            cell.lblNumber.text = String(pokemon["number"].numberValue)
            cell.lblStatus.text = pokemon["status"].string
            cell.lblTypeOne.text = pokemon["type1"].string
            cell.lblTypeTwo.text = pokemon["type2"].string
            
            if let urlString = pokemon["icon"].string, url = NSURL(string: urlString), data = NSData(contentsOfURL: url) {
                cell.imgIcon.image = UIImage(data: data)
            }
            if let urlString = pokemon["image"].string, url = NSURL(string: urlString), data = NSData(contentsOfURL: url) {
                cell.imgImage.image = UIImage(data: data)
            }
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 187
        default:
            return 251
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! PokemonDetailsViewController
        if let indexRow = sender as? Int {
            destinationVC.pokemon = self.onHandPokemons[indexRow]
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
