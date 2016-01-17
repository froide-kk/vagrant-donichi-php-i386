require 'spec_helper'

describe file('/mnt/fuelphp') do
  it { should be_mounted }
  it { should be_readable.by_user('apache') }
  it { should be_writable.by_user('apache') }
  it { should be_executable.by_user('apache') }
end

describe package('httpd') do
  it { should be_installed }
end

describe package('mysql-server') do
  it { should be_installed }
end

describe package('php') do
  it { should be_installed }
end

describe package('phpMyAdmin') do
  it { should be_installed }
end

describe file('/home/vagrant/fuelphp') do
  it { should be_linked_to '/mnt/fuelphp' }
end

describe file('/etc/httpd/conf.d/fuelphp.conf') do
  it { should be_file }
end

describe file('/etc/httpd/conf.d/phpMyAdmin.conf') do
  it { should be_file }
end

describe 'PHP config parameters' do
  context php_config('date.timezone') do
    its(:value) { should eq 'Asia/Tokyo' }
  end
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe port(3306) do
  it { should be_listening }
end
