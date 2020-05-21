## Documentation
---
This provisions a single server with a static IP. The server is monitored to recover automatically at failure.

### **Prerequisite**
---
- Install [terraform](https://www.terraform.io/downloads.html)  
- Create an ssh key pair with name `server_key` at path `/home/<username>/.ssh/`
  ```bash
  ssh-keygen -t rsa -b 4096 -C "Server Key" # on prompt specify the path and name. Skip the paraphrase prompt by hitting return
  ```
- Install [awscli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) and run `aws configure` to configure your profile aws iam user access id and secret key.

### **Run Commands**
---
**Note:** 00_main.tf describes the providers to manage with terraform. 01_variable.tf and 02_inputs.auto.tfvars defines variables and their values respectively. The file names are prepended with numbers only for ease of running this walkthrough. Terraform parses all .tf files and pre determines the run order. We could use depends_on literal to explictly specify dependencies too. To run, change extensions starting from 05_ to .txt and run them in that order by renaming each back to .tf.
   ```hcl
    terraform validate    # to check syntax correctness
    terraform plan        # to view the resources to be provisioned
    terraform apply -auto-approve # to provision the resources.
  ```   