//
//  ViewController.swift
//  Gioco15_Marcon
//
//  Created by GIACOMO MARCON on 30/10/2019.
//  Copyright © 2019 GIACOMO MARCON. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    
    
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
    @IBOutlet weak var Picker1: UIPickerView!
    @IBOutlet weak var TabellaVitoria: UILabel!
    
    
    var matriceButton: [[UIButton]] = [[]]; //matrice di button che scombino
    var matriceButtonOrdinata: [[UIButton]] = [[]]; //matrice di button ordinata
    var numberMessUp = 5; //numero di volte che scombino in 1 giro (facile=2*numberMessUp  medio=3*numberMessUp  ecc..)
    let difficoltà = ["facile","medio","difficile","impossibile"] //array di difficoltà tra cui scegliere
    var difficoltàSelezionata = ""; //variabile contenente la stringa corrispondente alla difficoltà selezionata

    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        matriceButton = [[Btn1,Btn2,Btn3,Btn4],[Btn5,Btn6,Btn7,Btn8],[Btn9,Btn10,Btn11,Btn12],[Btn13,Btn14,Btn15,Btn16]];
        matriceButtonOrdinata = matriceButton; //"riempio" le matrici di button
        Picker1.dataSource = self
        Picker1.delegate = self
        
        //nascondo la tabella vittoria mentre abilito i button
        TabellaVitoria.isHidden = true; 
        Btn1.isEnabled = false;
        Btn2.isEnabled = false;
        Btn3.isEnabled = false;
        Btn4.isEnabled = false;
        Btn5.isEnabled = false;
        Btn6.isEnabled = false;
        Btn7.isEnabled = false;
        Btn8.isEnabled = false;
        Btn9.isEnabled = false;
        Btn10.isEnabled = false;
        Btn11.isEnabled = false;
        Btn12.isEnabled = false;
        Btn13.isEnabled = false;
        Btn14.isEnabled = false;
        Btn15.isEnabled = false;
        Btn16.isEnabled = false;
    }
    
    
    
       //numero di colonne della pickerView 
       func numberOfComponents(in listaDifficoltà: UIPickerView) -> Int {
           return 1
       }
       
       //numero di righe della pickerView 
       func pickerView(_ listaDifficoltà: UIPickerView, numberOfRowsInComponent component: Int) -> Int 
       {
           return difficoltà.count
       }
    
       //riempie la pickerView con le difficoltà (array)
       func pickerView(_ listaDifficoltà: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String? 
       {
           return difficoltà[row]
       }
    
       //assegno a difficoltàSelezionata la difficoltà selezionata dall'utente
       func pickerView(_ listaDifficoltà: UIPickerView, didSelectRow row: Int, inComponent component: Int)
       {
           difficoltàSelezionata = difficoltà[row]
       }
    
    
    //ritorna quantità di volte che devo mischiare le celle in base alla difficoltà selezionata
    func difficoltàGioco()->Int
    {
        if(difficoltàSelezionata=="facile")
        {
            return 0
        }
        if(difficoltàSelezionata=="medio")
        {
            return 2
        }
        if(difficoltàSelezionata=="difficile")
        {
            return 10
        }
        if(difficoltàSelezionata=="impossibile")
        {
            return 100
        }
        return 1
    }
       
    
    //quando premo un dei bottoni che rappresenta le celle entro in questo metodo
    @IBAction func buttonPressed(_ sender : UIButton) 
    {
        if(ButtonAreClose(Btn: sender))//se il bottone cliccato(sender) è adiacente alla posizione vuota entro nell'if
        {
            buttonMove(Btn: sender)//sposto il bottone cliccato nella posizione adiacente libera
        }
        if(Victory())//se tutti le celle sono nell'ordine giusto entro nell'if perchè l'utente ha vinto
        {
            //nascondo la tabellaVittoria e ci scrivo hai vinto inoltre disabilito tutti i bottoni
            TabellaVitoria.isHidden = false;
            TabellaVitoria.text = "HAI VINTO!"
            Btn1.isEnabled = false;
            Btn2.isEnabled = false;
            Btn3.isEnabled = false;
            Btn4.isEnabled = false;
            Btn5.isEnabled = false;
            Btn6.isEnabled = false;
            Btn7.isEnabled = false;
            Btn8.isEnabled = false;
            Btn9.isEnabled = false;
            Btn10.isEnabled = false;
            Btn11.isEnabled = false;
            Btn12.isEnabled = false;
            Btn13.isEnabled = false;
            Btn14.isEnabled = false;
            Btn15.isEnabled = false;
            Btn16.isEnabled = false;
        }
    }
    
    
    
    @IBAction func buttonCreaPartita(_ sender: UIButton) 
    {
        viewDidLoad();//chiamando il metodo  viewDidLoad resetto le matrici
        
        //nascondo la tabellaVittoria e abilito tutti i bottoni "celle"
        TabellaVitoria.isHidden = true
        Btn1.isEnabled = true;
        Btn2.isEnabled = true;
        Btn3.isEnabled = true;
        Btn4.isEnabled = true;
        Btn5.isEnabled = true;
        Btn6.isEnabled = true;
        Btn7.isEnabled = true;
        Btn8.isEnabled = true;
        Btn9.isEnabled = true;
        Btn10.isEnabled = true;
        Btn11.isEnabled = true;
        Btn12.isEnabled = true;
        Btn13.isEnabled = true;
        Btn14.isEnabled = true;
        Btn15.isEnabled = true;
        Btn16.isEnabled = true;
        
        //metto a tutti i titoli i nomi in ordine crescente
        for n1 in 0...3
        {
            for n2 in 0...3
            {
                var titolo = (String)(n2+(n1*4)+1)
                if(n1==3 && n2==3)
                {
                    titolo = ""
                }
                matriceButtonOrdinata[n1][n2].setTitle(titolo, for: .normal)
            }
        }
        
        let n = difficoltàGioco()//numero di volte che deve effettuare il mischiamento delle in base alla difficoltà selezionata
        for _ in 0...n//mischio per n volte
        {
            messUp();
        }
    }
    
    
    
    func ButtonAreClose(Btn:UIButton) -> Bool //restituisce true se il bottone in input è adiacente al bottone vuoto
    {
        let BtnX = ButtonPos1(Btn: Btn)[0]
        let BtnY = ButtonPos1(Btn: Btn)[1]
        let EmptyX = ButtonPos2()[0]
        let EmptyY = ButtonPos2()[1]
        
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
    
    
    
    func buttonMove(Btn: UIButton)//sposta il bottone passato in input nella posizione vuota e viceversa
    {
        let btnX = ButtonPos1(Btn: Btn)[0]
        let btnY = ButtonPos1(Btn: Btn)[1]
        let EmptyX = ButtonPos2()[0]
        let EmptyY = ButtonPos2()[1]
        let BtnEmpty = matriceButtonOrdinata[EmptyX][EmptyY]
        BtnEmpty.setTitle(Btn.title(for: .normal), for: .normal)
        Btn.setTitle("", for: .normal)
        matriceButton[EmptyX][EmptyY] = Btn
        matriceButton[btnX][btnY] = BtnEmpty
    }
    
    
    
    func Victory() -> Bool//controlla se tutte le celle sono in ordine (se l'utente ha vinto ritorna true)
    {
        var Win = true;
        for n1 in 0...3
        {
            for n2 in 0...3
            {
                var titolo = (String)(n2+(n1*4)+1)
                if(n1==3 && n2==3)
                {
                    titolo = ""
                }
                if(matriceButtonOrdinata[n1][n2].title(for: .normal) != titolo)
                {
                    Win = false;
                }
            }
        }
        return Win
    }
    
    
    
    func messUp()//effettua 5 spostamenti di celle in fase di scombinamento
    {
        for _ in 1...numberMessUp
        {
            let pos = ButtonPos2()
            invertitore(pos1: pos[0],pos2: pos[1])
        }
    }
    
    
    
    func invertitore( pos1:Int, pos2:Int)//sposta randomicamente un bottone adiacente alla posizione vuota e viceversa
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
        }
    }
    
    
    
    func ButtonPos1(Btn : UIButton) -> [Int]//restuisce la posizione del bottone passato in input (x e y nella matrice)
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
    
    
    
    
    func ButtonPos2() -> [Int]//restuisce la posizione del bottone vuoto
    {
        var Coordinate: [Int] = [0,0]
        for pos1 in 0...3
        {
            for pos2 in 0...3
            {
                let tit = matriceButtonOrdinata[pos1][pos2].title(for: .normal)
                if(tit?.isEmpty ?? true)
                {
                    Coordinate = [pos1,pos2]
                }
            }
        }
        return Coordinate
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
    
    /*func Caricobtn(Btn:UIButton, num:Int) //in base a dove si trova il bottone gli assegno un numero
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
    }*/
}
