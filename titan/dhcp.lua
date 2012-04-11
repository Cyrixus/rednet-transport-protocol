--[[
    dhcp.lua
    
    A DHCP server implementation for RTP. Used for dynamically assigning RP Addrs
    to computers in the network.
    
    What is DHCP?
    
    Dynamic Host Configuration Protocol (DHCP) is a network protocol that enables
    a server to automatically assign an IP address to a computer from a defined
    range of numbers (i.e., a scope) configured for a given network.

    DHCP assigns an IP address when a system is started, for example:
    
    A user turns on a computer with a DHCP client. 
    
    The client computer sends a broadcast request (called a DISCOVER or DHCPDISCOVER),
    looking for a DHCP server to answer. 
    
    The router directs the DISCOVER packet to the correct DHCP server. 
    
    The server receives the DISCOVER packet. Based on availability and usage
    policies set on the server, the server determines an appropriate address (if any)
    to give to the client. The server then temporarily reserves that address for the
    client and sends back to the client an OFFER (or DHCPOFFER) packet, with that
    address information. The server also configures the client's DNS servers, WINS
    servers, NTP servers, and sometimes other services as well. 
    
    The client sends a REQUEST (or DHCPREQUEST) packet, letting the server know
    that it intends to use the address. 
    
    The server sends an ACK (or DHCPACK) packet, confirming that the client has
    a been given a lease on the address for a server-specified period of time.
    
    Matthew DiBernardo [04.11.2012]
]]--