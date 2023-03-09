name               = "ritika-test"
container_insights = true
task_definition = {
  td1 = {
    name                     = "td1"
    requires_compatibilities = ["EC2"]
    network_mode             = "bridge"
    container_name           = "test1"
    image                    = "283747779563.dkr.ecr.us-east-1.amazonaws.com/test_ecr:latest"
    containerPort            = 8080
    hostPort                 = 0
    protocol                 = "tcp"
    cpu                      = 256
    memory                   = 512
    log_group                = "/ecs/td1"
    region                   = "us-east-1"
    logs_prefix              = "ecs"
    secrets = [
      {
        name      = "SECRET_MANAGER_ARN"
        valueFrom = "arn:aws:secretsmanager:us-east-1:283747779563:secret:test_Secret-0zpnSe"
      }
    ]
    volume_name = "logs"
    host_path   = "/home/ec2-user/test"
    mountPoints = [
      {
        sourceVolume  = "logs",
        containerPath = "/opt/logs"
      }
    ]
  },
  td2 = {
    name                     = "td2"
    requires_compatibilities = ["EC2"]
    network_mode             = "bridge"
    container_name           = "test1"
    image                    = "283747779563.dkr.ecr.us-east-1.amazonaws.com/test_ecr:latest"
    containerPort            = 8080
    hostPort                 = 0
    protocol                 = "tcp"
    cpu                      = 256
    memory                   = 512
    log_group                = "/ecs/td2"
    region                   = "us-east-1"
    logs_prefix              = "ecs"
    secrets = [
      {
        name      = "SECRET_MANAGER_ARN"
        valueFrom = "arn:aws:secretsmanager:us-east-1:283747779563:secret:test_Secret-0zpnSe"
      }
    ]
    volume_name = "logs"
    host_path   = "/home/ec2-user/test2"
    mountPoints = [
      {
        sourceVolume  = "logs",
        containerPath = "/opt/logs"
      }
    ]
  }
}