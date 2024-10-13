
# Step 1: Create a VPC

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "aws_vpc"
  }
}

# Step 2: Create a public subnet

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.mainmyvpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.availability_zones[0]
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.mainmyvpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.availability_zones[1]
}
# Step 3: Create a private subnet

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.mainmyvpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zones[0]
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.mainmyvpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zones[1]
}
# Step 4: Create IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "terraform-igw"
  }
}


# Step 4: Create routing configuration

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "public-terraform-lab-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "private-terraform-lab-route-table"
  }
}


resource "aws_route_table_association" "public-route-1-association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public-route-table.id
}
