//
//  BarViewController.swift
//  SquareMoves
//
//  Created by Lindsey pollock on 4/18/17.
//  Copyright © 2017 Lindsey pollock. All rights reserved.
//

import UIKit
import Firebase

class BarViewController: UIViewController {

    
    
    @IBOutlet weak var barNameLabel: UINavigationItem!
    
    @IBOutlet weak var capacityLabel: UILabel!
    
    var capacity: Int = 0
    var maxCapacity: Int = 100
    
    
    
    
    @IBOutlet weak var addCapacityButton: UIButton!
    
    @IBOutlet weak var minusCapacityButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        
            
        
        self.performSegue(withIdentifier: "logoutBarSegue", sender: self)
        
        
    }

    @IBAction func addCapacity(_ sender: Any) {
        
        if capacity == maxCapacity {
            
            print("Bar is at Capacity")
            
            
            
        } else {
        capacity = capacity + 1
        updateLabel()
            
        }
    }

    @IBAction func minusCapacity(_ sender: Any) {
        
        if capacity == 0 {
            capacity = 0
            updateLabel()
        } else {
        
        capacity = capacity - 1
        updateLabel()

        }
    }
    
    
    func updateLabel() {
        
        capacityLabel.text = "\(capacity)"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
    }
    
    
    
}
