resource "aws_key_pair" "nirbhay_mykey" {
  key_name   = "nirbhay-mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}