(* Exercises

(List-1) last : 'a list -> 'a option

  - last [1;2;3] ==> Some 3
  - last ['1';'2';'3'] ==> Some '3'
  - last [] ==> None

  (Do not use the list library.)

[SOLUTION] *)


let rec tail: ('a list -> 'a option) =
  fun lst ->
    match lst with
    | [] -> None
    | [a] -> Some a
    | hd :: tl -> tail tl
  ;;

let x = [1;2;3];;
tail x;;