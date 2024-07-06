FROM python:3.9-alpine

COPY requirements.txt dbt_project.yml profiles.yml .user.yml /code/

RUN pip3 install --upgrade pip
RUN pip3 install --requirement /code/requirements.txt

COPY models /code/models/
COPY scripts /code/scripts/ 
# we copy whole folders here 

WORKDIR /code/
RUN python /scripts/create_db.py
RUN ls 
CMD ["dbt","build"]

# docker build --rm -t aether_energy_analytics .

# what is ls




# mcr.microsoft.com/vscode/devcontainers/python:3.9

# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid $USER_GID vscode && usermod --uid $USER_UID --gid $USER_GID vscode; fi

# RUN pwd
# RUN ls

# COPY requirements.txt /tmp/
# RUN pip3 install --upgrade pip
# RUN pip3 install --requirement /tmp/requirements.txt