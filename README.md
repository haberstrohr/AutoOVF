# AutoOVF
OVF using a configuration file using the Pester DSL

![AutoOVF](/img/AutoOVFSample.png "AutoOVF Sample - Exchange Tests")

## Introduction

[Pester](https://github.com/pester/Pester) as an Operation Validation Framework is exceptionally nice. The easy to read language lends itself to discoverability, which in turn quickens adoption. I've written many tests for my environment where I essentially had the same `IT..SHOULD` syntax only changing out the service name and details. It was ugly, but worked. This project is intended to make one OVF test file, and from a configuration data file that is imported using `Import-PowerShellDataFile` automatically generate and execute the necessary tests to validate the environment.

## Where we are now

Currently AutoOVF can check the Exchange services and free disk space.

## Where we are going

The goal is to get the framework built up enough to cover the following services, in addition to others that aren't listed below, assuming the status check can be returned in one of the many `should` [test types](https://github.com/pester/Pester/wiki/Should "Pester Should Command")

  * SharePoint
  * Lync / Skype for Business
  * Active Directory
  * File Servers
  * DNS
  * DHCP
  * etc...