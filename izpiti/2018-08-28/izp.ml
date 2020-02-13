let razlika_kvadratov x y =
  x * x - y * y

let uporabi_na_paru f (x,y) =
  (f x, f y)

let rec ponovi_seznam n list =
  match n with
  |a when a <= 0 -> []
  |a -> list @ ponovi_seznam (n-1) list

let razdeli list =
  let rec aux neg poz list =
   match list with
   |[] -> (neg, poz)
   |x::xs -> if x < 0 then aux (x::neg) poz xs else  aux neg (x::poz) xs
  in aux [] [] list

type 'a tree = Empty | Node of 'a tree * 'a * 'a tree

(*let rec monotona_pot drevo =
  let rec aux drevo list =
    match drevo with
    |Empty -> list
    |Node (l,n,d) -> get_max 
        (aux l []) (aux d []) podmon l podmon d) ...

let rec len list =
    match list with
    |[] -> 0
    |x::xs -> 1 + len xs

let get_max (l1, l2) =
    if len l1 > len l2 then l1 else l2

(*let podmon drevo =
  let rec max_ver drevo list =
    match drevo with
    |Empty -> list
    |Node of (l, n, d) ->
        get_max (match l with
        | Empty -> n::list
        | Node of (l1,n1,d1) -> if n1 < n then max_ver l (n::list) else n::list,
        match d with
        | Empty -> n::list
        | Node of (l1,n1,d1) -> if n1 < n then max_ver d (n::list) else n::list))
*)
*)

type 'a veriga = | Filter of ('a -> bool) * 'a list * 'a veriga 
                 | Ostalo of 'a list

let prazen_filter = Filter(((>) 0), [], Filter(((>) 10), [], Ostalo([])))

let rec vstavi el veriga =
  match veriga with
  |Ostalo (x) -> Ostalo(el::x)
  |Filter (f, x, rep) -> if f el then Filter(f, el::x, rep) else Filter(f, x, vstavi el rep)

let rec poisci el veriga =
  match veriga with
  |Ostalo (x) -> List.mem el x
  |Filter (f, x, rep) -> if f el then (if List.mem el x then true else false) else poisci el rep
    
let izprazni_filtre veriga =
  let rec aux veriga =
    match veriga with
    |Ostalo (x) -> Ostalo([])
    |Filter (f, x, rep) -> Filter(f, [], aux rep)
  in
  let rec aux1 veriga list =
    match veriga with
    |Ostalo (x) -> list @ x
    |Filter (f, x, rep) -> aux1 rep (list @ x)
  in (aux veriga, aux1 veriga)

let dodaj_filter f veriga =
  let pr1 (x,y) = x
  in let pr2 (x,y) = y
  in let a = pr1 izprazni_filtre veriga
  in let b  = pr2 izprazni_filtre veriga
  in
  let sortaj list veriga =
    match list with
    |[] -> veriga
    |x::xs -> sortaj xs (vstavi x veriga)
  in
  sortaj b a



