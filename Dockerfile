# 1. Define a imagem base a partir do Python na versão Alpine, que é leve.
FROM python:3.13.5-alpine3.22

# Define variáveis de ambiente para Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 2. Define o diretório de trabalho dentro do container
WORKDIR /app

# 3. Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# 4. Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia o restante do código da aplicação
COPY . .

# 6. Expõe a porta em que a aplicação irá rodar
EXPOSE 8000

# 7. Define o comando para iniciar o servidor Uvicorn quando o container for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
