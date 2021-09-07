import rpmfile, sys

rpm_file = sys.argv[1]
print(rpmfile.open(rpm_file).headers['release'])
