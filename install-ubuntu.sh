apt-get update && apt-get -y install zsh curl git vim less ssh

curl -sfL https://raw.githubusercontent.com/getantibody/installer/master/install | sh -s - -b /usr/local/bin

# Install kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl

# Install kubectx (Switch between Kubernetes contexts/namespaces)
curl -sSL http://github.com/ahmetb/kubectx/archive/v0.9.1.tar.gz | tar -C /tmp -xz
cp /tmp/kubectx-0.9.1/kubectx /usr/local/bin/kubectx
cp /tmp/kubectx-0.9.1/kubens /usr/local/bin/kubens

# Install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
 | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt-get update
apt-get install gh

echo "ZDOTDIR=$HOME/.home" > $HOME/.zshenv
