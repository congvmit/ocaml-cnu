let add1 = fun x y -> x + y;;
let add2 x y = x + y;;
let add3: int -> int -> int = fun a b -> a + b;;

(* Local variable inside functions *)
let locally_scoped_variables = 
  let x = 5 in
  let y = 10 in
  let z = 15 in
  x + y + z
;;


let locally_scoped_variables_with_args a b = 
  let x = 5 in
  let y = 10 in
  let z = 15 in
  x + y + z + a + b
;;


(* If then else *)
let double_least: int -> int -> int = fun x y ->
  if x < y 
  then 2 * y
  else 2 * x
;;

(* (if then) (else if then) else *)
let double_least_elif : int -> int -> int = fun x y ->
  if x < y
  then 2 * x
  else if y < x
      then 2 * y
  else x
;;

let double_least_with_prt: int -> int -> int = fun x y ->
  if x < y 
  then 2 * x
  else if x > y 
  then 2 * y
  else begin 
      Printf.printf "Equal";
      x
      end
  ;;

let double_least_with_prt_v2: int -> int -> int = fun x y ->
  if x < y 
  then 2 * x
  else if x > y 
  then 2 * y
  else ( 
      Printf.printf "Equal";
      x
  )
  ;;
