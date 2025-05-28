# CIDR (Classless inter domain routing)
> used to allocate ips

# Commonly used CIDR
1. 0.0.0.0/0 - all ips
2. ww.xx.yy.zz/32 - 1 ip
3. 192.168.0.0/26 - 64 ips (192.168.0.0-192.168.0.63)

# Two components of CIDR 
Format - Base ip/Subnet mask
1. Base ip - xx.xx.xx.xx
2. Subnet mask - denotes how much bits changes in that range
> eg: /8,/16,/24,/32 will be respectively 255.0.0.0, 255.255.0.0, 255.255.255.0, 255.255.255.255
<img width="383" alt="image" src="https://github.com/user-attachments/assets/b15d90da-83e3-48ec-816d-d5414a44c655" />

# Tools:
[Find how much ip will be allocated in a CIDR block](https://cidr.xyz/)

