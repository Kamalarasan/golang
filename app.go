package main

import (
        "fmt"
        "net/http"
        "time"
)

func main() {
        started := time.Now()
        http.HandleFunc("/",
                func(c http.ResponseWriter, req *http.Request) {
                        c.Write([]byte("hi"))
                })
        http.HandleFunc("/data",
                func(c http.ResponseWriter, req *http.Request) {
                        c.Write([]byte("data is here"))
                })
        http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
                duration := time.Since(started)
                if duration.Seconds() > 30 {
                        w.WriteHeader(500)
                        w.Write([]byte(fmt.Sprintf("error: %v", duration.Seconds())))
                } else {
                        w.WriteHeader(200)
                        w.Write([]byte("ok"))
                }
        })
        err := http.ListenAndServe(":8080", nil)
        panic(err)
}
