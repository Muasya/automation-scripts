<!-- Linux -Debian 10 -->

# Uninstall old versions

``` $ sudo apt-get remove docker docker-engine docker.io containerd runc ```

# Set up the repository

``` $ sudo apt-get update ```
``` $ sudo apt-get install \ ca-certificates \ curl \ gnupg \ lsb-release ```

# Add Docker’s official GPG key:

``` $ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg ```

# et up the stable repository

``` $ echo \ ```
```  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \ ```
```  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ```

# Install Docker Engine

``` $ sudo apt-get update ```
``` $ sudo apt-get install docker-ce docker-ce-cli containerd.io ```

# List the versions available in your repo:

``` $ sudo apt-cache madison docker-ce ```

# Install a specific version using the version string

``` $ sudo apt-get install docker-ce=<VERSION> docker-ce-cli=<VERSION> containerd.io ```
