# hello-world

This is a basic Script to create a VPC, Subnet, SG group and EC2 instance that will pull the Tarball from this project as content.
Once Complete it will also verify that the index.html contains "Automation for the People"
Script is set to deploy into the us-west-1 region and uses the 10.2.0.0/16 subnet space

To Use:
Download Launch.ps1 and ec2HelloWorldStack.yml to the same folder.

Update Launch.ps1 $StoredCred Varible to the stored cred for the account that you would like to run this on

Assumptions:
You have AWS powershell tools Installed and have an AWS account
