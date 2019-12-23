(* =================== *)
(* 1. naloga: funkcije *)
(* =================== *)

let is_root (a, b) =
    if (a*a) = b then true else false 

let pack3 a b c = (a, b ,c)

let sum_if_not f lst =
    let rec aux f lst acc =
        match lst with
        |[] -> acc
        |x::xs -> if not (f x) then (aux f xs (x+acc)) else (aux f xs acc)
    in aux f lst 0

let obrni lst1 =
    let rec aux lst1 acc=
    match lst1 with
    |[]->acc
    |x::xs->aux xs (x::acc)
    in aux lst1 []

let applyf lst1 el =
    let rec aux lst1 el acc =
        match lst1 with
        |[]-> obrni acc
        |f::fs-> aux (fs) (el) ((f el) :: acc)
    in aux lst1 el []


let apply lst1 lst2 =
    let rec aux lst1 lst2 acc =
        match lst2 with
        |[]-> obrni acc
        |x::xs -> aux lst1 xs ((applyf lst1 x) :: acc)
    in aux lst1 lst2 []

(* ======================================= *)
(* 2. naloga: podatkovni tipi in rekurzija *)
(* ======================================= *)

type vrsta_srecanja = Predavanja | Vaje

type predmet = Analiza2a | Programiranje1 | Algebra2

type trajanje = Ura of int

type srecanje = {predmet : predmet ; vrsta : vrsta_srecanja ; trajanje : trajanje}

type urnik = Urnik of srecanje list list

let vaje = {predmet = Analiza2a; vrsta = Vaje; trajanje = (Ura 3)}
let predavanje = {predmet = Programiranje1; vrsta = Predavanja; trajanje = (Ura 2)}

let urnik_profesor = Urnik [[{predmet = Programiranje1; vrsta = Vaje; trajanje = (Ura 2)}];[];[{predmet = Algebra2; vrsta = Predavanja; trajanje = (Ura 1)}];[];[];[{predmet = Programiranje1; vrsta = Vaje; trajanje = (Ura 1)}];[]]

let rec ure_v_dnevu dan =
    let rec aux dan acc =
        match dan with
        |[] -> acc
        |x :: xs -> (match x.trajanje with
                        |Ura n -> aux xs (n + acc))
    in aux dan 0

let rec je_preobremenjen urnk =
    match urnk with
        |Urnik ([]) -> false
        |Urnik (x :: xs) -> if (ure_v_dnevu x) > 5 then true else je_preobremenjen (Urnik (xs))

let ura_v_int (Ura a) = a

let denar_na_dan dan =
    let rec aux dan acc =
        match dan with
        |[] -> acc
        |x :: xs -> if x.vrsta = Vaje then (aux xs (acc + (ura_v_int x.trajanje))) else (aux xs (acc + ((ura_v_int x.trajanje) * 2)))
    in
    aux dan 0

let bogastvo urnk =
    let rec aux urnk acc =
        match urnk with
            |Urnik([]) -> acc
            |Urnik(x :: xs) -> aux (Urnik xs) (acc + denar_na_dan x)
    in aux urnk 0