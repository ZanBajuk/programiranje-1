type 'a improved_list = Empty | Element of 'a array * 'a improved_list

let test = Element([|1;2;20|], Element([|17; 19; 20; 30|], Element([|100|], Empty)))
let test2 = Element([|20;10;100|], Empty)

let rec count = function
  |Empty -> 0
  |Element(x, xs) -> (Array.length x) + count xs

let rec nth list i =
  match list with
  |Empty -> None
  |Element(x, xs) -> if i <= ((Array.length x) - 1) then Some(Array.get x i) else nth xs (i - Array.length x)

let is_array_sorted v a =
  let x = ref true in
  if v > a.(0) then false else
  (for i = 0 to (Array.length a) -2 do
    if a.(i) > a.(i+1) then x:=false;
  done;
  !x)

let rec is_sorted list =
  let rec aux v list =
    match list with
    |Empty -> true
    |Element(x,xs) -> (if is_array_sorted v x then (aux x.((Array.length x) - 1) xs) else false)
  in
  match nth list 0 with
  |None -> true
  |Some x -> aux x list

let update list n el =
  let rec aux list i el =
    match list with
    |Empty -> Empty
    |Element(x, xs) -> if i <= ((Array.length x) - 1) then let c = Array.copy x in c.(i) <- el; Element(c, xs) else Element(x, aux xs (i - Array.length x) el)
  in
  aux list n el
  
    