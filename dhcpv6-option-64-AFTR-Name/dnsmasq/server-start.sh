# encoding for aftr.malte.pl (see https://tools.ietf.org/html/rfc6334#section-3 for details )
ENCODED_AFTR_FQDN="04:61:66:74:72:05:6d:61:6c:74:65:02:70:6c:00" 

# append the AFTR address like so:
# --dhcp-option=option6:64,${ENCODED_AFTR_FQDN}

ip netns exec $serverns \
    dnsmasq -d \
    --dhcp-range=lan,192.0.2.100,192.0.2.200,10m \
    --enable-ra --dhcp-range=lan,2001:db8::1:0,2001:db8::2:0,10m \
    --dhcp-option=option6:64,${ENCODED_AFTR_FQDN}