#!/usr/bin/env python
import psutil
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-w", "--warning",
                    help="Percent of RAM usage for WARNING message", type=float, default=70.0)
parser.add_argument("-c", "--critical",
                    help="Percent of RAM usage for CRITICAL message", type=float, default=90.0)

args = parser.parse_args()
ram_usage = psutil.virtual_memory().percent

if args.warning < 0 or args.warning > 100:
    print('WARNING: You entered warning percent out of range 0-100')
    print('Setiting value to default -w 70')
    args.warning = 70
if args.critical < 0 or args.critical > 100:
    print('WARNING: You entered critical percent out of range 0-100')
    print('Setiting value to default -c 90')
    args.critical = 90
if args.warning > args.critical:
    print(f'WARNING: You entered -w {args.warning} > -c {args.critical}')
    args.warning, args.critical = args.critical, args.warning
    print(
        f'Swapping values beetween warning and critical to -w {args.warning} and -c {args.critical}')

if ram_usage < args.critical:
    if ram_usage < args.warning:
        print(f"OK:  RAM usage is {ram_usage}%")
        exit(0)
    print(f"WARNING: RAM usage is {ram_usage}%")
    exit(1)
print(f"CRITICAL:  RAM usage is {ram_usage}%")
exit(2)
