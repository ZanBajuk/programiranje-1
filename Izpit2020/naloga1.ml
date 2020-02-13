let option_sum a b =
  match (a, b) with
  |(Some x, Some y) -> Some (x+y)
  |_ -> None

let twostep_map f g h x =
  match f x with
  | (a, b) -> (g a, h b)

let function_repeat f list =
  let rec aux acc f list ctr el=
    match (ctr, el) with
    |(n, _) when n<= 0 -> (match list with
                |[] -> acc
                |x::xs -> aux acc f xs (f x) x)
    |(n, e) -> aux (el::acc) f list (ctr -1) e
  in
  match list with
  |[] -> []
  |x::xs -> List.rev (aux [] f list 0 x)
  (*Je repno rekurzivna ker je aux očitno repno rekurziven in je List.rev repno rekurziven*)

let rec iterate f z a =
  if z a then a else iterate f z (f a)

