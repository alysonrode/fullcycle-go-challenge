FROM golang:latest as build-stage
WORKDIR /go/src/
COPY ./full-cycle-rocks.go .
RUN go build full-cycle-rocks.go

FROM scratch as runner
COPY --from=build-stage /go/src/full-cycle-rocks ./full-cycle-rocks 
CMD [ "./full-cycle-rocks" ]