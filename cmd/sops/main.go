package main //import "github.com/tozd/sops/v3/cmd/sops"

import (
	"os"

	"github.com/tozd/sops/v3/cmd/mainimpl"
)

func main() {
	mainimpl.Main(os.Args)
}
