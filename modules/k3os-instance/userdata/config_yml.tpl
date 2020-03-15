#cloud-config
%{ if hostname != "" ~}
hostname: "${hostname}"
%{ endif ~}
%{ if length(ssh_authorized_keys) > 0 ~}
ssh_authorized_keys:
%{ for sshkey in ssh_authorized_keys ~}
- "${sshkey}"
%{ endfor ~}
%{ endif ~}
k3os:
%{ if rancher_password != "" ~}
  password: "${rancher_password}"
%{ endif ~}
%{ if token != "" ~}
  token: "${token}"
%{ endif ~}
%{ if server_url != "" ~}
  server_url: "${server_url}"
%{ endif ~}
%{ if length(modules) > 0 ~}
  modules:
%{ for module in modules ~}
  - ${module}
%{ endfor ~}
%{ endif ~}
%{ if length(data_sources) > 0 ~}
  data_sources:
%{ for data_source in data_sources ~}
  - ${data_source}
%{ endfor ~}
%{ endif ~}
%{ if length(dns_nameservers) > 0 ~}
  dns_nameservers:
%{ for dns_nameserver in dns_nameservers ~}
  - "${dns_nameserver}"
%{ endfor ~}
%{ endif ~}
%{ if length(ntp_servers) > 0 ~}
  ntp_servers:
%{ for ntp_server in ntp_servers ~}
  - "${ntp_server}"
%{ endfor ~}
%{ endif ~}
%{ if length(k3s_args) > 0 ~}
  k3s_args:
%{ for k3s_arg in k3s_args ~}
  - "${k3s_arg}"
%{ endfor ~}
%{ endif ~}
%{ if length(taints) > 0 ~}
  taints:
%{ for taint in taints ~}
  - "${taint}"
%{ endfor ~}
%{ endif ~}
%{ if length(keys(sysctl)) > 0 ~}
  sysctl:
%{ for key in keys(sysctl) ~}
    ${key}: "${sysctl[key]}"
%{ endfor ~}
%{ endif ~}
%{ if length(wifi) > 0 ~}
  wifi:
%{ for i in wifi ~}
%{ for key in keys(i) ~}
%{ if key == "name" ~}
  - ${key}: "${i[key]}"
%{ else ~}
    ${key}: "${i[key]}"
%{ endif ~}
%{ for key in keys(i) ~}
%{ endfor ~}
%{ endfor ~}
%{ endfor ~}
%{ endif ~}
%{ if length(keys(labels)) > 0 ~}
  labels:
%{ for key in keys(labels) ~}
    ${key}: "${labels[key]}"
%{ endfor ~}
%{ endif ~}
%{ if length(keys(environment)) > 0 ~}
  environment:
%{ for key in keys(environment) ~}
    ${key}: "${environment[key]}"
%{ endfor ~}
%{ endif ~}