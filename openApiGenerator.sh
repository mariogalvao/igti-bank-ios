#!/bin/bash

echo "Removendo diretório da API..."
rm -rf IGTIBankAPI
echo "Diretório da API removido"

echo "Iniciando geração de código da API..."
openapi-generator generate \
  -i swagger.yaml \
  -g swift5 \
  -o IGTIBankAPI
echo "Geração de código da API finalizada."

echo "Installing pods..."
pod install
echo "Pods installed!"
