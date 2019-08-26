cache restore $SEMAPHORE_PROJECT_NAME-deps

if [ ! -d '/packages' ]; then
  sudo mkdir -p /packages/go
  sudo mkdir -p /packages/kubebuilder
  wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
  sudo tar -xvf go1.12.7.linux-amd64.tar.gz -C /packages/go
  curl -sL https://go.kubebuilder.io/dl/latest/${os}/${arch} | tar -xz
  sudo cp -r /tmp/kubebuilder_master_${os}_${arch} /packages/kubebuilder
  cache store $SEMAPHORE_PROJECT_NAME-deps /packages
  # wget https://go.kubebuilder.io/dl/latest/${os}/${arch} -O /packages
  # sudo tar -xvf go1.12.7.linux-amd64.tar.gz -C /packages/go
  # sudo cp go/bin/go /usr/local/bin
  # sudo rm -rf /usr/local/go
  # sudo mv go /usr/local
  # # go version
  # # which go
  # # mkdir -p ~/go/bin
  # export os=$(go env GOOS)
  # export arch=$(go env GOARCH)
  # # download the release
  # curl -sL https://go.kubebuilder.io/dl/latest/${os}/${arch} | tar -xz -C /packages
  # sudo cp -r /tmp/kubebuilder_master_${os}_${arch} /packages/kubebuilder
  #
  # export PATH=$PATH:/usr/local/kubebuilder/bin
fi
