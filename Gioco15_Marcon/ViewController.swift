//
//  ViewController.swift
//  Gioco15_Marcon
//
//  Created by GIACOMO MARCON on 30/10/2019.
//  Copyright © 2019 GIACOMO MARCON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn4: UIButton!
    @IBOutlet weak var Btn5: UIButton!
    @IBOutlet weak var Btn6: UIButton!
    @IBOutlet weak var Btn7: UIButton!
    @IBOutlet weak var Btn8: UIButton!
    @IBOutlet weak var Btn9: UIButton!
    @IBOutlet weak var Btn10: UIButton!
    @IBOutlet weak var Btn11: UIButton!
    @IBOutlet weak var Btn12: UIButton!
    @IBOutlet weak var Btn13: UIButton!
    @IBOutlet weak var Btn14: UIButton!
    @IBOutlet weak var Btn15: UIButton!
    @IBOutlet weak var Btn16: UIButton!
    var matrice: [[Int]] = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]];
    var matriceButton: [[UIButton]] = [[]];
    var quantitaMischio = 100;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matriceButton = [[Btn1,Btn2,Btn3,Btn4],[Btn5,Btn6,Btn7,Btn8],[Btn9,Btn10,Btn11,Btn12],[Btn13,Btn14,Btn15,Btn16]];
    }
    //metodo che mi dice la posizione di un btn
    //metodo che mi trova il 16(posizionevuota)
    func ControlloSeSpostabile(Btn : UIButton) -> Bool
    {
        //trovo la posizione del bottone e controllo se posso spostarlo(se è adiacente alla posizione vuota(16))
        return true//da modificare
    }
    
    @IBAction func Btn1(_ sender: UIButton) {
        var possoSposarlo = ControlloSeSpostabile(Btn: Btn1)//se è possibile spostarlo lo faccio
        if(possoSposarlo)
        {
            //faccio un metodo che mi dice la posizione del btn1 e la posizione di dove andrà
        }
    }
    @IBAction func Btn2(_ sender: UIButton) {
    }
    @IBAction func Btn3(_ sender: UIButton) {
    }
    @IBAction func Btn4(_ sender: UIButton) {
    }
    @IBAction func Btn5(_ sender: UIButton) {
    }
    @IBAction func Btn6(_ sender: UIButton) {
    }
    @IBAction func Btn7(_ sender: UIButton) {
    }
    @IBAction func Btn8(_ sender: UIButton) {
    }
    @IBAction func Btn9(_ sender: UIButton) {
    }
    @IBAction func Btn10(_ sender: UIButton) {
    }
    @IBAction func Btn11(_ sender: UIButton) {
    }
    @IBAction func Btn12(_ sender: UIButton) {
    }
    @IBAction func Btn13(_ sender: UIButton) {
    }
    @IBAction func Btn14(_ sender: UIButton) {
    }
    @IBAction func Btn15(_ sender: UIButton) {
    }
    @IBAction func Btn16(_ sender: UIButton) {
    }
    
    
    
    func mischio()
    {
        for _ in 1...quantitaMischio
        {
            cercoNull();
        }
    }
    
    func cercoNull()
    {
        for pos1 in 0...3
        {
            for pos2 in 0...3
            {
                if(matrice[pos1][pos2]==16)
                {
                    invertitore(pos1:pos1,pos2:pos2)
                }
            }
        }
    }
    
    func invertitore( pos1:Int, pos2:Int     )
    {
        let scelta = Bool.random()//genero un bool random ( vero o falso )
        if(scelta)
        {
            if(pos1==0)
            {
                var pos3=pos1+1;
                matrice[pos1][pos2] = matrice[pos3][pos2];
                matrice[pos3][pos2] = 16;
            }
            else
            {
                var pos3=pos1-1;
                matrice[pos1][pos2] = matrice[pos3][pos2];
                matrice[pos3][pos2] = 16;
            }
        }
        else
        {
            if(pos2==0)
            {
                var pos3=pos2+1;
                matrice[pos1][pos3] = matrice[pos1][pos3];
                matrice[pos1][pos3] = 16;
            }
            else
            {
                var pos3=pos1-1;
                matrice[pos1][pos3] = matrice[pos1][pos3];
                matrice[pos1][pos3] = 16;
            }
        }
    }



}

