let rec insert x list =
    match list with
    | [] -> [x]
    | y::xs -> if (x < y) then (x :: y :: xs) else y :: (insert x xs)

let rec sort list =
    match list with
    |[] -> []
    |x :: xs -> insert x (sort (xs))

let rec better_insert x list f =
    match list with
        | [] -> [x]
        | y::xs -> if (f x y) then (x :: y :: xs) else y :: (better_insert x xs f)

let rec better_sort list f =
    match list with
    |[] -> []
    |x :: xs -> better_insert x (better_sort (xs) f) f

type priority =
    |Top
    |Group of int

type status =
    |Staff
    |Passenger of priority

type flyer = { status : status ; name : string}

let flyers = [ {status = Staff; name = "Quinn"}
             ; {status = Passenger (Group 0); name = "Xiao"}
             ; {status = Passenger Top; name = "Jaina"}
             ; {status = Passenger (Group 1000); name = "Aleks"}
             ; {status = Passenger (Group 1000); name = "Robin"}
             ; {status = Staff; name = "Alan"}
             ]

let f x y =
    match (x.status, y.status) with
    | (Staff, _) -> true
    | (_, Staff) -> false
    | (Passenger n, Passenger m) ->
        (match (n, m) with
            | (Top, _) -> true
            | (_, Top) -> false
            | (Group a, Group b) -> if a <= b then true else false)

let potniki lst =
    better_sort lst f

let sestej a b =
    a + b

let rec vsem_pristej_pet lst =
    match lst with
    |[] -> []
    |x::xs -> (x+5) :: vsem_pristej_pet xs

let zadnji = function (a, b, c) -> c
    
let kompozitum f g =
    let aux f g x =
        f (g x)
    in aux f g

type 'a drevo = Prazen | Gozd of 'a * 'a drevo

