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
    cpu                      = 256
    memory                   = 512
    log_group                = "/ecs/td1"
    secret_manager_arn       = "arn:aws:secretsmanager:us-east-1:283747779563:secret:test_Secret-0zpnSe"
  },
  td2 = {
    name                     = "td2"
    requires_compatibilities = ["EC2"]
    network_mode             = "bridge"
    container_name           = "test1"
    image                    = "283747779563.dkr.ecr.us-east-1.amazonaws.com/test_ecr:latest"
    containerPort            = 8080
    cpu                      = 256
    memory                   = 512
    log_group                = "/ecs/td2"
    secret_manager_arn       = "arn:aws:secretsmanager:us-east-1:283747779563:secret:test_Secret-0zpnSe"
  }
}