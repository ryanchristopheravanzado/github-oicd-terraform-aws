resource "aws_ecr_repository" "x2con-dev" {
  name = "x2con-dev"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "x2con"{
  repository = aws_ecr_repository.x2con-dev.name
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "*"
      }
    ]
  }
  EOF
}

resource "aws_ecs_cluster" "x2con" {
  name = "x2con-dev"
  setting {
    name = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "x2con" {
  cluster_name = aws_ecs_cluster.x2con.name

  capacity_providers = ["FARGATE"]
  default_capacity_provider_strategy {
    base = 1
    weight = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_cloudwatch_log_group" "x2con" {
  name = "x2con-dev"
}

resource "aws_iam_role" "x2con" {
  assume_role_policy = jsonencode ({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid = ""
      Principal = {
        Service = [
          "ecs.amazonaws.com",
          "ecs-tasks.amazonaws.com"
        ]
      }
    }]
  })
}

resource "aws_iam_role_policy" "x2con"{
  role = aws_iam_role.x2con.id
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "*"    
      }
    ]
  }
  EOF
}

resource "aws_ecs_task_definition" "x2con" {
  family = "x2con-dev-webapps"
  execution_role_arn = aws_iam_role.x2con.arn
  requires_compatibilities = ["FARGATE"]
  network_mode  = "awsvpc"
  cpu = "256"
  memory = "512"

  container_definitions = jsonencode([
    {
      name = "x2con-task"
      image = "sampleimage:latest"
      essential = true
      portMappings = [{
        containerPort = 80
        hostPort = 80

      }]
    }
  ])
}
