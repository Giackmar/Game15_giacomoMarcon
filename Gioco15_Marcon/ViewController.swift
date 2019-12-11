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
    @IBOutlet weak var PckViewLivello: UIPickerView!
    
    var matriceButton: [[UIButton]] = [[]];
    var matriceButtonOrdinata: [[UIButton]] = [[]];
    var numberMessUp = 1;// varia in base alla difficoltà(vedi metodo creaPartita)

    override func viewDidLoad() {
        super.viewDidLoad()
            matriceButton = [[Btn1,Btn2,Btn3,Btn4],[Btn5,Btn6,Btn7,Btn8],[Btn9,Btn10,Btn11,Btn12],[Btn13,Btn14,Btn15,Btn16]];
            
            matriceButtonOrdinata = matriceButton;
    }
    
    
    @IBAction func buttonPressed(_ sender : UIButton) {
        Position()
        if(ButtonAreClose(Btn: sender)) //se il bottone cliccato(sender) è adiacente alla posizione vuota entro nell'if
        {
            buttonClicked(Btn: sender) //sposto il bottone cliccato nella posizione adiacente libera
        }
    }
    @IBAction func buttonCreaPartita(_ sender: UIButton) { //se cliccato mischia le celle (numberMessUp volte)
        //facile-->1*messUp    medio-->2*messUp   difficile-->5*messuUp     impossibile-->10*messUp
        messUp();
        /*var num = 1
        for n in 0...3
        {
            for n1 in 0...3
            {
               Caricobtn(Btn: matriceButtonOrdinata[n][n1], num: num)
               num += 1
            }
        }*/
    }
    
    func Caricobtn(Btn:UIButton, num:Int) // in base a dove si trova il bottone gli assegno un numero
    {
        for n in 0...3
        {
            for n1 in 0...3
            {
                if(Btn==matriceButton[n][n1])
                {
                    if(num==16)
                    {
                        matriceButtonOrdinata[n][n1].setTitle(String(), for: .normal)//devo mettere niente perchè è ls posizione vuota
                    }
                    else
                    {
                       matriceButtonOrdinata[n][n1].setTitle(String(num), for: .normal)
                    }
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
<<<<<<< Updated upstream
        let btnX = ButtonPos1(Btn: Btn)[0]
        let btnY = ButtonPos1(Btn: Btn)[1]
        let EmptyX = ButtonPos2()[0]
        let EmptyY = ButtonPos2()[1]
        let BtnEmpty = matriceButtonOrdinata[EmptyX][EmptyY]
        let titoloSaved = Btn.title(for: .normal)
        BtnEmpty.setTitle(Btn.title(for: .normal), for: .normal
        )
        Btn.setTitle("", for: .normal)
        matriceButton[EmptyX][EmptyY] = Btn
        matriceButton[btnX][btnY] = BtnEmpty
=======
        let BtnPressedPos = ButtonPos(Btn: Btn);
        let BtnEmptyPos = ButtonPos(Btn: Btn16);
        let BtnPressedPos1  = BtnPressedPos[0]
        let BtnPressedPos2 = BtnPressedPos[1]
        let BtnEmptyPos1 = BtnEmptyPos[0]
        let BtnEmptyPos2 = BtnEmptyPos[1]
        let BtnEmpty = matriceButton[BtnEmptyPos1][BtnEmptyPos2]
        BtnEmpty.setTitle(Btn.title(for: .normal), for: .normal)
        Btn.setTitle("", for: .normal)
        matriceButton[BtnPressedPos1][BtnPressedPos2] = BtnEmpty;
        matriceButton[BtnEmptyPos1][BtnEmptyPos2] = Btn
>>>>>>> Stashed changes
    }
    
    func messUp()
    {
        for _ in 1...10
        {
            let pos = ButtonPos(Btn: Btn16)
            invertitore(pos1: pos[0],pos2: pos[1])
            Position()
        }
    }
    
    func invertitore( pos1:Int, pos2:Int)
    { //genero un bool random ( vero o falso )
        if(Bool.random()) // trasformare tutti if in metodo che richiamo più volte
        {
            if(pos1==0)
            {
                let pos3=pos1+1;
                let btn = matriceButton[pos1][pos2]
                let btn2 = matriceButton[pos3][pos2]
                let titolo1 = btn.title(for: .normal)
                let titolo2 = btn2.title(for: .normal)
                matriceButton[pos1][pos2] = btn2
                matriceButton[pos3][pos2] = btn
                btn2.setTitle(titolo1, for: .normal)
                btn.setTitle(titolo2, for: .normal)
            }
            else if(pos1==3)
            {
                let pos3=pos1-1;
                let btn = matriceButton[pos1][pos2]
                let btn2 = matriceButton[pos3][pos2]
                let titolo1 = btn.title(for: .normal)
                let titolo2 = btn2.title(for: .normal)
                matriceButton[pos1][pos2] = btn2
                matriceButton[pos3][pos2] = btn
                btn2.setTitle(titolo1, for: .normal)
                btn.setTitle(titolo2, for: .normal)
            }
            else
            {
                if(Bool.random())
                {
                    let pos3=pos1+1;
                    let btn = matriceButton[pos1][pos2]
                    let btn2 = matriceButton[pos3][pos2]
                    let titolo1 = btn.title(for: .normal)
                    let titolo2 = btn2.title(for: .normal)
                    matriceButton[pos1][pos2] = btn2
                    matriceButton[pos3][pos2] = btn
                    btn2.setTitle(titolo1, for: .normal)
                    btn.setTitle(titolo2, for: .normal)
                }
                else
                {
                    let pos3=pos1-1;
                    let btn = matriceButton[pos1][pos2]
                    let btn2 = matriceButton[pos3][pos2]
                    let titolo1 = btn.title(for: .normal)
                    let titolo2 = btn2.title(for: .normal)
                    matriceButton[pos1][pos2] = btn2
                    matriceButton[pos3][pos2] = btn
                    btn2.setTitle(titolo1, for: .normal)
                    btn.setTitle(titolo2, for: .normal)
                }
            }
        }
        else
        {
            if(pos2==0)
            {
                let pos3=pos2+1;
                let btn = matriceButton[pos1][pos2]
                let btn2 = matriceButton[pos1][pos3]
                let titolo1 = btn.title(for: .normal)
                let titolo2 = btn2.title(for: .normal)
                matriceButton[pos1][pos2] = btn2
                matriceButton[pos1][pos3] = btn
                btn2.setTitle(titolo1, for: .normal)
                btn.setTitle(titolo2, for: .normal)
            }
            else if(pos2==3)
            {
                let pos3=pos2-1;
                let btn = matriceButton[pos1][pos2]
                let btn2 = matriceButton[pos1][pos3]
                let titolo1 = btn.title(for: .normal)
                let titolo2 = btn2.title(for: .normal)
                matriceButton[pos1][pos2] = btn2
                matriceButton[pos1][pos3] = btn
                btn2.setTitle(titolo1, for: .normal)
                btn.setTitle(titolo2, for: .normal)
            }
            else
            {
                if(Bool.random())
                {
                    let pos3=pos2+1;
                    let btn = matriceButton[pos1][pos2]
                    let btn2 = matriceButton[pos1][pos3]
                    let titolo1 = btn.title(for: .normal)
                    let titolo2 = btn2.title(for: .normal)
                    matriceButton[pos1][pos2] = btn2
                    matriceButton[pos1][pos3] = btn
                    btn2.setTitle(titolo1, for: .normal)
                    btn.setTitle(titolo2, for: .normal)
                }
                else
                {
                    let pos3=pos2-1;
                    let btn = matriceButton[pos1][pos2]
                    let btn2 = matriceButton[pos1][pos3]
                    let titolo1 = btn.title(for: .normal)
                    let titolo2 = btn2.title(for: .normal)
                    matriceButton[pos1][pos2] = btn2
                    matriceButton[pos1][pos3] = btn
                    btn2.setTitle(titolo1, for: .normal)
                    btn.setTitle(titolo2, for: .normal)
                }
            }
            Position()
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
    
    
    func ButtonPos1(Btn : UIButton) -> [Int]
    {
        let titolo = Btn.title(for: .normal)
        var Coordinate: [Int] = [0,0]
        for pos1 in 0...3
        {
            for pos2 in 0...3
            {
                if(matriceButtonOrdinata[pos1][pos2].title(for: .normal)==titolo)
                {
                    Coordinate = [pos1,pos2]
                }
            }
        }
        return Coordinate
    }
    
    func ButtonPos2() -> [Int]
    {
        var Coordinate: [Int] = [0,0]
        for pos1 in 0...3
        {
            for pos2 in 0...3
            {
                var tit = matriceButtonOrdinata[pos1][pos2].title(for: .normal)
                if(tit?.isEmpty ?? true)
                {
                    Coordinate = [pos1,pos2]
                }
            }
        }
        return Coordinate
    }
    
    func Position()
    {
        let  f = matriceButton[0][0].title(for: .normal)
        let  g = matriceButton[0][1].title(for: .normal)
        let  h = matriceButton[0][2].title(for: .normal)
        let  q = matriceButton[0][3].title(for: .normal)
        let  w = matriceButton[1][0].title(for: .normal)
        let  e = matriceButton[1][1].title(for: .normal)
        let  r = matriceButton[1][2].title(for: .normal)
        let  t = matriceButton[1][3].title(for: .normal)
        let  y = matriceButton[2][0].title(for: .normal)
        let  u = matriceButton[2][1].title(for: .normal)
        let  i = matriceButton[2][2].title(for: .normal)
        let  o = matriceButton[2][3].title(for: .normal)
        let  p = matriceButton[3][0].title(for: .normal)
        let  l = matriceButton[3][1].title(for: .normal)
        let  k = matriceButton[3][2].title(for: .normal)
        let  j = matriceButton[3][3].title(for: .normal)
    }
    
    
    func ButtonAreClose(Btn:UIButton) -> Bool //restituisce true se il bottone in input è adiacente al bottonevuoto(Btn16)
    {
<<<<<<< Updated upstream
        let BtnX = ButtonPos1(Btn: Btn)[0]
        let BtnY = ButtonPos1(Btn: Btn)[1]
        let EmptyX = ButtonPos2()[0]
        let EmptyY = ButtonPos2()[1]
        Position()
    if(BtnX==EmptyX && (BtnY==EmptyY+1 || BtnY==EmptyY-1))
=======
	    var Next = false;
        let x1=ButtonPos(Btn: Btn)[0]
        let y1=ButtonPos(Btn: Btn)[1]
        let x2=ButtonPos(Btn: Btn16)[0]
        let y2=ButtonPos(Btn: Btn16)[1]
    if(x1==x2)
>>>>>>> Stashed changes
    {
        return true
    }
<<<<<<< Updated upstream
    if(BtnY==EmptyY && (BtnX==EmptyX+1 || BtnX==EmptyX-1))
=======
    if(y1==y2)
>>>>>>> Stashed changes
    {
        return true
    }
    return false



}
}
