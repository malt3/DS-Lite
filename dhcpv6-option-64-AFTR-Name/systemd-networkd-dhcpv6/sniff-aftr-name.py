#!/usr/bin/env python3
# This script will sniff network traffic on the interface provided via ARGV[1]
# and search through all dhcpv6 replies for the DHCPv6 option code 64
# if the option is found, the AFTR name is decoded
# You need to have scapy installed for this to work (https://scapy.readthedocs.io/en/latest/installation.html)
 
from sys import argv
from os import system
from scapy.all import *

def decode_domain_name(encoded):
    idx = 0
    decoded = ""
    while encoded[idx] != 0:
        if (idx > 0):
            decoded += "."
        decoded += encoded[idx+1:idx+encoded[idx]+1].decode()
        idx += encoded[idx]+1
    return decoded
 
def expand(x):
    yield x
    while x.payload:
        x = x.payload
        yield x
 
def handle_pkt(pkt):
    if (DHCP6_Reply in pkt):
        for opt in list(expand(pkt[DHCP6_Reply])):
            if (opt.optcode == 64):
                aftr_name = decode_domain_name(opt.data)
                # here we can do something with the aftr_name
                system(f"extract_aftr_name {argv[1]} {aftr_name}")
 
 
if __name__ == "__main__":
    if len(argv) <= 2:
        print(f"Usage: {argv[0]} <interface>")
    sniff(iface=argv[1], prn = handle_pkt, filter="(udp port 546 or 547)", store=0)