#!/bin/bash

# Diretório onde os backups são armazenados
BACKUP_DIR=$(pwd)

# Listar cada arquivo de backup que corresponde ao padrão de nome
for backup_file in "${BACKUP_DIR}"/*_backup.tar.gz; do
    # Verificar se nenhum arquivo foi encontrado.
    [ -e "$backup_file" ] || { echo "No backup files found in ${BACKUP_DIR}"; exit 1; }

    # Extrair o nome do volume a partir do nome do arquivo de backup. formato: <NOME_DO_VOLUME>_backup.tar.gz
    VOLUME_NAME=$(basename "$backup_file" | sed 's/_backup\.tar\.gz//')

    echo "Restoring backup for volume: ${VOLUME_NAME} from ${backup_file}"

    # Garantir que o volume exista senão criar
    docker volume ls --format "{{.Name}}" | grep -q "^${VOLUME_NAME}$" || {
        echo "Volume ${VOLUME_NAME} does not exist. Creating volume ${VOLUME_NAME}."
            docker volume create "${VOLUME_NAME}"
        }

    # Rodar o contêiner que monte o volume e o diretório de backup,
    # em seguida, extrair o arquivo de backup para o volume.
    docker run --rm \
        -v "${VOLUME_NAME}:/to" \
        -v "${BACKUP_DIR}:/from" \
        busybox sh -c "tar -C /to -xzvf /from/$(basename "$backup_file")"

    if [ $? -eq 0 ]; then
        echo "Volume ${VOLUME_NAME} restored successfully."
    else
        echo "Error restoring data for volume ${VOLUME_NAME}."
    fi
done

echo "All volume restore processes complete."

