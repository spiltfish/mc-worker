FROM golang
RUN mkdir /mc-worker
ADD . /mc-worker
WORKDIR /mc-worker
RUN go get 	github.com/husobee/vestigo \
    && go get encoding/json \
    && go get google.golang.org/api/compute/v1 \
    && go get golang.org/x/oauth2/google \
    && go get golang.org/x/net/context \
    && go get gopkg.in/yaml.v2
RUN go build -o main .
CMD ["/mc-worker/main"]