let odstej_trojici (a, b, c) (d, e, f) =
  (a - d, b - e, c - f)

let rec max_rezultat_do_n f n =
  let rec aux acc f n =
    match n with
    | a when a <= 0 -> if acc > (f 0) then acc else (f 0)
    | a -> if acc > (f a) then aux acc f (n-1) else aux (f a) f (n-1)
  in
  aux (f n) f (n-1)

let ff n = -n

let pocisti_seznam list =
  let rec aux acc list =
    match list with
    |[] -> acc
    |x::xs -> (match x with
                |None -> (aux acc xs)
                |Some (a) -> (aux (a::acc) xs))
  in
  aux [] list

let preveri_urejenost l =
  let rec aux l so li =
    match l with
    | [] -> true
    | x::xs -> if (x mod 2) = 1 then
                    (match li with
                    |[] -> aux xs so (x::li)
                    |a::aa -> if x < a then aux xs so (x::li) else false)
                else
                  (match so with
                  |[] -> aux xs (x::so) li
                  |a::aa -> if x > a then aux xs (x::so) li else false)
  in
  aux l [] []