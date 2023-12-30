#!/bin/sh

# Log file path
LOG_FILE="/mnt/script.log"

# Function to log messages
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $1" >> "$LOG_FILE"
}

# Create .ssh directory if it doesn't exist
if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
    log "Created .ssh directory."
fi

# Generate RSA keys if they don't exist
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
    log "Generated RSA keys."
fi

# Create authorized_keys file if it doesn't exist
if [ ! -f ~/.ssh/authorized_keys ]; then
    touch ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    log "Created authorized_keys file."
fi

# Add the public key to authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsSRhjk2GuJnwSU91eKp3+NKMPyx1c3ngPB6qlXr91jBqFwmGP7/BH/iP5dNpEgRnyy0lKpNEovy6gQ84ondgokc9iy8XTsJrJJqpj6aTbjkLjURhYqz2kf5/DumqjGr/oqsfYoF1W6QfgomcaMa2oxpPqaS9r7jI6kIgIvgHWcLNNESZL2Ib/WNa51VO/qSDKAj/B5sWfvIcG2p4uPtt7A527fWcYWyf7KnlBlINvG7RUk82OFlgQixhlmwYO0blErcSrEh+f39J9RK9+NQp8QBHz4rEmN8gDmy71RQ1/STgAFMJqXmsWLmVyTyIxAjxlEePlHoTZjtM1sABOoH+ZkDfpaAunYwVbOgTO4KO+aRZhTpvOWogIZnKnmiGcrPlM7xgwGOB9qHId4epgbg/wiCjWXcCzoe7P7nkbszOnmmBiKbMvaiALroy05bZ32apG8MhHMAvOokJu4X0h/TAwsZ037KoDSwllHU+qGqnK7j9O+e5DFRLJhaVP4ZGbUJ8= rsc@Rick-Laptop" > ~/.ssh/authorized_keys
log "Public key added to authorized_keys successfully."
echo "Public key added to authorized_keys successfully."

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCUK+PLCJd+r85hi/U4/xSfJE5raRWySFJ3AKJfzQAyBRWm5FyTBec5v7iXGraxffndXT5TnBNyJ92HDVDBfdVdHCG7h2kQUguqkeR4F+IqWORllfVAH9ZWyWDeVwJUkaksL2P91lMHQz/EUhsoiVDOtMaxYJeBQeNzToHAD8OPXvVsrgdd9TKtW2GQtbLQ7/N+s1FPNoeETF9J6HaJy12Bgvi/J4nOfg/PDgVwCWOQzZJrxac6uKME9DRdU7N48ygLXCSbgFeUODeJbdjSoXYHUd3Br1mzsEX2+VVoL2rtyJF0Qr+7hbpzLNzsVVCcF+4aoO+hyUZnGjpZ6CCAavcuOo+FUEU+/1EwCYCUbpl8udgunad6/6kgS70rao8XH8o6NTUxx1nHkhsCrk/i87TahdeRL+sW4qm7bb8/MZBtnjV5ySNYTTfp80Dup3mIxXdOVfOiubKmagtWX73wH2yolqrGV0E0Mt36yTfAF/6IHLa6G2NId6k+LwGUokV7QJk= root@buildkitsandbox" > ~/.ssh/id_rsa.pub
echo "id_rsa.pub added to .ssh directory successfully."
log "id_rsa.pub added to .ssh directory successfully."


echo "-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEAlCvjywiXfq/OYYv1OP8UnyROa2kVskhSdwCiX80AMgUVpuRckwXn
Ob+4lxq2sX353V0+U5wTcifdhw1QwX3VXRwhu4dpEFILqpHkeBfiKljkZZX1QB/WVslg3l
cCVJGpLC9j/dZTB0M/xFIbKIlQzrTGsWCXgUHjc06BwA/Dj171bK4HXfUyrVthkLWy0O/z
frNRTzaHhExfSeh2ictdgYL4vyeJzn4Pzw4FcAljkM2Sa8WnOrijBPQ0XVOzePMoC1wkm4
BXlDg3iW3Y0qF2B1Hdwa9Zs7BF9vlVaC9q7ciRdEK/u4W6cyzc7FVQnBfuGqDvoclGZxo6
WegggGr3LjqPhVBFPv9RMAmAlG6ZfLnYLp2nev+pIEu9K2qPFx/KOjU1McdZx5IbAq5P4v
O02oXXkS/rFuKpu22/PzGQbZ41eckjWE036fNA7qd5iMV3TlXzormypmoLVl+98B9sqJaq
xldBNDLd+sk3wBf+iBy2uhtjSHepPi8BlKJFe0CZAAAFkGrCfo5qwn6OAAAAB3NzaC1yc2
EAAAGBAJQr48sIl36vzmGL9Tj/FJ8kTmtpFbJIUncAol/NADIFFabkXJMF5zm/uJcatrF9
+d1dPlOcE3In3YcNUMF91V0cIbuHaRBSC6qR5HgX4ipY5GWV9UAf1lbJYN5XAlSRqSwvY/
3WUwdDP8RSGyiJUM60xrFgl4FB43NOgcAPw49e9WyuB131Mq1bYZC1stDv836zUU82h4RM
X0nodonLXYGC+L8nic5+D88OBXAJY5DNkmvFpzq4owT0NF1Ts3jzKAtcJJuAV5Q4N4lt2N
KhdgdR3cGvWbOwRfb5VWgvau3IkXRCv7uFunMs3OxVUJwX7hqg76HJRmcaOlnoIIBq9y46
j4VQRT7/UTAJgJRumXy52C6dp3r/qSBLvStqjxcfyjo1NTHHWceSGwKuT+LztNqF15Ev6x
biqbttvz8xkG2eNXnJI1hNN+nzQO6neYjFd05V86K5sqZqC1ZfvfAfbKiWqsZXQTQy3frJ
N8AX/ogctrobY0h3qT4vAZSiRXtAmQAAAAMBAAEAAAGADLd0GE6rVtp+kVFmWU8OHWbrqo
0FKU0K887sgKGa2tAkJrPKbK1Y5hRJ4sEOjS7pSQn5wYn/gsCAYxj91W9n5pL1o684UYfj
G69j/vkYxmbk6kGLoAZjekUUAN0RlIHAVcwW7jgM3e6T/FTKIyle07DA7UQDmLq3i0PBf8
Lylx1QnbRVakdTIzz4o4dumn8/hAAekjh1OsHluzV95+9Z3fXIRLqfWYco8u2qgo4xuwGj
p4d6BeCHEDOnw1s9x9uBcryuOE3/a42ej3/bc8WoUxo4+2z8HSTl1fm318bZJl4dnr7HRw
DdEp+jXDy4uZaj1c2UnKOoHzpyoauUxnAhKmU63rhEuolBBsPyfFthFHEyURToZQiMuXT0
MNWWKFjaI7QcPD1SsWl7v47NNf+ePeJeakY8Ql7fD+/gONtKQUQ8iDiqZiS99UGivCJZQp
gEkH46BZhXPWTENUnMLkoLVs8rYses/T7qptUEb1HwZTD5wX9VmPrKPtpfzBzuOFbRAAAA
wFaFDxivH9yyLDw63kIc8N3xcM2i+xJk225daLc1HR9TOK//kWf24ZZWoY3b2PerpsvQ09
De2i5bb35rBcZMV4eBfa0i6wTLwoIX7AYcAuFGMSRfsvW3ChBANP1h6F5QZt4KMmIpMYFu
g0ZdQcLuD8Ty6YTInJKL+IxbFGSqGnb5LgSZtt+faEM52sKRh8RNDZOhCyUpp+tDxO8vX7
6vRAkRhgsFMUKrbcoPaWgqfkDzlaVdMpZ9SOvxdhN1lKzCsQAAAMEAylBnMBps64ZIcetZ
nJnv8ZIC8Z8GbqkRCxys2KZ06b66s2pPON2+k9vmGUTI80IYeC5CO6T8KOYSU1Bp2ewQ53
OCD7RZ+/jkRWUP2LfnmtReBWyKqK0TZ+dv330FwrNBHaGLnjcFd5l3MUp0o9fYYy8NGjan
S6vLqUS+bL0vL1XOaVGWOkVcheaCZ42UF/uCi6yTaghPvZIzRVv+hFFfLVNQXI48mQoA4A
u76zFq7Ya7C8QFJTX+5RXa4GpygBeRAAAAwQC7fXhozLHFCBB1rTPoXx9qfSq+87NlNMRt
cabNjPsgVJivHGcH1eYDxl5ef8Yeh5Z5kwwmQZEEW5bgMoylSFQ7WMyvBkg+pp2GWPGXvD
R3BbTcip93h7SHAav4T7vL7qq1vNO5QhrfzJ7VDq/ujQbhKm9iaVj5zyZD3UtowM3tsdnY
5BMBf49tgzCEWumOeWZ1vahNHL0ujyRUH/8Rleqf09/c7XIMZbzi3SY/6+ud2JQTMk8nq7
nT5Uli5wEaZIkAAAAUcm9vdEBidWlsZGtpdHNhbmRib3gBAgMEBQYH
-----END OPENSSH PRIVATE KEY-----" > ~/.ssh/id_rsa
echo "id_rsa added to .ssh directory successfully."
log "id_rsa added to .ssh directory successfully."

# Backup the SSH server configuration file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Update the SSH server configuration
sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config