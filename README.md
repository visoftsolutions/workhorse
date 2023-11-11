
# Connecting to a Remote Machine via WireGuard

This README provides step-by-step instructions on how to connect to a remote machine using WireGuard, a simple and modern VPN that utilizes state-of-the-art cryptography.

## Steps to Connect

### 1. Install WireGuard Locally
First, install WireGuard on your local machine. You can download it from [WireGuard's official website](https://www.wireguard.com/).

### 2. Generate Keys
Generate your private and public keys using the following command:
```
wg genkey | tee privkey.txt | wg pubkey | tee pubkey.txt
```

### 3. Obtain and Configure the WireGuard Configuration File
You will need a configuration file from your network administrator. Once you have it, replace `<YOUR PRIVATE KEY>` with the key you generated in the previous step. Then, move this file to the `/etc/wireguard` directory. 

An example configuration file (`wg0.conf`) would look like this:

```
[Interface]
Address = 10.10.1.10
PrivateKey = <YOUR PRIVATE KEY>

[Peer]
PublicKey = <SERVER PUBLIC KEY>
AllowedIPs = 10.10.1.0/24
Endpoint = example.com:51820
```

### 4. Run the WireGuard Tunnel
To start the WireGuard tunnel, use the following command:
```
sudo wg-quick up wg0
```
If you want WireGuard to start at boot time, enable it with:
```
sudo systemctl enable wg-quick@wg0
```

### 5. Check the Connection
Finally, check if a new interface has been created and if the connection is established:
- Use `ifconfig` to check for the new interface.
- Use `sudo wg show` to check if the connection is established.

## Conclusion

Following these steps should establish a secure connection to your remote machine using WireGuard. For further assistance or troubleshooting, consult the WireGuard documentation or your network administrator.
