#!/bin/bash

source args

# Prompt the user


echo "WARNING: you are about to delete the following resources: "
echo "CLUSTER:               " $CLUSTER
echo "CONFIG:                " $CONFIG
echo "WORKSTATION:           " $WORKSTATION
echo "Do you want to proceed?" 
read -p "Enter choice (y/n): "  response

if [[ "$response" == "y" || "$response" == "Y" ]]; then
    ## delete workstation 
    gcloud beta workstations delete ${WORKSTATION} \
        --cluster=${CLUSTER} \
        --config=${CONFIG} \
        --region=${LOCATION} \
        --quiet
    # https://cloud.google.com/sdk/gcloud/reference/beta/workstations/delete

    ## delete configuration
    gcloud beta workstations configs delete ${CONFIG} \
        --cluster=${CLUSTER} \
        --region=${LOCATION} \
        --quiet
    # https://cloud.google.com/sdk/gcloud/reference/beta/workstations/configs/delete

    ## delete cluster 
    gcloud beta workstations clusters delete ${CLUSTER} \
        --region=${LOCATION} \
        --quiet
    # https://cloud.google.com/sdk/gcloud/reference/beta/workstations/clusters/delete
else
    echo "Operation cancelled by user. Nothing was deleted."
fi
