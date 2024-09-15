# Kubernetes Tools

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Docker](https://img.shields.io/badge/Docker%20Hub-bcochofel%2Fkube--tools-blue)](https://hub.docker.com/r/bcochofel/kube-tools)

[![GitHub license](https://img.shields.io/github/license/bcochofel/kube-tools.svg)](https://github.com/bcochofel/kube-tools/blob/master/LICENSE)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/bcochofel/kube-tools)](https://github.com/bcochofel/kube-tools/tags)
[![GitHub issues](https://img.shields.io/github/issues/bcochofel/kube-tools.svg)](https://github.com/bcochofel/kube-tools/issues/)
[![GitHub forks](https://img.shields.io/github/forks/bcochofel/kube-tools.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/bcochofel/kube-tools/network/)
[![GitHub stars](https://img.shields.io/github/stars/bcochofel/kube-tools.svg?style=social&label=Star&maxAge=2592000)](https://github.com/bcochofel/kube-tools/stargazers/)

Container image with Kubernetes tools.

## List of tools

The container supports the following tools:

- [arkade](https://github.com/alexellis/arkade)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [kustomize](https://github.com/kubernetes-sigs/kustomize)
- [helm](https://helm.sh/docs/intro/install/)
- [kubeconform](https://github.com/yannh/kubeconform)
- [kube-score](https://github.com/zegl/kube-score)
- [kubernetes-validate](https://github.com/willthames/kubernetes-validate)
- [yamllint](https://pypi.org/project/yamllint/)
- [polaris](https://github.com/FairwindsOps/polaris)
- [trivy](https://github.com/aquasecurity/trivy)
- [pre-commit](https://pre-commit.com/)

## Build Container

To build the container run:

```bash
docker build . -t kube-tools:latest
```

The Dockerfile uses build args, so if you want to build the image with specific version of kubectl, for instance, you can run

```bash
docker build . --build-arg KUBECTL_VERSION=1.30.0 -t kube-tools:latest
```

## Test Container

You can test the container by running

```bash
docker run -it kube-tools:latest kubectl version
```

## References

- [GitHub Actions - Dockerfile support](https://docs.github.com/en/actions/sharing-automations/creating-actions/dockerfile-support-for-github-actions)