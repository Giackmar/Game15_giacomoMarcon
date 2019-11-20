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
    var numberMessUp = 10;// quante volte sposto una cella in fase di spostamento

    override func viewDidLoad() {
        super.viewDidLoad()
        
        matriceButton = [[Btn1,Btn2,Btn3,Btn4],[Btn5,Btn6,Btn7,Btn8],[Btn9,Btn10,Btn11,Btn12],[Btn13,Btn14,Btn15,Btn16]];
        matriceButtonOrdinata = matriceButton;
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(ButtonAreClose(Btn:sender)) //se il bottone cliccato(sender) è adiacente alla posizione vuota entro nell'if
        {
            //metodo che mi sposta il pulsante cliccato nella posizione "vuota"(16) e viceversa
        }
    }
    @IBAction func buttonCreaPartita(_ sender: UIButton) { //se cliccato mischia le celle (numberMessUp volte)
        messUp();
        for n in 0...3
        {
            for n1 in 0...3
            {
               Caricobtn(Btn: matriceButtonOrdinata[n][n1])
            }
        }
    }
    
    func Caricobtn(Btn:UIButton) // in base a dove si trova il bottone gli assegno un numero
    {
        for n in 0...3
        {
            for n1 in 0...3
            {
                if(Btn==matriceButton[n][n1])
                {
                    let nFinal = (n*4)+n1+1
                    Btn.setTitle(String(nFinal), for: .normal)
                }
            }
        }
    }
    
    func Victory() -> Bool
    {
        var Win = true;
        for pos in 0...15
        {
            if(matriceButton[pos] != matriceButtonOrdinata[pos])
            {
                Win = false;
            }
        }
        return Win
    }
    
    func buttonClicked(Btn: UIButton)
    {
        let BtnPressedPos = ButtonPos(Btn: Btn);
        let BtnEmptyPos = ButtonPos(Btn: Btn16);
        let BtnPressedPos1  = BtnPressedPos[0]
        let BtnPressedPos2 = BtnPressedPos[1]
        let BtnEmptyPos1 = BtnEmptyPos[0]
        let BtnEmptyPos2 = BtnEmptyPos[1]
        matriceButton[BtnPressedPos1][BtnPressedPos2] = Btn16;
        matriceButton[BtnEmptyPos1][BtnEmptyPos2] = Btn;
    }
    
    func messUp()
    {
        for _ in 1...numberMessUp
        {
            let pos = ButtonPos(Btn: Btn16)
            invertitore(pos1: pos[0],pos2: pos[1])
        }
    }
    
    func invertitore( pos1:Int, pos2:Int)
    {
        let scelta = Bool.random()//genero un bool random ( vero o falso )
        if(scelta) // trasformare tutti if in metodo che richiamo più volte
        {
            if(pos1==0)
            {
                let pos3=pos1+1;
                matriceButton[pos1][pos2] = matriceButton[pos3][pos2];
                matriceButton[pos3][pos2] = Btn16;
            }
            else
            {
                let pos3=pos1-1;
                matriceButton[pos1][pos2] = matriceButton[pos3][pos2];
                matriceButton[pos3][pos2] = Btn16;
            }
        }
        else
        {
            if(pos2==0)
            {
                let pos3=pos2+1;
                matriceButton[pos1][pos3] = matriceButton[pos1][pos3];
                matriceButton[pos1][pos3] = Btn16;
            }
            else
            {
                let pos3=pos2-1;
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
}

