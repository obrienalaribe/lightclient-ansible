[bootnode]
%{ for bootnode in jsondecode(bootnode) ~}
${bootnode.hostname} ansible_host=${bootnode.ip}
%{ endfor ~}

[lightnode]
%{ for lightnode in jsondecode(lightnodes) ~}
${lightnode.hostname} ansible_host=${lightnode.ip}
%{ endfor ~}

[fatclient]
%{ for fatclient in jsondecode(fatclients) ~}
${fatclient.hostname} ansible_host=${fatclient.ip}
%{ endfor ~}

[otel]
%{ for otel in jsondecode(otel) ~}
${otel.hostname} ansible_host=${otel.ip}
%{ endfor ~}

[all:vars]
ansible_ssh_private_key_file=${network}_key
ansible_user=root
network=${network}
desired_count_lightnode=12
desired_count_fatclient=8
genesis_hash=d3d2f3a3495dc597434a99d7d449ebad6616db45e4e4f178f31cc6fa14378b70
bootstrap_nodes = ['/dns/bootnode.1.lightclient.turing.avail.so/tcp/37000/p2p/12D3KooWBkLsNGaD3SpMaRWtAmWVuiZg1afdNSPbtJ8M8r9ArGRT']
full_node_ws = ['wss://turing-rpc.avail.so/ws']
