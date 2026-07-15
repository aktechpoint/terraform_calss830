###############################################
# EXTERNAL ALB (Angular)
###############################################

resource "aws_lb" "frontend_alb" {

  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.sub_pub1.id,
    aws_subnet.sub_pub2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "frontend-alb"
  }

}

###############################################
# INTERNAL ALB (Spring Boot)
###############################################

resource "aws_lb" "backend_alb" {

  name               = "backend-alb"
  internal           = true
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.sub_pri1.id,
    aws_subnet.sub_pri2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "backend-alb"
  }

}

###############################################
# FRONTEND TARGET GROUP
###############################################

resource "aws_lb_target_group" "frontend_tg" {

  name     = "frontend-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.vpctest.id

  target_type = "instance"

  health_check {

    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2

  }

  tags = {
    Name = "frontend-tg"
  }

}

###############################################
# BACKEND TARGET GROUP
###############################################

resource "aws_lb_target_group" "backend_tg" {

  name     = "backend-tg"
  port     = 8080
  protocol = "HTTP"

  vpc_id = aws_vpc.vpctest.id

  target_type = "instance"

  health_check {

    enabled             = true
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2

  }

  tags = {
    Name = "backend-tg"
  }

}

###############################################
# FRONTEND LISTENER
###############################################

resource "aws_lb_listener" "frontend_listener" {

  load_balancer_arn = aws_lb.frontend_alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {

    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend_tg.arn

  }

}

###############################################
# BACKEND LISTENER
###############################################

resource "aws_lb_listener" "backend_listener" {

  load_balancer_arn = aws_lb.backend_alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {

    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg.arn

  }

}

###############################################
# FRONTEND TARGET ATTACHMENT
###############################################

resource "aws_lb_target_group_attachment" "frontend_attachment" {

  target_group_arn = aws_lb_target_group.frontend_tg.arn

  target_id = aws_instance.frontend.id

  port = 80

}

###############################################
# BACKEND TARGET ATTACHMENT
###############################################

resource "aws_lb_target_group_attachment" "backend_attachment" {

  target_group_arn = aws_lb_target_group.backend_tg.arn

  target_id = aws_instance.backend.id

  port = 8080

}



# resource "aws_lb" "app_alb" {
#   name               = "java-angular-alb"
#   internal           = false
#   load_balancer_type = "application"

#   security_groups = [
#     aws_security_group.alb_sg.id
#   ]

#   subnets = [
#     aws_subnet.sub_pub1.id,
#     aws_subnet.sub_pub2.id
#   ]

#   tags = {
#     Name = "java-angular-alb"
#   }
# }

# resource "aws_lb_target_group" "frontend_tg" {

#   name     = "frontend-tg"

#   port     = 80
#   protocol = "HTTP"

#   vpc_id = aws_vpc.vpctest.id

#   health_check {

#     path = "/"

#     protocol = "HTTP"

#     matcher = "200"

#     interval = 30

#     timeout = 5

#     healthy_threshold = 2

#     unhealthy_threshold = 2

#   }

# }


# # resource "aws_lb_target_group" "backend_tg" {

# #   name = "backend-tg"

# #   port = 8080

# #   protocol = "HTTP"

# #   vpc_id = aws_vpc.vpctest.id

# #   health_check {

# #     path = "/health"

# #     protocol = "HTTP"

# #     matcher = "200"

# #     interval = 30

# #     timeout = 5

# #     healthy_threshold = 2

# #     unhealthy_threshold = 2

# #   }

# # }



# resource "aws_lb_listener" "http" {

#   load_balancer_arn = aws_lb.app_alb.arn

#   port = 80

#   protocol = "HTTP"

#   default_action {

#     type = "forward"

#     target_group_arn = aws_lb_target_group.frontend_tg.arn

#   }

# }


# # resource "aws_lb_listener_rule" "backend_rule" {

# #   listener_arn = aws_lb_listener.http.arn

# #   priority = 100

# #   action {

# #     type = "forward"

# #     target_group_arn = aws_lb_target_group.backend_tg.arn

# #   }

# #   condition {

# #     path_pattern {

# #       values = [
# #         "/*"
# #       ]

# #     }

# #   }

# # }


# resource "aws_lb_target_group_attachment" "frontend" {

#   target_group_arn = aws_lb_target_group.frontend_tg.arn

#   target_id = aws_instance.frontend.id

#   port = 80

# }

# # resource "aws_lb_target_group_attachment" "backend" {

# #   target_group_arn = aws_lb_target_group.backend_tg.arn

# #   target_id = aws_instance.backend.id

# #   port = 8080

# # }