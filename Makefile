NEW_VER=$(shell git log -1 --pretty=%h)
dockerize:
	docker image build -t nexus.geocitizen.link:8093/repository/k8s-registry/geocitizen:$(NEW_VER) ./

push:
	docker push nexus.geocitizen.link:8093/repository/k8s-registry/geocitizen:$(NEW_VER)

deploy-green:
	kubectl get deployment geocitizen-$(CURRENT_VER) -o=yaml --namespace=geocitizen | sed -e "s/$(CURRENT_VER)/$(NEW_VER)/g" | kubectl apply --namespace=geocitizen -f -

switch:
	kubectl patch service geo-lb -p '{"spec":{"selector":{"version":"$(NEW_VER)"}}}' --namespace geocitizen

delete-blue:
	kubectl delete deployment geocitizen-$(CURRENT_VER) --namespace=geocitizen

all: dockerize push deploy-green switch delete-blue

deploy: deploy-green switch delete-blue