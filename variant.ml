type basic_color = 
  | Black
  | Red
  | Green
  | Blue
  ;;

let basic_color_to_int color = 
  match color with 
  | Black -> 0
  | Red -> 1
  | Green -> 2
  | Blue -> 3
  ;;

open Core;;
let color_by_number number text = 
  sprintf "\027[38;5;%dm%s\027[0m" number text;;


(* Ex *)
let blue = color_by_number (basic_color_to_int Red) "Blue";;  
basic_color_to_int Black;;


type weight = Regular | Bold;;
type color = 
  | Basic of basic_color * weight
  | RGB of int * int * int
  | Gray of int
  ;;

(* Ex *)
RGB (250, 70, 70);;
Basic (Red, Bold);;

let color_to_int = function
  | Basic (basic_color, weight) -> 
    let base =
      match weight with 
      | Bold -> 8
      | Regular -> 0
    in
    base + basic_color_to_int(basic_color)
  | RGB (r, g, b) -> 16 + b + g*6 + r*36
  | Gray i -> 232 + i
  ;;

let color_print color s = 
  printf "%s\n" (color_by_number (color_to_int color) s);;

(* Ex *)
color_print (Basic (Red, Bold)) "A bold red";;
color_print (Gray 4) "A muted gray...";;


(* Combine RECORDS and VARIANTS *)
module Log_entry = struct
  type t =  {
    session_id:string;
    time: Time.t;
    important: bool;
    message: string;
  }
end
;;

module Logon = struct
  type t = {
    session_id:string;
    time: Time.t;
    user: string;
    credentials: string;
  }
  with fields
end
;;

type client_message = 
  | Logon of Logon.t