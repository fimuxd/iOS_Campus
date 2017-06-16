//
//  ResultViewController.swift
//  KoreanRullet
//
//  Created by Bo-Young PARK on 15/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //****************************************//
    //        TableViewDataSource영역          //
    //****************************************//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCentre.inputMemberNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell:ResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultTableViewCell
        
        resultCell.memberNameLabel.text = "\(DataCentre.inputMemberNames[DataCentre.randomCounts[indexPath.row]])"
        
        if indexPath.row == 0 {
            resultCell.resultValueLabel.text = "축하합니다. 1등이네요🎉"
        }else{
            resultCell.resultValueLabel.text = "💸\(DataCentre.resultValues[indexPath.row])원"
        }
        
        return resultCell
    }
    
    
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        DataCentre.inputMemberNames = []
        DataCentre.randomCounts = []
        DataCentre.resultValues = [0]
    }
    
    //****************************************//
    //              LifeCycle                 //
    //****************************************//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
