From man dhclient.conf:

```
LEASE REQUIREMENTS AND REQUESTS
       The DHCP protocol allows the client to request that the server send it specific information, and not send it other information that it is not prepared to  accept.   The  protocol
       also allows the client to reject offers from servers if they don't contain information the client needs, or if the information provided is not satisfactory.

       There is a variety of data contained in offers that DHCP servers send to DHCP clients.  The data that can be specifically requested is what are called DHCP Options.  DHCP Options
       are defined in
        dhcp-options(5).

       The request statement

        [ also ] request [ [ option-space . ] option ] [, ... ];

       The request statement causes the client to request that any server responding to the client send the client its values for the specified options.  Only the option names should be
       specified in the request statement - not option parameters.  By default, the DHCPv4 client requests the subnet-mask, broadcast-address, time-offset, routers, domain-name, domain-
       name-servers and host-name options while the DHCPv6 client requests the dhcp6 name-servers and domain-search options.  Note that if you enter a ´request´ statement, you over-ride
       these defaults and these options will not be requested.

       In some cases, it may be desirable to send no parameter request list at all.  To do this, simply write the request statement but specify no parameters:

            request;

       In  most cases, it is desirable to simply add one option to the request list which is of interest to the client in question.  In this case, it is best to ´also request´ the addi‐
       tional options:

            also request domain-search, dhcp6.sip-servers-addresses;
```

From man dhcp-options:

```
       option dhcp6.aftr-name domain-name;
         A domain name of the AFTR tunnel endpoint.
         This option is included based on RFC 6334.
```
