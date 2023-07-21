# devops-netolog  

### **Задача 1**  
**1. В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?**  
В горизонтальном масштабировании.  
  **Режим “replication”** сервис может быть реплицирован на несколько узлов кластера, будет запущен на каждом узле кластера, который соответствует требованиям для запуска, все изменения в коде сервиса будут автоматически применяться ко всем копиям сервиса на всех узлах кластера, например, при обновлении или удалении сервиса, он будет удален со всех узлов кластера.   
  Сервис может использовать только те ресурсы, которые доступны на всех узлах кластера (например, сеть и хранилище)  
  **Режим “global”:**  
  Всё наоборот. сервис не будет реплицироваться на другие узлы кластера, а будет только запущен на одном узле, буждет использовать ресурсы только на одном узле кластера, чтоб сервис был доступен на всех узлах кластера, нужно вручную запустить его на каждом узле.  
**2. Какой алгоритм выбора лидера используется в Docker Swarm-кластере?**  
В Docker Swarm для выбора лидера используется алгоритм распределенного консенсуса Raft. Raft - это алгоритм выбора лидера, который обеспечивает отказоустойчивость и согласованность состояния в распределенной системе.   
**3. Что такое Overlay Network?**  
Это виртуальная сеть, которая создается поверх существующей сетевой инфраструктуры для поддержки связности и коммуникации между контейнерами и сервисами в распределенной системе, такой как Docker Swarm.  

### **Задача 4 docker swarm update --autolock=true**  
Эта команда включает функцию автоматической блокировки для Swarm. Включение автоматической блокировки повышает безопасность Docker Swarm, обеспечивая автомтримизацию доступа и защиту состояния от несанкционированного доступа. Автоматическая блокировка означает, что менеджер Docker Swarm автоматически генерирует и управляет ключом шифрования, необходимым для разблокировки и доступа к состоянию Swarm. Это обеспечивает дополнительный уровень безопасности, предотвращая неавторизованный доступ к состоянию Swarm.  
