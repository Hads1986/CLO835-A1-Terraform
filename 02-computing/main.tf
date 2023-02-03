
# Data source for AMI id
data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Use remote state to retrieve the data
data "terraform_remote_state" "public_subnet" { // This is to use Outputs from Remote State
  backend = "s3"
  config = {
    bucket = "${var.prefix}-s3"                // Bucket from where to GET Terraform State
    key    = "01-networking/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                       // Region where bucket created
  }
}

# Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "my_amazon" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.my_key.key_name
  subnet_id                   = data.terraform_remote_state.public_subnet.outputs.subnet_id
  security_groups             = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/install_httpd.sh")
  tags = merge(
    var.default_tags,
    {
      Name = "${var.prefix}-ec2"
    },
  )
  lifecycle {
    create_before_destroy = true
  }
}

# Adding SSH key to Amazon EC2
resource "aws_key_pair" "my_key" {
  key_name   = "${var.prefix}.pub"
  public_key = file("${var.prefix}.pub")
}