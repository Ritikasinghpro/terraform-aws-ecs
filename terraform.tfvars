name               = "ritika-test"
container_insights = true
task_definition = {
  td1 = {
    name                     = "td1"
    requires_compatibilities = ["EC2"]
    network_mode             = "bridge"
    container_name = "test1"
    image          = "test"
    containerPort  = 8080
    cpu            = 256
    memory         = 512
    log_group      = "/ecs/test"
  }
}