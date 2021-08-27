import os, rpm


rpm_file = os.open("file.rpm", os.O_RDONLY)
ts = rpm.TransactionSet()
package = ts.hdrFromFdno(rpm_file)
print(package[rpm.RPMTAG_RELEASE])