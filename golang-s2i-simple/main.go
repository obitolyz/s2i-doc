package main

import (
	"flag"
	"fmt"
)

func main() {
	var user string
	var password string
	var host string
	var port int

	flag.StringVar(&user, "u", "root", "账号, 默认为root")
	flag.StringVar(&password, "p", "", "密码，默认为空")
	flag.StringVar(&host, "h", "localhost", "主机名, 默认为localhost")
	flag.IntVar(&port, "P", 3306, "端口号, 默认为3306")
	flag.Parse()

	fmt.Printf("user: %v\npassword: %v\nhost: %v\nport: %v\n", user, password, host, port)
}
