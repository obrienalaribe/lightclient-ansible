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
desired_count_lightnode=15
desired_count_fatclient=10
genesis_hash=9d5ea6a5d7631e13028b684a1a0078e3970caa78bd677eaecaf2160304f174fb
bootstrap_nodes = ['/dns/bootnode.1.lightclient.hex.avail.so/tcp/37000/p2p/12D3KooWBMwfo5qyoLQDRat86kFcGAiJ2yxKM63rXHMw2rDuNZMA']
full_node_ws = ['wss://rpc-hex-devnet.avail.tools/ws']
