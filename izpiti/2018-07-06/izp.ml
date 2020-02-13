let uporabi f a = f a

let ibaropu a f = f a

let zacetnih n xs =
  let rec aux acc n xs =
    match (n, xs) with
    |(0, _) -> acc
    |(n, []) -> aux (None::acc) (n-1) []
    |(n, a::aa) -> aux ((Some a)::acc) (n-1) aa
  in
  aux [] n xs

type 'a neprazen_sez = Konec of 'a | Sestavljen of 'a * 'a neprazen_sez

let prvi = function
  |Konec x -> x
  |Sestavljen (x,_) -> x

let rec zadnji = function
  |Konec x -> x
  |Sestavljen (_, x) -> zadnji x

let rec dolzina = function
  |Konec x -> 1
  |Sestavljen (_, x) -> 1 + dolzina x

let rec pretvori_v_seznam = function
  |Konec x -> [x]
  |Sestavljen (x, t) -> x::(pretvori_v_seznam t)

let zlozi f el ns = 
  let rec aux acc f ns =
    match ns with
    |Konex x -> f acc x
    |Sestavljen (x,t) -> aux (f acc x) f t
    