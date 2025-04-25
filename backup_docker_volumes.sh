#!/bin/bash

# Garantir que o diretório atual tenha permissão de escrita
BACKUP_DIR=$(pwd)
#BACKUP_DIR=~/workspace/backups

# Pegar todos os nomes de volumes do Docker
volume_names=$(docker volume ls --format "{{.Name}}")

# Verificar se existe algum volume na lista
if [ -z "$volume_names" ]; then
    echo "No Docker volumes found."
    exit 0
fi

# Loop para cada volume e cria um tarball de backup
for VOLUME_NAME in $volume_names; do
    echo "Creating backup for volume: $VOLUME_NAME"

    # Cria o comando de backup
    # O comando usa o busybox para comprimir o conteúdo do volume e salvá-lo como gzipped tarball no diretorio de backup
    docker run --rm \
        -v "${VOLUME_NAME}:/from" \
        -v "${BACKUP_DIR}:/to" \
        busybox sh -c "tar -C /from -czvf /to/${VOLUME_NAME}_backup.tar.gz ."

    # Verificar se o comando tar deu certo
    if [ $? -eq 0 ]; then
        echo "Backup for volume ${VOLUME_NAME} created successfully."
    else
        echo "Error creating backup for volume ${VOLUME_NAME}."
    fi
done

echo "All backups are complete."

