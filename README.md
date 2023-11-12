# Generating an SSH Key (Ed25519)

This guide provides instructions on how to generate an Ed25519 SSH key for secure access to remote systems.

## Steps to Generate an Ed25519 SSH Key

1. **Open Terminal**: Open your terminal or command line interface.

2. **Generate the SSH Key**: Execute the command:

```
ssh-keygen -t ed25519
```

3. **Save the Key**: When prompted to "Enter a file in which to save the key," press Enter to save it to the default location, typically `~/.ssh/id_ed25519`.

4. **Enter a Secure Passphrase** (optional): You may be prompted to enter a passphrase. While optional, this adds an extra layer of security.

5. **Copy the SSH Key**: To print the public key to your terminal, use:

```
cat ~/.ssh/id_ed25519.pub
```

6. **Add the SSH Key to Your Remote Machine**: Access your remote machine and add the public key to the `~/.ssh/authorized_keys` file.

## Conclusion

You have now successfully generated an Ed25519 SSH key, enhancing your security for remote system access.

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
