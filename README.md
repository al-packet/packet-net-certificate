# packet-net-certificate
Use Let's Encrypt to generate a wildcard certificate for *.packet.net

This tool will build a simple container and populate it with a couple of simple scripts that will allow you to use Let's Encrypt to generate a wildcard certificate for *.packet.net.

Note: we will use DNS authorization with Let's Encrypt.  This means that the user will place some custom TXT records in the DNS server for Let's encrypt to validate that they own/control the domain.

Let's encrypt will generate the random validation data and provide instructions on what to do.

Checkout this repo.  
cd to the directory it created.
read the README.howto file.

When finished the generated certs will be saved in a directory called *local-etc*

Check back in the updated files (in local-etc)

Questions/Comments Al Hopper   al@packet.com


