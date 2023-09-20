#!/bin/bash

source args

## enable APIS -----------------------------------------------------------------
gcloud services enable compute.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable workstations.googleapis.com

## Create cluster --------------------------------------------------------------
gcloud beta workstations clusters create ${CLUSTER} \
    --region=${LOCATION} 
# https://cloud.google.com/sdk/gcloud/reference/beta/workstations/clusters/create

gcloud beta workstations clusters describe ${CLUSTER} \
    --region=${LOCATION} 
# https://cloud.google.com/sdk/gcloud/reference/beta/workstations/clusters/describe

## Create configuration -------------------------------------------------------
gcloud beta workstations configs create ${CONFIG} \
    --cluster=${CLUSTER} \
    --region=${LOCATION}
# https://cloud.google.com/sdk/gcloud/reference/beta/workstations/configs/create

## Create workstation -------------------------------------------------------
gcloud beta workstations create ${WORKSTATION} \
    --cluster=${CLUSTER} \
    --config=${CONFIG} \
    --region=${LOCATION} 
# https://cloud.google.com/sdk/gcloud/reference/beta/workstations/create

## start workstation 
gcloud beta workstations start ${WORKSTATION} \
    --cluster=${CLUSTER} \
    --config=${CONFIG} \
    --region=${LOCATION} 
