# How to update Docker Hub's version

1. Увеличить номер версии в файле VERSION.md

2. Запустить команду:
 
       docker login

       docker build -t mottor1/nginx-redirector . ; \
       for i in $(cat VERSION.md | head -n 1) "latest"; do \
       printf "\n------\npushing '${i}'\n"; \
       docker tag mottor1/nginx-redirector "mottor1/nginx-redirector:${i}"; \
       docker push "mottor1/nginx-redirector:${i}"; \
       done
