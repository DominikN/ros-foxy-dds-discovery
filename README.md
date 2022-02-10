# fastdds-discovery-server-demo

Using [Fast DDS Discovery Server](https://docs.ros.org/en/foxy/Tutorials/Discovery-Server/Discovery-Server.html) with multiple hosts connected over the Internet with Husarnet p2p VPN. 
## Get your Husarnet Join Code

Before running examples get your **Husarnet Join Code**. You will use it to connect Docker containers to the same VPN network.

At first rename `.env.template` file to `.env`.

You will find your Join Code at **https://app.husarnet.com  
 -> Click on the desired network  
 -> `Add element` button  
 -> `Join code` tab**

…and change the `JOINCODE` variable in the `.env` files.


### DDS Discovery Server

```bash
docker-compose -f docker-compose.discovery-server.yml up
```

### Listener

```bash
docker-compose -f docker-compose.listener.yml up
```

### Talker

```bash
docker-compose -f docker-compose.talker.yml up
```