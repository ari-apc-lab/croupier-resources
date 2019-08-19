# Croupier TOSCA blueprint examples.

## General use

Copy the file `inputs/local-blueprint-[*-]inputs-example.yaml` to `inputs/local-blueprint-[*-]inputs.yaml` and complete the file with your user name and password.

Every blueprint example can be run/deleted through two scripts in the `blueprints` folder:

- `up.sh [example_name]` upload the blueprint, creates the deployment, run the _install_ workflow and finally run the application with the _run_jobs_ workflow.

- `down.sh [example_name]`

Besides there are two scripts at the repository root folder to help stop or cancel an execution.

- `force-cancel.sh` If for some reason the execution is hanged, cancel with this command. It receives the execution id as parameter. Use `cfy executions list` to see all executions status and ids.

- `stop-instance.sh` Stops a node-instance if necessary. It receives the node instance id as parameter. Use `cfy node-instances list` to see all node instances status and ids.

## Blueprints description

- **single-job** Single job execution using touch command.

- **script-job** Single job execution using a script. Uses two deployment scripts that creates the script file in the HPC and removes it.

- **single-singularity-job** Single job execution using a singularity container. Uses two deployment scripts that download the image from the first argument (path).

- **scaled-job** Single job execution, scaled 4 times (4 instances in parallel are executed).

- **single-output** Single job execution that publishes the outputs in CKAN.

- **single-openstack** Two jobs execution using HPC and a
  virtual machine execution. First the blueprint defines the OpenStack objects
  (network, keypair and virtual machine) then it defines the two infrastructure
  interfaces (Slurm, Torque and Shell - BASH), and finally the jobs.

- **four-jobs** Combination of previous examples of four jobs arranged sequentially, except two and three that are in parallel. Uses the deployment scripts of previous examples.

- **four-singularity-jobs** Same as previous example but only using singularity jobs. Uses the deployment scripts of _single-singularity-job_ example.

- **single-singularity-eosc** Example of a hybrid computation using an HPC and
  EOSC-Hub
