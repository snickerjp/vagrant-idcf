# -*- mode: ruby -*-
# vi: set ft=ruby :

# configuration from http://qiita.com/atsaki/items/f12e82f109193321fb13

# .envの内容を読み込み
Dotenv.load

Vagrant.configure("2") do |config| 
  config.vm.provider :cloudstack do |cloudstack, override| 

    # dummy box                        
    override.vm.box = "dummy"       
    override.vm.box_url = "https://github.com/klarna/vagrant-cloudstack/raw/master/dummy.box"

    # エンドポイント
    # URLが https://compute.jp-east.idcfcloud.com/client/api の場合 
    cloudstack.host    = "compute.jp-east.idcfcloud.com"
    cloudstack.path    = "/client/api"
    cloudstack.port    = "443"
    cloudstack.scheme  = "https"

    # APIキー・シークレットキー
    cloudstack.api_key    = "#{ENV['CLOUDSTACK_API_KEY']}"
    cloudstack.secret_key = "#{ENV['CLOUDSTACK_SECRET_KEY']}"           

    # 仮想マシン作成のパラメータ 
    cloudstack.display_name          = "ansible-test01"
    cloudstack.group                 = "ansible-test"
    cloudstack.zone_name             = "tesla"
    cloudstack.template_name         = "CentOS 6.5 64-bit for Vagrant"
    cloudstack.service_offering_name = "light.S1"
    cloudstack.network_type          = "Advanced"
    cloudstack.network_name          = "network1"                       
    cloudstack.keypair               = "#{ENV['CLOUDSTACK_SSH_KEYPAIR']}"

    # timeout 設定 
    cloudstack.instance_ready_timeout = 1800

    # 仮想マシンへの接続に必要なネットワークの設定
    cloudstack.pf_ip_address_id = "#{ENV['CLOUDSTACK_PF_IP_ADDRESS_ID']}"           
    cloudstack.pf_public_port   = "#{ENV['CLOUDSTACK_PF_PUBLIC_PORT']}"
    cloudstack.pf_private_port  = "22"

    # 仮想マシンへの接続に必要なSSHの設定 
    override.ssh.username         = "#{ENV['VAGRANT_SSH_USERNAME']}"
    override.ssh.private_key_path = "#{ENV['VAGRANT_SSH_PRIVATE_KEY']}"
    override.ssh.port             = "#{ENV['CLOUDSTACK_PF_PUBLIC_PORT']}"                                                
  end
end 
