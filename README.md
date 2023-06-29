# devops-netolog

### **Задача 1**

Непрерывная интеграция (CI) — практика разработки ПО, которая заключается в постоянном слиянии рабочих веток в общую основную ветку разработки и выполнении частых автоматизированных сборок проекта.  
Непрерывная доставка (CD) — CI + CD. Позволяет выпускать изменения небольшими партиями, которые легко изменить или устранить путём отката на предыдущую версию и последующего перезапуска процесса сборки с учётом исправления выявленных дефектов.  
Непрерывное развёртывание (CD) — CI + CD + СD. Практика непрерывного развёртывания упраздняет ручные действия, не требуя непосредственного утверждения со стороны разработчика или любого другого ответственного лица.  
Основополагающим принципом IaaC является «Инфраструктура как код». Он заключается в том, чтобы разделить инфраструктуру на отдельные компоненты (например, серверы, базы данных, сети) и управлять ими с помощью кода (например, через конфигурационные файлы, шаблоны, скрипты). Это позволяет управлять инфраструктурой более гибко и эффективно, особенно при масштабировании и изменении конфигурации.  

### **Задача 2**  
Ansible отличается скорость, простотой и расширяемостью. Имеет большое количество модулей и может применяться на всех стадиях жизненного цикла инфраструктуры проекта.  

На мой взгляд, наиболее надежным методом работы систем конфигурации является pull-метод. Этот метод позволяет системе конфигурации автоматически обновлять свои данные на основе изменений в источнике данных (например, в репозитории Git). При этом система конфигурации не запрашивает изменения у пользователя, а автоматически обновляет свои данные в соответствии с последними изменениями.  

### **Задача 3**  
VirtualBox  
` 
==> virtualbox: 7.0.8,156879
https://www.virtualbox.org/
Not installed
From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/virtualbox.rb
==> Name
Oracle VirtualBox
==> Description
Virtualizer for x86 hardware
==> Artifacts
VirtualBox.pkg (Pkg)
==> Analytics
install: 2,583 (30 days), 14,443 (90 days), 14,503 (365 days)`  

Ansibe  
`ansible [core 2.15.1]
config file = None
  configured module search path = ['/Users/**********/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/ansible
  ansible collection location = /Users/**********/.ansible/collections:/usr/share/ansible/collections
  executable location = /Library/Frameworks/Python.framework/Versions/3.11/bin/ansible
  python version = 3.11.2 (v3.11.2:878ead1ac1, Feb  7 2023, 10:02:41) [Clang 13.0.0 (clang-1300.0.29.30)] (/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11)
  jinja version = 3.1.2
  libyaml = True`

Vagrant  
`Vagrant 2.3.7`

Terraform  
`Terraform v1.5.1
on darwin_arm64`

### **Задача 4**    
```Client: Docker Engine - Community
 Version:           24.0.2
 API version:       1.43
 Go version:        go1.20.4
 Git commit:        cb74dfc
 Built:             Thu May 25 21:52:22 2023
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          24.0.2
  API version:      1.43 (minimum version 1.12)
  Go version:       go1.20.4
  Git commit:       659604f
  Built:            Thu May 25 21:52:22 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.21
  GitCommit:        3dce8eb055cbb6872793272b4f20ed16117344f8
 runc:
  Version:          1.1.7
  GitCommit:        v1.1.7-0-g860f061
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```