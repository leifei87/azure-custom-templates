# Deployment of FreeBSD VMs

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fleifei87%2Fazure-quickstart-templates%2Fmaster%2Fvms-freebsd-perf%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fleifei87%2Fazure-quickstart-templates%2Fmaster%2Fvms-freebsd-perf%2Fazuredeploy.json" target="_blank"></a>


This template will deploy four FreeBSD VMs for performance test:

Topology
                                             Nginx + PHP VM3
                         FrontEnd VM1  ----  Nginx + PHP VM2 ---- PostgreSQL VM4
                      Subnet1          Subnet2             Subnet3

Details:
1.One FrontEnd VM with 2 NICs, one NIC in Subnet1 with public and private IP, the other NIC in Subnet2 with private IP. 

2.Two VMs with 2 NICs, one NIC in Subnet2, the other NIC in Subnet3, both are private IP. 

3.One VM with 1 NIC in Subnet3, is private IP