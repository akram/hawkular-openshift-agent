FROM inwork/docker-ruby-golang-centos

ENV GOPATH /go
RUN mkdir -p /go/src/github.com/hawkular
WORKDIR /go/src/github.com/hawkular/
RUN git clone https://github.com/hawkular/hawkular-openshift-agent.git

WORKDIR /go/src/github.com/hawkular/hawkular-openshift-agent/
RUN yum install -y which
RUN make install_glide
RUN make install_deps
RUN make build

COPY hawkular-openshift-agent $HAWKULAR_AGENT_HOME/
ENTRYPOINT ["/opt/hawkular/hawkular-openshift-agent"]
