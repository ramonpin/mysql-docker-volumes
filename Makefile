info:
	@echo "Pruebas de docker con volúmenes."
	@echo "Tareas:"
	@echo "  - mysql             : Arranca un contenedor con la última versión de MySQL."
	@echo "  - mysql-shell       : Abre un mysql-shell en el contenedor anterior."
	@echo "  - mysql-cp          : Copia la carpeta de datos del contenedor a local."
	@echo "  - mysql-stop        : Para el contenedor."
	@echo "  - mysql-vol         : Arranca otro MySQL utilizando la carpeta local como volumen de datos."
	@echo "  - mysql-vol-shell   : Abre un mysql-shell en el servidor anterior."
	@echo "  - mysql-vol-destroy : Destruye el contenedor que usa el volumen."

mysql:
	@echo "Arrancando un mysql prístino."
	@docker run -d -e MYSQL_ROOT_PASSWORD=password \
                   -p 3306:3306 \
                   --name mysql mysql

mysql-shell:
	@echo "Arrancando un shell mysql en el servidor prístino. PASSWORD: password"
	@echo "Crea algún usuario, base de datos, tabla..."
	@docker exec -it mysql mysql -p

mysql-cp:
	@echo "Copia del directorio de datos del servidor mysql prístino a local."
	@docker cp mysql:/var/lib/mysql .
	@mv mysql var-mysql

mysql-stop:
	@echo "Paramos el servidor prístino."
	@docker cp mysql:/var/lib/mysql .

mysql-vol:
	@echo "Arrancando un mysql sobre el volumen exportado."
	@docker run -d -e MYSQL_ROOT_PASSWORD=password \
                   -p 3306:3306 \
                   -v ${PWD}/var-mysql:/var/lib/mysql \
                   --name mysql-vol mysql
mysql-vol-shell:
	@echo "Arrancando un shell mysql en el servidor con volumen local. PASSWORD: password"
	@docker exec -it mysql-vol mysql -p

mysql-vol-destroy:
	@echo "Destruimos el mysql con volumen local. El volumen permanece."
	@docker stop mysql-vol
	@docker rm mysql-vol

