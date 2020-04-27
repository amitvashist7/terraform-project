resource "aws_instance" "labuser01" {
  tags = {
    Name = "labuser01-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser01" {                                    
  value = "${aws_instance.labuser01.*.public_ip}"
}
resource "aws_instance" "labuser02" {
  tags = {
    Name = "labuser02-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser02" {                                    
  value = "${aws_instance.labuser02.*.public_ip}"
}
resource "aws_instance" "labuser03" {
  tags = {
    Name = "labuser03-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser03" {                                    
  value = "${aws_instance.labuser03.*.public_ip}"
}
resource "aws_instance" "labuser04" {
  tags = {
    Name = "labuser04-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser04" {                                    
  value = "${aws_instance.labuser04.*.public_ip}"
}
resource "aws_instance" "labuser05" {
  tags = {
    Name = "labuser05-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser05" {                                    
  value = "${aws_instance.labuser05.*.public_ip}"
}
resource "aws_instance" "labuser06" {
  tags = {
    Name = "labuser06-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser06" {                                    
  value = "${aws_instance.labuser06.*.public_ip}"
}
resource "aws_instance" "labuser07" {
  tags = {
    Name = "labuser07-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser07" {                                    
  value = "${aws_instance.labuser07.*.public_ip}"
}
resource "aws_instance" "labuser08" {
  tags = {
    Name = "labuser08-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser08" {                                    
  value = "${aws_instance.labuser08.*.public_ip}"
}
resource "aws_instance" "labuser09" {
  tags = {
    Name = "labuser09-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser09" {                                    
  value = "${aws_instance.labuser09.*.public_ip}"
}
resource "aws_instance" "labuser10" {
  tags = {
    Name = "labuser10-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser10" {                                    
  value = "${aws_instance.labuser10.*.public_ip}"
}
resource "aws_instance" "labuser11" {
  tags = {
    Name = "labuser11-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser11" {                                    
  value = "${aws_instance.labuser11.*.public_ip}"
}
resource "aws_instance" "labuser12" {
  tags = {
    Name = "labuser12-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser12" {                                    
  value = "${aws_instance.labuser12.*.public_ip}"
}
resource "aws_instance" "labuser13" {
  tags = {
    Name = "labuser13-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser13" {                                    
  value = "${aws_instance.labuser13.*.public_ip}"
}
resource "aws_instance" "labuser14" {
  tags = {
    Name = "labuser14-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser14" {                                    
  value = "${aws_instance.labuser14.*.public_ip}"
}
resource "aws_instance" "labuser15" {
  tags = {
    Name = "labuser15-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser15" {                                    
  value = "${aws_instance.labuser15.*.public_ip}"
}
resource "aws_instance" "labuser16" {
  tags = {
    Name = "labuser16-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser16" {                                    
  value = "${aws_instance.labuser16.*.public_ip}"
}
resource "aws_instance" "labuser17" {
  tags = {
    Name = "labuser17-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser17" {                                    
  value = "${aws_instance.labuser17.*.public_ip}"
}
resource "aws_instance" "labuser18" {
  tags = {
    Name = "labuser18-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser18" {                                    
  value = "${aws_instance.labuser18.*.public_ip}"
}
resource "aws_instance" "labuser19" {
  tags = {
    Name = "labuser19-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser19" {                                    
  value = "${aws_instance.labuser19.*.public_ip}"
}
resource "aws_instance" "labuser20" {
  tags = {
    Name = "labuser20-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser20" {                                    
  value = "${aws_instance.labuser20.*.public_ip}"
}
resource "aws_instance" "labuser21" {
  tags = {
    Name = "labuser21-${count.index + 1}"
  }

  availability_zone      = "us-east-2a"
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.ec2type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "~/"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/scripts/run_frontend.sh",
      "cd ~/scripts",
      "sudo ~/scripts/run_frontend.sh",
    ]
  }


}

output "labuser21" {                                    
  value = "${aws_instance.labuser21.*.public_ip}"
}
