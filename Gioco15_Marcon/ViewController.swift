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
    
    var matriceButton: [[UIButton]] = [[]];
    var matriceButtonOrdinata: [[UIButton]] = [[]];
    var numberMessUp;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        matriceButton = [[Btn1,Btn2,Btn3,Btn4],[Btn5,Btn6,Btn7,Btn8],[Btn9,Btn10,Btn11,Btn12],[Btn13,Btn14,Btn15,Btn16]];
        matriceButtonOrdinata = matriceButton;
        //do in input la quantita di volte che devo mischiare le celle ( assegno numberMessUp )
        messUp();
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(ButtonAreClose(_ sender:Btn)) //se il bottone cliccato(sender) è adiacente alla posizione vuota entro nell'if
        {
            //metodo che mi sposta il pulsante cliccato nella posizione "vuota"(16) e viceversa
        }
    }
    
    func Victory() -> Bool
    {
        var Win = true;
        var pos;
        for pos in 0...15
        {
            if(matriceButton[pos]!=matriceButtonOrdinata[pos])
            {
                Win = false;
            }
        }
        return Win
    }
    
    func buttonClicked(Btn: UIButton)
    {
        var BtnPressedPos = ButtonPos(Btn);
        var BtnEmptyPos = ButtonPos(Btn16);
        matriceButton[BtnPressedPos] = Btn16;
        matriceButton[BtnEmptyPos] = Btn;
    }
    
    func messUp()
    {
        for _ in 1...numberMessUp
        {
            var pos = ButtonPos(Btn16)
            invertitore(pos[0]:pos1,pos[1]:pos2)
        }
    }
    
    func invertitore( pos1:Int, pos2:Int)
    {
        let scelta = Bool.random()//genero un bool random ( vero o falso )
        if(scelta) // trasformare tutti if in metodo che richiamo più volte
        {
            if(pos1==0)
            {
                var pos3=pos1+1;
                matriceButton[pos1][pos2] = matriceButton[pos3][pos2];
                matriceButton[pos3][pos2] = Btn16;
            }
            else
            {
                var pos3=pos1-1;
                matriceButton[pos1][pos2] = matriceButton[pos3][pos2];
                matriceButton[pos3][pos2] = Btn16;
            }
        }
        else
        {
            if(pos2==0)
            {
                var pos3=pos2+1;
                matriceButton[pos1][pos3] = matriceButton[pos1][pos3];
                matriceButton[pos1][pos3] = Btn16;
            }
            else
            {
                var pos3=pos1-1;
                matriceButton[pos1][pos3] = matriceButton[pos1][pos3];
                matriceButton[pos1][pos3] = Btn16;
            }
        }
    }
    
    func ButtonPos(Btn : UIButton) -> [Int]
    {
        var Coordinate: [Int] = [0,0]
        for pos1 in 0...3
        {
            for pos2 in 0...3
            {
                if(matriceButton[pos1][pos2]==Btn)
                {
                    Coordinate = [pos1,pos2]
                }
            }
        }
        return Coordinate
    }
    
    func ButtonAreClose(Btn:UIButton) -> Bool //restituisce true se il bottone in input è adiacente al bottonevuoto(Btn16)
    {
    var Next = false;
    if((ButtonPos(Btn: Btn)[0]==ButtonPos(Btn: Btn16)[0]) && (ButtonPos(Btn: Btn)[1]==ButtonPos(Btn: Btn16)[1]+1 || ButtonPos(Btn: Btn)[1]==ButtonPos(Btn: Btn16)[1]-1))
    {
    Next = true
    }
    if((ButtonPos(Btn: Btn)[1]==ButtonPos(Btn: Btn16)[1]) && (ButtonPos(Btn: Btn)[0]==ButtonPos(Btn: Btn16)[0]+1 || ButtonPos(Btn: Btn)[0]==ButtonPos(Btn: Btn16)[0]-1))
    {
    Next = true
    }
    return Next



}

