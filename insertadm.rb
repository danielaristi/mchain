#!/bin/ruby

require 'yaml'
require 'file-tail'
require 'socket'         #para traer el hostname
load 'class.rb'
load 'mChainMethods.rb'
load 'lChainMethods.rb'

config = YAML.load(File.read('logchainadm.conf'))
admchain=AdmChain.new(config['chain'],config['serverip'],config['port'],config['rpcport'],config['user'],config['pass'],config['serverstream'],config['chainstream'],config['logpath'])

def insert_config()
# se debe adaptar para modificacion dinamica de parametros
####hex=readFile('dmesg')

#hex=hex.unpack('U' * hex.length).collect { |x| x.to_s(16) }.join
p hex.unpack('H*')
hex=hex.unpack('H*').to_s.gsub("\"","").gsub("[","").gsub("]","")

#dato=Dato.new("stream1","key34","id1",hex)
#data corresponde a la informacion para la insercion (stream, key, id, data)
#insertDataStreamKey(server,dato)

end


hash='{
"hostnameFQDN"=>"logchain11.0rnitorrinco.test",
"pool"=>"1",
"Serverstatus"=>true,
"servicios"=>[
{"name"=>"service1", "path"=>"/tmp/service1", "defaultpath"=>"/var/log", "status"=>true, "warningsize"=>"100k"},
{"nombre"=>"service2", "path"=>"/tmp/service2", "defaultpath"=>"/var/log", "status"=>false, "warningsize"=>"100k"}]
}'


		hash=hash.unpack('H*').to_s.gsub("\"","").gsub("[","").gsub("]","")
		dato=Dato.new(admchain.getServerstream,Socket.gethostname,"id1",hash)
		insertDataStreamAdmKey(admchain,dato)
