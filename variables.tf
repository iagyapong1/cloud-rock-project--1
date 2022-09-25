#Provider
variable "region-name" {
    description = "name of region"
    default = "eu-west-2"
    type = string 

}

#vpc
variable "cidr-for-vpc" {
    description = "the cidr for VPC"
    default = "10.0.0.0/16"
    type = string 

}

#private subnet 1
variable "cidr-for-private-sub1" {
    description = "cidr for private subnet 1"
    default = "10.0.1.0/24"
    type = string 

}
#Private subnet 2
variable "cidr-for-private-sub2" {
    description = "cidr for private subnet 2"
    default = "10.0.2.0/24"
    type = string 

}


#public subnet 1
variable "cidr-for-public-sub1" {
    description = "cidr for pub subnet 1"
    default = "10.0.3.0/24"
    type = string 

}
#public subnet 2
variable "cidr-for-public-sub2" {
    description = "cidr for public subnet 2"
    default = "10.0.4.0/24"
    type = string 

}
