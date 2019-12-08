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
        var btnX = ButtonPos1(Btn: Btn)[0]
        var btnY = ButtonPos1(Btn: Btn)[1]
        var EmptyX = ButtonPos2()[0]
        var EmptyY = ButtonPos2()[1]
        var BtnEmpty = matriceButton[EmptyX][EmptyY]
        var titoloSaved = Btn.title(for: .normal)
        BtnEmpty.setTitle(Btn.title(for: .normal), for: .normal
        )
        Btn.setTitle(titoloSaved, for: .normal)
        matriceButton[EmptyX][EmptyY] = Btn
        matriceButton[btnX][btnY] = BtnEmpty
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
        var titolo = Btn.title(for: .normal)
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
        var titolo = "16"
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
    
    func Position()
    {
        var  f = matriceButton[0][0].title(for: .normal)
        var  g = matriceButton[0][1].title(for: .normal)
        var  h = matriceButton[0][2].title(for: .normal)
        var  q = matriceButton[0][3].title(for: .normal)
        var  w = matriceButton[1][0].title(for: .normal)
        var  e = matriceButton[1][1].title(for: .normal)
        var  r = matriceButton[1][2].title(for: .normal)
        var  t = matriceButton[1][3].title(for: .normal)
        var  y = matriceButton[2][0].title(for: .normal)
        var  u = matriceButton[2][1].title(for: .normal)
        var  i = matriceButton[2][2].title(for: .normal)
        var  o = matriceButton[2][3].title(for: .normal)
        var  p = matriceButton[3][0].title(for: .normal)
        var  l = matriceButton[3][1].title(for: .normal)
        var  k = matriceButton[3][2].title(for: .normal)
        var  j = matriceButton[3][3].title(for: .normal)
    }
    
    
    func ButtonAreClose(Btn:UIButton) -> Bool //restituisce true se il bottone in input è adiacente al bottonevuoto(Btn16)
    {
        var BtnX = ButtonPos1(Btn: Btn)[0]
        var BtnY = ButtonPos1(Btn: Btn)[1]
        var EmptyX = ButtonPos2()[0]
        var EmptyY = ButtonPos2()[1]
        Position()
    if(BtnX==EmptyX && (BtnY==EmptyY+1 || BtnY==EmptyY-1))
    {
        return true
    }
    if(BtnY==EmptyY && (BtnX==EmptyX+1 || BtnX==EmptyX-1))
    {
        return true
    }
    return false



}
}
