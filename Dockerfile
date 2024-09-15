FROM python:alpine3.20
LABEL maintainer="Bruno Cochofel <bruno.cochofel@gmail.com>"

ARG ARKADE_VERSION=0.11.23
ARG KUBECTL_VERSION=1.31.1
ARG KUSTOMIZE_VERSION=5.4.3
ARG HELM_VERSION=3.16.1
ARG KUBE_SCORE_VERSION=1.18.0
ARG KUBECONFORM_VERSION=0.6.7
ARG KUBERNETES_VALIDATE_VERSION=1.30.0
ARG YAMLLINT_VERSION=1.35.1
ARG POLARIS_VERSION=9.3.0
ARG TRIVY_VERSION=0.55.0
ARG PRECOMMIT_VERSION=3.8.0

# install dependencies
RUN apk --no-cache --update add \
  sudo \
  bash \
  git \
  openssh \
  curl \
  zip && \
  rm -rf /var/cache/apk/*

ENV INSTALL_DIR=/usr/local/bin/

ENV TMPDIR=/usr/local/app
RUN mkdir -p ${TMPDIR}

# install arkade
RUN curl -s -Lo arkade https://github.com/alexellis/arkade/releases/download/${ARKADE_VERSION}/arkade && \
  chmod +x arkade && \
  mv arkade ${INSTALL_DIR}

# install kubectl
RUN curl -s -Lo kubectl https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/local/bin

# install kustomize
RUN curl -s -Lo kustomize.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz && \
  tar xzf kustomize.tar.gz && \
  chmod +x kustomize && \
  mv kustomize /usr/local/bin

# install helm
RUN curl -s -Lo helm.tar.gz https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
  tar xzf helm.tar.gz && \
  chmod +x linux-amd64/helm && \
  mv linux-amd64/helm /usr/local/bin && \
  rm -rf linux-amd64/

# install kube-score
RUN curl -s -Lo kube-score https://github.com/zegl/kube-score/releases/download/v${KUBE_SCORE_VERSION}/kube-score_${KUBE_SCORE_VERSION}_linux_amd64 && \
  chmod +x kube-score && \
  mv kube-score /usr/local/bin

# install polaris
RUN curl -s -Lo polaris.tar.gz https://github.com/FairwindsOps/polaris/releases/download/${POLARIS_VERSION}/polaris_linux_amd64.tar.gz && \
  tar xzf polaris.tar.gz && \
  chmod +x polaris && \
  mv polaris /usr/local/bin && \
  rm -rf LICENSE README.md

# install kubeconform
RUN curl -s -Lo kubeconform.tar.gz https://github.com/yannh/kubeconform/releases/download/v${KUBECONFORM_VERSION}/kubeconform-linux-amd64.tar.gz && \
  tar xzf kubeconform.tar.gz && \
  rm -f kubeconform.tar.gz LICENSE && \
  chmod +x kubeconform && \
  mv kubeconform /usr/local/bin

# install trivy
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v${TRIVY_VERSION}

# install yamllint
RUN pip3 install yamllint==${YAMLLINT_VERSION}

# install kubernetes-validate
RUN pip3 install kubernetes-validate==${KUBERNETES_VALIDATE_VERSION}

# install pre-commit
RUN pip3 install pre-commit==${PRECOMMIT_VERSION}

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
