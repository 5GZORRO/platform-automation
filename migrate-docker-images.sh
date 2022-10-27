#!/bin/bash
old_repo=$1
image_name=$2
image_tag=$3
new_repo=$4
while getopts o:i:t:n: flag
do
    case "${flag}" in
        o) old_repo=${OPTARG};;
        i) image_name=${OPTARG};;
        t) image_tag=${OPTARG};;
        n) new_repo=${OPTARG};;
    esac
done

docker pull $old_repo/$image_name:$image_tag
docker tag $old_repo/$image_name:$image_tag $new_repo/$image_name:$image_tag
docker tag $old_repo/$image_name:$image_tag $new_repo/$image_name:latest
docker push $new_repo/$image_name:$image_tag
docker push $new_repo/$image_name:latest