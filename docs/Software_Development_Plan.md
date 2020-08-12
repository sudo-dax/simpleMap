# Statement and Purpose of Scope:

This project aims to solve the problem of first assessment network enumeration and analysis.
The application will remain a lightweight command line application which can be installed on smaller headless linux devices such as a raspberry pi or Internet of Things devices. 
This allows users to easily or stealthily and enumerate networks without setting up more involved computer hardware and software. 

The aim is for the user to be able to WiFi connect or plug into a network and assess which machines are active on the network via the IP scan function. 
This IP scan function is supported by the Port Scanning function, which helps the user to see what ports are currently open on a given IP address. This information is important for Blue Team Network Defenders to be aware of, so that they may reduce the attack surface of the network. This is most commonly done by closing unnecessary ports with a firewall.
On the other hand, for Red Team Network Attackers such as penetration testers, this information is also useful when assessing if a machine is vulnerable to certain exploits.
As an added Red Team functionality the scans can be done anonymously by having the option of changing our computer’s internationally unique media access control (MAC) address, also known as MAC-spoofing.

The target audience for this application would be network administrators who don’t want to get their laptops out every time they want to analyse a new network, as well as , penetration testers, working in security wanting to analyse networks in the field or at a distance (via ssh). 
A user would be able to get a basic readout of all the machines on their network very quickly without taking up much processing power on their machines.
User Interaction 
& Experience

Version 1.0 of SimpleMapper will include three main modular functionalities which can operate independently or with each other to aid the user in network enumeration.

    Features:
    ◦ Ip Scanner – 
    using ping requests to see if an IP is active
    
    ◦ Port Scanner – 
    Probing for open ports on a selected IP
    
    ◦ MAC Changer – 
    Changing the hardware ID for the option of anonymity  
              
    • User Experience
        ◦ Menus
### Main Menu
The start.rb menu has four selections, clearly explained by this ‘welcome’ version of the main menu. This file contains the Simple Map banner along with a Welcome greeting and instructions on how to use the selection menu.  
Once a user chooses to revert back to the main menu, the main menu.rb is executed which doesnt replay the banner or instructions. This stops the application’s decor from getting annoying on reuse.
### Sub Menu
Once we have selected a sub-menu, each section there is a description and example of what user input is expected. Most features require some user input in the form of numbers or letters. These must be entered in the correct format for the application to continue successfully.
The sub-menu will allow for further functionality, ask to return to main menu or quit.
                • Some Error Handling Added – Error Handling for unexpected input

### Control Flow Diagram:
![alt text](https://raw.githubusercontent.com/DaAxe/simple_map/master/Control_Flow_Diagram.PNG "Control Flow Diagram for Simple Map")




## Overview of Features
## Technical documentation:

### IP  Scanner:
An Internet Protocol (IP) address is a numerical label assigned to any device connected to a network, whether it be a Local Area Network or a Wide Area Network. Linux and Windows based operating systems have a network administration tool called ping.  Ping works by sending Internet Control Message Protocol (ICMP) echo request packets to a target IP address. The Ping application waits for a response, and based on the rount-trip time of those responses it can tell if a machine is active, if there are any connection errors or packet loss. By using this app to quickly test all the IPs in a given subnet, we can ascertain which machines are currently on the network. 

### Port Scanner:
A port is a file descriptor associated with a process. File descriptors are numbers which are used to reference an open I/O channel.  Standard output, network sockets or files are all file descriptors. When the Operating System receives a TCP/IP packet it looks at the destination port and then attempts to find a process which is listening on this port. Then if there is a listening process active on the system, the packet is then delivered to it.  
There are 65525 available ports on a computer, if we did a scan for all of them at a timeout rate of 1 second, it would take just over 18 hours to do a complete port scan. This is why the port range has been narrowed to a list of more commonly used ports. 

An open port is when there is an application listening on the other end of the connection and we have access to it (not blocked by a firewall). 

When we query a port there are 3 possible outcomes:
    
    1. The Port is Open – the server answers with a SYN/ACK, meaning it is ready to establish a connection. A connection can be made with a ACK packet, also known as a three-way handshake
    
    2. The Port is Closed – the server answers with a RST packet – meaning the firewall rejected the connection.
    
    3. The server is down – No Response (Some firewalls may implement this as a DROP policy)

In this application we are basically only taking note of the Open ports (SYN/ACK packets), while RST packets and Dropped packets are considered a Closed port. 


### MAC Changer:
A Media Access Control (MAC) Address of a device is an internationally unique identifier assigned to a network interface such as wifi or ethernet. It has been well known for some time that Internet Service Providers and National Security Agencies keep constant tabs on these identifiers as a method of tracking the movements of devices across networks. 
To prevent this form of tracking the feature for MAC address changing, also known as, MAC Spoofing was added. 

## Implementation Plan:

    • IP Scanner (COMPLETE)
        ◦ Specify network adpater (30mins)
        ◦ Specify IP subnet (30 mins)
Implementation of this feature will require the ‘ipaddr’ which provides a set of methods to manipulate an IP address. This class used to map the “in scope” IP subnet. I will also need to use linux commands to clean up the output in a presentable manner for the user.
User input will be required to specify the subnet. 

    • Port Scanner (COMPLETE) (1-2 hours)
        ◦ Specify IP to scan
In order to get this feature to function we will require ‘socket’. This creates a TCPSocket which represents a TCP/IP client socket, which is an open port through which applications can communicate. To make this connection we will need to specify the port number and the IP/Host address to be scanned. We will need to generate the port range either based on user input or pre-defined arrays of common ports. Linux terminal commands will need to be used to clean up output. 
Perhaps a shortened version of the port range could be created to save time when testing the app.
For the output we will require ‘terminal-table’ gem to generate a table with the output. 

    • MAC Changer
        ◦ Enter MAC Address (1-2 hours)
This feature can completely be accomplished with linux terminal commands, to take down the network interface, change the MAC and put up the interface again. 
User input will be required to change the address to a specified MAC...which would have to fall within conventional MAC parameters. 

    • Menus & Exit (1 hr) (COMPLETE)
In order to make the app more navigable and presentable we would need to use the gems ‘tty-prompt’ and ‘colorize’ respectively. Part of tty gems is the progressbar, which could be implemented in the scans to make it seem more interactive. 


## Testing:

### IP Scanner
### Test #1
### --------
#### Scenario 
Using the IP Scanner we expect to input an IP subnet, which generates an IP range to scan, then outputs the results into a text file which returns as a table of active IPs.
##### Expected Results:
There will be a table displayed with active IPs, and therefore machines on the network.

#### Test
- From main menu select 'IP Scanner'
- Enter first 3 sets of numbers in your Ip address

#### Result - Pass
Output shows that IPs have been written to file.
Table is shown as expected. 

<br>

### Test # 2
### --------
#### Scenario 
Using the IP Scanner with unexpected input. 

##### Expected Results:
We expect to see a red flashing rescued error message.

#### Test
- From main menu select 'IP Scanner'
- Enter random characters as your Ip address

#### Result - Pass
Output shows red error 
`Invalid Address config`
This was because of the begin - rescue added with colorize.
<br>
<br>

---
### Port Scanner
#### Scenario 
Using the Port scanner we will need a Host IP Address and a Port. Once the IP address is received from the user, the application will scan the array of ports.  

##### Expected Results:
There will be a progress bar, after which, there will be a list of all the ports scanned and whether they are open or not. If a connection is lost all ports will come up closed. 
if you see [*] Scan Complete! :-)
= successful run.


#### Test
- In terminal enter the command <br>
`ss -lntu` <br>
& take note of the ports that say LISTEN (after [IP]:)
- From main menu in the app select 'Port Scanner'
- After prompt Press enter

#### Result
[*] Scan Complete! :-)
Compare open ports (if there are any to your initial notes)
For me they are the same = Successful result.

---

### MAC Changer
#### Scenario 
** WARNING: This may disconnect you from your network if you are using that Network Interface.

Using the MAC Changer with a different mac address 

#### Expected Results:
We expect to see a different MAC from before the test.

#### Test
1. In main menu of application select `MAC Changer`
2. In sub menu select `Change MAC Address`
3. Type current network interface
eg. `enp0s3`
4. Copy & Paste current MAC, then change last two characters to new ones.
5. In terminal type `ip addr` and see if your MAC has been changed after `link/ether`

#### Result - Pass
Success! - MAC address has new ID as expected. 
this was done using native linux commands eg. `ip link set`

---
