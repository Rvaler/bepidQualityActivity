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
    
    var pokemons : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountManager.sharedInstace.trainer.onHandPokemons!.count + 1
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
            if let trainer = AccountManager.sharedInstace.trainer {
                cell.lblAge.text = String(trainer.age)
                cell.lblName.text = trainer.name
                cell.lblTown.text = trainer.town
                
                if let url = NSURL(string: trainer.photo), data = NSData(contentsOfURL: url) {
                    cell.imgPhoto.image = UIImage(data: data)
                }
            }
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("homePokemon", forIndexPath: indexPath) as! HomePokemonTableViewCell
            let pokemon = AccountManager.sharedInstace.trainer.onHandPokemons![indexPath.row - 1]
            
            
            cell.lblName.text = pokemon.name
            cell.lblNumber.text = String(pokemon.number)
            cell.lblTypeOne.text = pokemon.type1
            cell.lblTypeTwo.text = pokemon.type2
            
            if let urlString = pokemon.icon, url = NSURL(string: urlString), data = NSData(contentsOfURL: url) {
                cell.imgIcon.image = UIImage(data: data)
            }
            if let urlString = pokemon.image, url = NSURL(string: urlString), data = NSData(contentsOfURL: url) {
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
            destinationVC.pokemon = AccountManager.sharedInstace.trainer.onHandPokemons![indexRow - 1]
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
