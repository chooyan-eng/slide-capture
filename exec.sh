#!/bin/bash

IMAGE_BEFORE="before.jpg"
IMAGE_AFTER="after.jpg"
IMAGE_COMPARED="compared.jpg"

# capture slide > ${IMAGE_AFTER}
raspistill -br 60 -vf -o ${IMAGE_AFTER}

# compare
compare -metric AE -fuzz 10% ${IMAGE_AFTER} ${IMAGE_BEFORE} ${IMAGE_COMPARED}

# predict ${IMAGE_COMPARED}
python predict.py ${IMAGE_COMPARED}
result=$?

# swich process by return command of predict.py
if [ ${result} -eq 1 ] 
then
  # send ${IMAGE_AFTER} to Azure
  az storage blob upload --container-name upload-slide --file ${IMAGE_AFTER} --name $1 
fi

# rename ${IMAGE_AFTER} to ${IMAGE_BEFORE}
mv ${IMAGE_AFTER} ${IMAGE_BEFORE}

# move IMAGE_COMPARED to old/
mv ${IMAGE_COMPARED} old/`date +"%Y%m%d%H%M%s"`.jpg
