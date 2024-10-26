Vagrant.configure("2") do |config|
  # Red privada (usar una IP que no cause conflictos)
  config.vm.network "private_network", ip: "192.168.58.103"

  # Máquina Debian tierra.sistema.test (servidor maestro)
  config.vm.define "tierra" do |tierra|
    tierra.vm.box = "debian/bullseye64"
    tierra.vm.hostname = "tierra.sistema.test"
    tierra.vm.network "private_network", ip: "192.168.58.103"
    tierra.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    tierra.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y bind9 dnsutils
    SHELL
  end

  # Máquina Debian venus.sistema.test (servidor esclavo)
  config.vm.define "venus" do |venus|
    venus.vm.box = "debian/bullseye64"
    venus.vm.hostname = "venus.sistema.test"
    venus.vm.network "private_network", ip: "192.168.58.102"  # Cambia a una IP no conflictiva
    venus.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    venus.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y bind9 dnsutils
    SHELL
  end
end
