#!/bin/bash -l

########
# Copyright (c) 2019 Atos Spain SA. All rights reserved.
#
# This file is part of Croupier.
#
# Croupier is free software: you can redistribute it and/or modify it
# under the terms of the Apache License, Version 2.0 (the License) License.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT ANY WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT, IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
# OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# See README file for full disclaimer information and LICENSE file for full
# license information in the project root.
#
# @author: Javier Carnero
#          Atos Research & Innovation, Atos Spain S.A.
#          e-mail: javier.carnero@atos.net
#
# bootstrap.sh


echo "[INFO] $(hostname):$(date) Bootstrap process start" >> bootstrap.log

module purge &>> bootstrap.log
module load singularity/2.4.2 &>> bootstrap.log

JOB_LOG_FILTER_FILE="logfilter.yaml"
read -r -d '' JOB_LOG_FILTER <<"EOF"
[
    {
        "filename": "job.log",
        "filters": [
            {pattern: "^Line-[0-9]0:", severity: "WARNING",   progress: "+1"},
            {pattern: "^Line", progress: "+1"},
            {pattern: "^Logger job finished succesfully:", severity: "OK",   progress: 100},
        ]
    }
]
EOF
echo "${JOB_LOG_FILTER}" > $JOB_LOG_FILTER_FILE
echo "[INFO] $(hostname):$(date) JOb log fiter: Created" >> bootstrap.log


singularity pull --name remotelogger-cli.simg shub://sregistry.srv.cesga.es/croupier/remotelogger-cli:latest
echo "[INFO] $(hostname):$(date) Remotelogger-cli: Downloaded" >> bootstrap.log

echo "[INFO] $(hostname):$(date) Bootstrap finished succesfully!" >> bootstrap.log



