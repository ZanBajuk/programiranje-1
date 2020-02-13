type complex = { re : float; im : float }

let complex_add x y = { re = x.re +. y.re ; im = x.im +. y.im }

let complex_conjugate x = { re = x.re ; im = -1. *. x.im}

let rec list_apply_either pred f g xs =
  match xs with
  |[] -> []
  |a::aa -> if pred a then (f a)::(list_apply_either pred f g aa) else (g a)::(list_apply_either pred f g aa)

let ex x n =
    let rec aux acc x n =
      match n with
      |0 -> acc
      |a -> aux (acc * x) x (a - 1)
    in
    aux 1 x n

let eval_poly l a =
  let rec aux acc ctr l a =
    match l with
    |[] -> acc
    |x::xs -> aux (acc + x * (ex a ctr)) (ctr + 1) xs a
  in
  aux 0 0 l a

type najemnik = string

type vrt = Obdelovan of najemnik
            | Oddan of najemnik * (vrt * vrt list)
            | Prost

(*\item najemnik Galois svoj del obdeluje
\item najemnik Lagrange svoj del obdeluje
\item preostali del je prost*)

let vrt_primer = Oddan ("Kovalevskaya" ,
                  (Obdelovan "Galois",
                   Prost ::
                   [Obdelovan "Lagrange"] ))

let obdelovalec_vrta = function
  |Obdelovan x -> Some x
  |_ -> None