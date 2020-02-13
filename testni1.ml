type 'a mm_drevo = 
  | Node of 'a mm_drevo * 'a * int * 'a mm_drevo
  | Empty

  
type 'a gnezdenje =
  | Element of 'a
  | Podseznam of 'a gnezdenje list