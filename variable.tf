variable REGION {
  default = "us-east-1"
}

variable ZONE1 {
  default = "us-east-1a"
}

variable ZONE2 {
  default = "us-east-1b"
}

variable ZONE3 {
  default = "us-east-1c"
}

variable AMIS {
  type = map
  default = {
    us-east-1 = "ami-0fc9e52ba2aedb00d" 
    }
    
}


variable test_ip {
  default = "183.83.67.89/32"
}
