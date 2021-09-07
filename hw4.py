from sys import argv
import rpmfile
def rpmversion(rpmpack_name):
    with rpmfile.open(rpmpack_name) as rpm_file:
        print("RELEASE........", rpm_file.headers['release'])

if __name__ == '__main__':
    rpmversion(argv[1])
