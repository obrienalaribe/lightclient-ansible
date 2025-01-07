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
desired_count_lightnode=50
desired_count_fatclient=20
genesis_hash=b91746b45e0346cc2f815a520b9c6cb4d5c0902af848db0a80f85932d2e8276a
bootstrap_nodes = ['/dns/bootnode.1.lightclient.mainnet.avail.so/tcp/37000/p2p/12D3KooW9x9qnoXhkHAjdNFu92kMvBRSiFBMAoC5NnifgzXjsuiM']
full_node_ws = ["wss://mainnet.avail-rpc.com/", "wss://avail-mainnet.public.blastapi.io/", "wss://mainnet-rpc.avail.so/ws"]
