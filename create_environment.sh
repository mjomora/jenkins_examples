#!/usr/bin/env bash
lxc launch ubuntu:16.04 vjenk
lxc exec vjenk -- sudo apt update
lxc exec vjenk -- sudo apt install openjdk-8-jdk
lxc exec vjenk -- sudo java -version
lxc exec vjenk -- sudo update-alternatives --config java
lxc exec vjenk -- echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin" PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-openjdk-amd64/jre/bin"' >> sudo vim /etc/environment
lxc exec vjenk -- source /etc/environment
lxc exec vjenk -- wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
lxc exec vjenk -- sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
lxc exec vjenk -- sudo apt update
lxc exec vjenk -- sudo apt install jenkins
lxc exec vjenk -- sudo cat /var/lib/jenkins/secrets/initialAdminPassword
