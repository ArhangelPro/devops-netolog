# devops-netolog  
![image](https://github.com/ArhangelPro/devops-netolog/assets/111104820/5a1f344c-095a-432d-98b5-99fbe3ed8abd)


### **Задание 1**  
**Изучите файл .gitignore. В каком terraform файле согласно этому .gitignore допустимо сохранить личную, секретную информацию?**  
в файлах с расширением *.tfstate допустимо сохранить личную, секретную информацию  

**Выполните код проекта. Найдите в State-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.**  
"result": "kMHJ6e55vMXvDQSU"  

**Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла main.tf. Выполните команду terraform validate. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.** 
"docker_container" "1nginx",   
{random_password.random_string_FAKE.result},   
resource "docker_image" {  

**Выполните код. В качестве ответа приложите вывод команды docker ps**  

![image](https://github.com/ArhangelPro/devops-netolog/assets/111104820/e79bf903-2a99-405b-a78c-d8f00cab7524)

**Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы все еще продолжаем использовать name = "nginx:latest"! Выполните команду terraform apply -auto-approve. Объясните своими словами, в чем может быть опасность применения ключа -auto-approve ? В качестве ответа дополнительно приложите вывод команды docker ps**  

![image](https://github.com/ArhangelPro/devops-netolog/assets/111104820/e7d2dfbe-bc5f-48ff-bb77-27f6e4a6714a)



Запуск команды terraform apply -auto-approve опасен бесконтрольным изменением инфораструктуры. При ошибке можно разрушить\изменить то, что не планировалось трогать. Как пример это задание. При изменении имени контейна, первичный контейнер был удален, а место него ничего не создано и результат виден только после выполнения команды.   
    
**Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.**  
>{
  "version": 4,
  "terraform_version": "1.5.3",
  "serial": 10,
  "lineage": "993b85b4-4d4f-3f5c-5cbe-ee2ab6d5fdba",
  "outputs": {},
  "resources": [],
  "check_results": null  

**Объясните, почему при этом не был удален docker образ nginx:latest ? Ответ подкрепите выдержкой из документации провайдера docker.**  
В блоке образа указано keep_locally = true. При значении true образ не удаляется.
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

### **Задание 2**  
К сожелению, выполнить не получилось.
![image](https://github.com/ArhangelPro/devops-netolog/assets/111104820/b8aa97d8-7c9f-49e9-b9c2-0884dd8bf4ee)

