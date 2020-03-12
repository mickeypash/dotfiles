function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

function kube-prometheus () {
  kubectl port-forward --namespace prometheus $(kubectl get pod --namespace=prometheus -l app=prometheus -l component=server | tail -n 1 | awk '{print $1}') 9090 &
  sleep 1
  open "http://localhost:9090"
  fg
}

function kube-pushgateway () {
  kubectl port-forward --namespace prometheus $(kubectl get pod --namespace=prometheus -l app=prometheus -l component=pushgateway | tail -n 1 | awk '{print $1}') 9091 &
  sleep 1
  open "http://localhost:9091"
  fg
}

function kube-alertmanager () {
  kubectl port-forward --namespace prometheus $(kubectl get pod --namespace=prometheus -l app=prometheus -l component=alertmanager | tail -n 1 | awk '{print $1}') 9093 &
  sleep 1
  open "http://localhost:9093"
  fg
}

function kube-grafana () {
  kubectl port-forward --namespace grafana2 $(kubectl get pod --namespace=grafana2 -l app=grafana | tail -n 1 | awk '{print $1}') 3000 &
  sleep 1
  open "http://localhost:3000"
  fg
}

function kube-image () {
  kubectl get pods -l $1 -o jsonpath="{template.spec.containers.image}" |\
  tr -s '[[:space:]]' '\n' |\
  sort |\
  uniq -c
}

function kube-check () {
  kubectl describe pod `kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | fzf` | less
}

function kube-pods-maybe-broken () {
    # Print kube pods with a high number of restarts, or that are in a crash loop.
    kubectl get pod | awk -F ' ' '{if (($4 >= 10) || ($3 ~ ".*Crash.*")) print $0}'
}