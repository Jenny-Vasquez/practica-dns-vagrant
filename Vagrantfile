Vagrant.configure("2") do |config|
  # Configuración de la máquina 'tierra' (servidor DNS maestro)
  config.vm.define "tierra" do |tierra|
    tierra.vm.box = "debian/bullseye64"
    tierra.vm.network "private_network", ip: "192.168.57.103"
    tierra.vm.hostname = "tierra.sistema.test"
    tierra.vm.provision "file", source: "./provision/tierra/named.conf.options", destination: "/home/vagrant/named.conf.options"
    tierra.vm.provision "file", source: "./provision/tierra/named.conf.local", destination: "/home/vagrant/named.conf.local"
    tierra.vm.provision "file", source: "./provision/tierra/db.sistema.test", destination: "/home/vagrant/db.sistema.test"
    tierra.vm.provision "file", source: "./provision/tierra/db.57.168.192", destination: "/home/vagrant/db.57.168.192"
    tierra.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y bind9
      sudo mv /home/vagrant/named.conf.options /etc/bind/named.conf.options
      sudo mv /home/vagrant/named.conf.local /etc/bind/named.conf.local
      sudo mv /home/vagrant/db.sistema.test /etc/bind/db.sistema.test
      sudo mv /home/vagrant/db.57.168.192 /etc/bind/db.57.168.192
      sudo systemctl restart bind9
    SHELL
  end

  # Configuración de la máquina 'venus' (servidor DNS esclavo)
  config.vm.define "venus" do |venus|
    venus.vm.box = "debian/bullseye64"
    venus.vm.network "private_network", ip: "192.168.57.102"
    venus.vm.hostname = "venus.sistema.test"
    venus.vm.provision "file", source: "./provision/venus/named.conf.local", destination: "/home/vagrant/named.conf.local"
    venus.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y bind9
      sudo mv /home/vagrant/named.conf.local /etc/bind/named.conf.local
      sudo systemctl restart bind9
    SHELL
  end
end
