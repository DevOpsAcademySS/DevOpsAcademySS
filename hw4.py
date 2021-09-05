import sys
import rpm
ts = rpm.TransactionSet()
package = ts.dbMatch('name' ,sys.argv[1])
for hdr in package:
    print ("RELEASE.........", hdr[rpm.RPMTAG_RELEASE])