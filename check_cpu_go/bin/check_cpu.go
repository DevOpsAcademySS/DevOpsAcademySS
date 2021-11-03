package main

import (
	"flag"
	"fmt"
	"os"
	"time"

	"github.com/shirou/gopsutil/cpu"
)

func main() {
	warning := flag.Float64("w", 70, "Percent fo CPU usage for WARNING")
	critical := flag.Float64("c", 90, "Percent fo CPU usage for CRITICAL")
	flag.Parse()
	if *warning < 0 || *warning > 100 {
		fmt.Printf("WARNING: You entered -w=%3.2f out of range 0-100\n", *warning)
		*warning = 70
		fmt.Printf("Setting value to default -w=%3.2f\n", *warning)
	}
	if *critical < 0 || *critical > 100 {
		fmt.Printf("WARNING: You entered -c=%3.2f out of range 0-100\n", *critical)
		*critical = 90
		fmt.Printf("Setting value to default -c=%3.2f\n", *critical)
	}
	if *critical < *warning {
		fmt.Printf("WARNING: You entered -w=%3.2f > -c=%3.2f\n", *warning, *critical)
		*warning, *critical = *critical, *warning
		fmt.Printf("Swapping values between warning and critical to -w=%3.2f and -c=%3.2f0\n", *warning, *critical)
	}

	percent, _ := cpu.Percent(time.Second, false)
	if percent[0] < *critical {
		if percent[0] < *warning {
			fmt.Printf("OK: CPU usage is %3.2f%% \n", percent[0])
			os.Exit(0)
		}
		fmt.Printf("WARNING: CPU usage is %3.2f%% \n", percent[0])
		os.Exit(1)
	}
	fmt.Printf("CRITICAL: CPU usage is %3.2f%%\n", percent[0])
	os.Exit(2)
}
