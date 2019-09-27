_To start a configuration process you have to do steps below:_

    terraform init
  
    terraform plan
  
    terraform apply
    
If all steps have been finished successfully you would see next output: 
    
     dmdb_terraform_state_lock_id = dmdb-terraform-state-lock-dev-projectname
     
     region                       = us-east-1
     
     s3_terraform_state_id        = s3-terraform-state-dev-projectname
     
     tfstate_file_name            = terraform.tfstate
     
You have to use information above in configuration [file](https://github.com/sadoha/aws_origin_conf/blob/master/dev/terraform.tf) in a next [step](https://github.com/sadoha/aws_origin_conf/tree/master/dev).

The layout current folder:

    ├── README.md
    ├── main.tf
    ├── outputs.tf
    ├── provider.tf
    └── variables.tf
