resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "echo 'Running a local script!'"
  }
}



resource "null_resource" "configmap" {
  triggers = {
    value = var.some_id
  }

  provisioner "local-exec" {
    command = "kubectl apply -f configmap.yaml"
  }




  
}
resource "null_resource" "after_eks" {
  depends_on = [aws_eks_cluster.my_cluster]

  provisioner "local-exec" {
    command = "kubectl apply -f configmap.yaml --kubeconfig kubeconfig"
  }
}
