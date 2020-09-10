open Core;;

type host_info = {
  hostname: string;
  os_name: string;
  cpu_arch: string;
  os_release: string;
  timestamp: Time.t;
};;

let host_info_to_string {hostname=h; os_name=os; cpu_arch=c; timestamp=ts} =
  sprintf "%s (%s/%s, on %s)" h os c (Time.to_string ts);;
