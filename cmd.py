#!/usr/bin/python3

from subprocess import getstatusoutput as gso
import cgi

print('content-type:text/plain')
print("Access-Control-Allow-Origin: *")
print()

form_values = cgi.FieldStorage()
out = form_values.getvalue('x')
out = gso(f'sudo {out}')

print(out[1])
