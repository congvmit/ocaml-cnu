(* _Bool guess(int x)
{
     if (x == 42)
          return 1;
     else          
          return 0;
} *)

let guess: (int -> bool) = 
  fun x -> 
    match x with 
    | 42 -> true
    | _ -> false
  ;;

let guess x =
  match x with
  | 42 -> true
  | _ -> false
  ;;

let guess2: (int -> int -> bool) =
  fun x y ->     
    match x, y with
    | _, 42 -> true
    | 42, _ -> true
    | _, _ -> false
  ;;

(* Example 3 *)
(* Return the first item *)
let head : ('a list -> 'a option) =
  fun lst -> 
    match lst with
    | hd :: _ -> Some hd
    | [] -> None
  ;;

(* Return the last item *)
let rec tail: ('a list -> 'a option) = fun lst ->
  match lst with
  | [] -> None
  | [a] -> Some a
  | hd :: tl -> tail tl
;;

let rec length: ('a list -> int) = fun lst ->
  match lst with
  | [] -> 0 
  | hd :: tl -> 1 + length tl
;;

let example_mistake : (int -> bool) = fun x -> 
    match x with
    | 42 -> true
    | 1 -> false
  ;;

let example i = 
  match i with
  | 1 -> "one"
  | 2 -> "two"
  | 3 -> "three"
  | x -> "else"
  ;;


let rec factorial: int -> int = fun n -> 
  if n <= 1 then 1
  else n * factorial (n-1)
;;

let rec list_concatenate : string list -> string = fun lst ->
  match lst with
  | [] -> ""
  | hd :: tl -> hd ^ list_concatenate tl
;;

let rec sort lst = 
  match lst with 
  [] -> []
  | head :: tail -> insert head (sort tail)
  and insert elt lst =
    match lst with
    | [] -> [elt]
    | head :: tail -> if elt <= head then elt :: lst else head :: insert elt tail
;;

(* 
let rec is_palindrome: ('a list -> bool) = fun lst ->
  match lst with
  |  *)

type ratio = {num: int; den: int};;
let rc = {num=10;den=20};;


type 'a node = 
  | One of 'a 
  | Many of 'a node list

let rec flatten: ('a node -> 'a list) = fun node -> 
  match node with
  | One -> 
  | 

(* Later check https://abitofocaml.weebly.com/13-recursion.html *)


(* List pattern *)

(* This function could raise the exception when the given list is empty *)
let myfav_lang (my_fav :: the_rest) = 
  my_fav
  ;;

let myfav_lang: 'a list -> string = fun lst ->
  match lst with
  | first :: the_rest -> first
  | [] -> "OCaml"
  ;;


(* Remove duplicated elements *)
let rec destutter: 'a list -> 'a list = fun list ->
  match list with
  | [] -> []
  | [a] -> [a]
  | hd1 :: hd2 :: tl -> 
        if hd1 = hd2 then destutter (hd2 :: tl)
        else hd1 :: destutter (hd2 :: tl)
  ;;

let log_entry maybe_time message = 
  let time =
    match maybe_time with 
    | Some x -> x
    | None -> Time.now ()
  in
  Time.to_string time ^ " -- " ^ message
;;


let log_entry : Time.t option -> string -> string = fun maybe_time message ->
  let time =
    match maybe_time with 
    | Some x -> x
    | None -> Time.now ()
  in
  Time.to_string time ^ " -- " ^ message
;;

let x = 7 in 
    let y = [1;2;3;4] in
    match y with 
    | [] -> 1
    | hd :: tl -> hd 
    begin 
      y + x 
      (* must return 7 + 1 = 8 *)
    end
  ;;

type point2d = {x : float; y: float};;

let magnitude { x = x_pos; y = y_pos } = 
    Float.sqrt (x_pos**2. +. y_pos**2.);;
(* magnitude {x=3.; y=4.};; *)

let distance v1 v2 = magnitude {x=v1.x -. v2.x; y=v1.y -. v2.y};;


(* Records *)
type circle_desc = {center: point2d; radius: float};;
type rect_desc = { lower_left: point2d; width: float; height: float };;
type segment_desc = {endpoint1: point2d; endpoint2: point2d};;

type scene_element = 
  | Circle of circle_desc
  | Rect of rect_desc
  | Segment of segment_desc
  ;;



let is_inside_scene_element point scene_element = 
  match scene_element with
  | Circle {center; radius} -> distance center point < radius
  | Rect {lower_left; width; height} -> 
      point.x > lower_left.x && point.x < lower_left.x +. width &&
      point.y > lower_left.y && point.y < lower_left.y +. height
  | Segment {endpoint1; endpoint2} -> false
  ;;

let is_inside_scene point scene = 
  List.exists scene ~f:(fun el -> is_inside_scene_element point el)
  ;;



let rev list =
  let rec aux acc lst = 
    match  lst with
    | [] -> acc
    | h::t -> aux (h::acc) t in
  aux [] list
  ;;
  
type 'a node =
  | One of 'a
  | Many of 'a node list
  ;;


let flatten list =
  let rec aux default lst = 
    match lst with
    | [] -> default
    | One x :: t -> aux (x :: default) t
    | Many l :: t -> aux (aux default l) t 
  in
  rev (aux [] list)
;;

flatten [One 'a'; Many [One 'b'; Many [One 'c'; One 'd']; One 'e']];;


(* ---------- *)

let plusone = (fun x -> x + 1);;

(* ~f: (fun x -> x + 1);; *)

let rec find_first_stutter list = 
  match list with
  | [] | [_] -> None
  | x :: y :: tl -> 
      if x = y then Some x 
      else find_first_stutter (y::tl)
  ;;


let some_or_zero = function
  | Some x -> x
  | None -> 0
  ;;

let some_or_zero x =
  match x with
  | Some x -> x
  | None -> 0
  ;;

let some_or_default default = function
  | Some x -> x
  | None ->default
  ;;

some_or_default 3 (Some 5);;
List.map ~f:(some_or_default 100) [Some 3; None; Some 4];;


(* Labeled Arguments *)
let ratio ~num ~denom = float num /. float denom;;

ratio ~num:3 ~denom:10;;

let num = 3 in
let denom = 4 in
ratio ~num ~denom;;


let rev list =
  let rec aux acc lst = 
    match  lst with
    | [] -> acc
    | h::t -> aux (h::acc) t in
  aux [] list
  ;;

let is_palindrome : 'a list -> bool = fun lst ->
  let rev_lst = List.rev lst in
  if lst = rev_lst then true else false
  ;;

  
let is_palindrome lst = 
  if lst = rev lst then true else false
  ;;


let run_length : 'a list -> (int * 'a) list = fun lst ->
  let rec count n lst = 
    match lst with
      | [] -> []
      | [a] ->[(n, a)]
      | h1::h2::t -> 
          if h1 == h2 then count (n + 1) (h2::t)
          else (n, h1) :: count 1 (h2::t)
  in
  count 1 lst
;;


let sqrt : float -> float = fun n ->
  let x = n in
  let y = (x +. 1.)/. 2. in
  let rec aggregate : float -> float -> float -> float = fun x y n ->
    let x = y in
    let y = (x +. (n/.x)) /. 2. in
    if y < x then aggregate x y n
    else x
  in
  aggregate x y n
;;


(* (Num-2) all_primes : int -> int -> int list *)

let rec is_prime : int -> int -> bool = fun cur num ->
  let float_cur = float_of_int cur in
  let float_num = float_of_int num in
  if float_cur < sqrt(float_num) || float_cur = sqrt(float_num) then
    (if num mod cur == 0 then false
    else is_prime (cur + 1) num)      
  else true
;;

let rec all_prime : int -> int -> int list = fun st ed ->
  if st > ed then []
  else if st = ed then 
    ( if (is_prime 2 st) then [st]
      else []
    )
  else
    begin
      if (is_prime 2 st) then 
        st :: (all_prime (st+1) ed)
      else 
      (all_prime (st+1) ed)
    end
  ;;

all_prime 2 20;;
all_prime 10 50;;


(* (Logic-1) evaluate : (string * bool) list -> bool_expr -> bool *)

type bool_expr =
  |  Var of string
  |  Not of bool_expr
  |  And of bool_expr * bool_expr
  |  Or  of bool_expr * bool_expr
;;


(* 
let func_mapping: bool_expr ->  =
  match val with
  | And -> true *)

(* let convert_to_record : (string * bool) list -> 'a  *)

(* let evaluate : (string * bool) list -> bool_expr -> bool = fun lst_bool_expr bool_expr ->
  match lst_bool_expr with
  | [] -> []

  (* Dummy Mapping *)
  | Var str -> true
  | Not b_ex -> true
  | And b_ex1, b_ex2 -> true
  | Or b_ex1, b_ex2 -> true
;;
 *)



type bool_expr =
  |  Var of string
  |  Not of bool_expr
  |  And of bool_expr * bool_expr
  |  Or  of bool_expr * bool_expr
  ;;

let rec var_to_bool : (string * bool) list -> string -> bool = fun definitions query_value ->
  match definitions with
  | [] -> false (* Return false if the definition tuple is empty *)
  | head :: tails -> 
      match head with 
      | (def_key, def_val) -> if def_key = query_value then def_val else (var_to_bool tails query_value)
  ;;

let rec ops_mapping : (string * bool) list -> bool_expr ->  bool = fun definitions bool_expr ->
  match bool_expr with
  | Var value -> var_to_bool definitions value
  | Not be -> not (ops_mapping definitions be)
  | And (be1, be2) ->  (ops_mapping definitions be1) && (ops_mapping definitions be2)
  | Or (be1, be2) -> (ops_mapping definitions be1) || (ops_mapping definitions be2)
;;

let evaluate : (string * bool) list -> bool_expr -> bool = fun definitions bool_expr ->
  ops_mapping definitions bool_expr  
  ;;


(* Test *)


evaluate [("a",true); ("b",false)] (And (Or (Var "a", Var "b"), And (Var "a", Var "b")));;\
evaluate [("a",true); ("b",true)] (And (Or (Var "a", Var "b"), And (Var "a", Var "b")));;

var_to_bool [("a",true); ("b",false)] "a";;



(* =========================================================== *)
type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree
;;


let rec traverse : 'a binary_tree -> int -> 'a -> 'a = fun tree depth node_val->
  match tree with
  | Empty -> 0 
  | Node (value, lnode, rnode) -> value + sum lnode + sum rnode
;;


let rec max : 'a binary_tree -> 'a = fun tree ->
  match tree with
  | Empty -> 0 
  | Node (value, lnode, rnode) -> value + sum lnode + sum rnode
  ;;


(* ----------------- *)
let rec sum : int binary_tree -> int = fun tree ->
  match tree with
  | Empty -> 0 
  | Node (value, lnode, rnode) -> value + sum lnode + sum rnode
  ;;



sum (Node (1, Node (6, Empty, Empty), 
    Node (3, 
          Empty, 
          Node (4, Empty, Empty)))
);;


(* (BinTree-3) tostr : string binary_tree -> string *)

let rec tostr : string binary_tree -> string = fun tree ->
  match tree with 
  | Empty -> ""
  | Node  (value, Empty, Empty) -> value 
  | Node (value, lnode, rnode) -> value ^ "(" ^ tostr (lnode) ^ "," ^ tostr (rnode) ^ ")"
  ;;

tostr Empty;;
tostr (Node ("a", Empty, Empty));;
tostr (Node ("a", Empty, (Node ("b", Empty, Empty))));;
tostr (Node ("a", Node ("b", Empty, Empty), Node ("c", Empty, (Node ("d", Empty, Empty)))))