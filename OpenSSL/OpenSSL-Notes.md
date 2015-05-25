# OpenSSL Notes
## 1. Preparation
Create work directory.

    $ mkdir MyCerts
    $ cd MyCerts

Initialize demoCA directory.

    $ mkdir demoCA
    $ mkdir demoCA/newcerts demoCA/private
    $ chmod 700 demoCA/private
    $ touch demoCA/index.txt
    $ echo 1000 > demoCA/serial

## 2. Generate root CA certificate
Create a directory to store all files related to the root CA certificate.

    $ mkdir MyCA

Generate a CA private key of length 4096 bits. You will be prompted to enter
a pass phrase to protect the private key.

    $ openssl genrsa -aes256 -out MyCA/MyCA.key.pem 4096

Generate a self-signed certificate. The certificate contains the corresponding
CA public key derived from the CA private key. You will be prompted to enter
the pass phrase set in the previous step to access the CA private key.

    $ openssl req -new -x509 -days 3650 -key MyCA/MyCA.key.pem -sha256 -extensions v3_ca -out MyCA/MyCA.cert.pem

## 3. Generate CA-signed user certificate
Create a directory to store all files related to the user certificate.

    $ mkdir MyExampleHost

Generate a user private key of length 4096 bits.

    $ openssl genrsa -out MyExampleHost/MyExampleHost.key.pem 4096

Generate a certificate signing request (csr).

    $ openssl req -sha256 -new -key MyExampleHost/MyExampleHost.key.pem -out MyExampleHost/MyExampleHost.csr.pem

Generate a user certificate signed by our root CA.

    $ openssl ca -keyfile MyCA/MyCA.key.pem -cert MyCA/MyCA.cert.pem -extensions usr_cert -notext -md sha256 -in MyExampleHost/MyExampleHost.csr.pem -out MyExampleHost/MyExampleHost.cert.pem

## 4. Usage (for HTTPS Web Server)
Client: Install `MyCA.cert.pem`.

Server: Use `MyExampleHost.key.pem` and `MyExampleHost.cert.pem` to configure
the HTTPS Web server.
