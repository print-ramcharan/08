#!/usr/bin/env bash
set -euo pipefail
sudo apt-get update
sudo apt-get install -y docker.io curl
sudo systemctl enable --now docker
if ! command -v minikube >/dev/null 2>&1; then
  ARCH="$(dpkg --print-architecture)"
  curl -fLO "https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-${ARCH}"
  sudo install "minikube-linux-${ARCH}" /usr/local/bin/minikube
  rm -f "minikube-linux-${ARCH}"
fi
minikube start --driver=docker
docker build -t react-lab:v1 .
minikube image load react-lab:v1
minikube kubectl -- apply -f deployment.yaml
minikube kubectl -- rollout status deployment/react-lab
minikube kubectl -- get pods,services
echo "Open the service with: minikube service react-lab"
minikube service react-lab
