import rpmfile
filename = './some_package.el6.x86_64.rpm'
rpm_f = rpmfile.open(filename)
with rpmfile.open(filename) as rpm_f:

    print("RELEASE........", rpm_f.headers['release'])