# Vagrantfile on idcf cloud by snickerjp

create at 15/03/2015 on idcf cloud

## Usage

----

### Getting started

- install Vagrant from [vagrantup](https://www.vagrantup.com/) [important! 必ずvagrantupから最新を持ってくること！]

```
# for RHEL/CentOS
yum install https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.rpm

# for Ubuntu/Debian
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
dpkg -i vagrant_1.7.2_x86_64.deb
```

- install vagrant plugin

```
vagrant plugin install vagrant-cloudstack
vagrant plugin install dotenv

# dotenv 入れるのに怒られたら、vagrant-vmware-fusion を入れてから dotenv を入れて削除する
vagrant plugin install vagrant-vmware-fusion
vagrant plugin uninstall vagrant-vmware-fusion
```

- git clone

```
git clone https://github.com/snickerjp/vagrant-idcf.git
```

- rename files

```
cp dotenv.template .env
cp Vagrantfile.template.rb Vagrantfile
```

- Edit files

```
vim .env
vim Vagrantfile
```

- vagrant up

```
vagrant up --provider=cloudstack
```

__*Let's Enjoy! idcf cloud*__

### 参考サイト
- [Vagrant-cloudstack用 CentOS 6.5 テンプレート公開 | IDC Frontier Engineers' Blog](http://www.idcf.jp/blog/cloud/vagrant-cloudstack-2/) → ちょっと古かった
- [VagrantでIDCFクラウド、Cloud n、ALTUSを使ってみる - Qiita](http://qiita.com/atsaki/items/f12e82f109193321fb13) → こちらのほうが新しくて、詳しいです！

