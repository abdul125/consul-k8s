
cluster:
	k3d cluster create consul-labs \
	    -p 80:80@loadbalancer \
	    -p 443:443@loadbalancer \
	    -p 30000-32767:30000-32767@server[0] \
	    -v /etc/machine-id:/etc/machine-id:ro \
	    -v /var/log/journal:/var/log/journal:ro \
	    -v /var/run/docker.sock:/var/run/docker.sock \
	    --agents 2

namespace:
	kubectl create namespace consul
	

add-repo:
	helm repo add hashicorp https://helm.releases.hashicorp.com
	helm repo update

test:
	helm search repo hashicorp/consul


helm-install:
	helm install -f consul-values.yml hashicorp hashicorp/consul -n consul


