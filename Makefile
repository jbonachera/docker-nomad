build:: agent

server::
	docker build -t jbonachera/nomad -f Dockerfile.server .

agent:: server
	docker build -t jbonachera/nomad-agent -f Dockerfile.agent .
