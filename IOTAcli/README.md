# IOTAcli
a basic perl command line interface for IOTA<br/>

# Dependencies 
(on Tinkerforge RedBrick with full Image (v1.8))<br/>
<br/>
IOTAlib (see https://github.com/ifinta/IOTAlib)<br/>
IRI 0.8.0 (running on a server)<br/>
liburi-encode-perl <br/>
libjson-pp-perl <br/>
libjson-perl <br/>
libjson-rpc-perl <br/>
libterm-readkey-perl <br/>

# Usage

All script give a help, if entered without parameters...

<b>How to transmit an IOTA transaction:</b><br/>

First create with addinput and addoutput commands a bundle.<br/>
About bundle please see: <br/>
http://forum.iotatoken.com/t/micro-transaction-example/49/7 <br/>
<br/>
<b>./addinput \<filename\> \<address\> [\<value\>]</b><br/>
<br/>
\<filename\> is the filename of the temporary bundle data<br/>
\<address\> is the IOTA address of input<br/>
\<value\> is the value in IOTA's, what we will spend from this address. Must be negative.<br/>
        If omitted it will the whole balance of this address used.<br/>
<br/>
Example:<br/>
<br/>
./addinput bundle.dat PYCUDAXRCRLDN...Q9PVCUZTTZFP<br/>
<br/>
<b>./addoutput \<filename\> [\<address\> [\<value\>]]</b><br/>
<br/>
\<filename\> is the filename of the temporary bundle data<br/>
\<address\> is the IOTA address of output<br/>
          If omitted this command only shows the bundle<br/>
\<value\> is the value in IOTA's, what we will spend to this address. Must be positive<br/>
        If omitted the rest of IOTA's from inputs in this bundle will be sent to this address.<br/>
<br/>
Example:<br/>
<br/>
./addoutput bundle.dat PYCUDAXRCRLDN...Q9PVCUZTTZFP 112.5<br/>
<br/>
If the bundle is ready, then use sendtx command:<br/>
<br/>
<b>./sendtx \<URL\> \<port\> \<password\> \<filename\> [\<weight\>] [\<securityLevel\>]</b><br/>
<br/>
\<URL\> is the URL of server with IRI<br/>
\<port\> is the apiPort of IRI from configuration.iri<br/>
\<password\> is the apiPassword from configuration.iri<br/>
\<filename\> is the filename of the temporary bundle data<br/>
\<weight\> defines difficulty of PoW. default is 10<br/>
\<securityLevel\> default is 40 - with bruteforce attack 2**64 step needed to crack key through signature<br/>
<br/>
Example:<br/>
<br/>
./sendtx localhost 999 mypwd bundle.dat 10<br/>
<br/>
