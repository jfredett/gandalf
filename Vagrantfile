Vagrant.configure('2') do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', '4096' ]
    vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
  end

  config.vm.define "gandalf" do |c|
    static_ip = '192.168.111.333'
    c.vm.box = 'precise64'

    c.vm.network "forwarded_port", guest: 80, host: 8081
    c.vm.network :private_network, ip: static_ip

    c.vm.synced_folder ".", "/tmp/gandalf"
    c.vm.provision 'shell', inline: 'sudo apt-get install git -y'
    c.vm.provision 'shell', path: 'install.sh', privileged: false, args: ['--git', '/tmp/gandalf']
  end
end