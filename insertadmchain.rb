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
  "name": "201901_1",
  "port": "5793",
  "rpcport": "5792",
  "user": "multichainrpc",
  "pass": BWNscuyfuUoPP2A6YnisJcbnXq9Vk55WcFGs9Qi13tip,
  "pool": "1"
}'

		hash=hash.unpack('H*').to_s.gsub("\"","").gsub("[","").gsub("]","")
		dato=Dato.new(admchain.getChainstream,Socket.gethostname,"id1",hash)
		insertDataStreamAdmKey(admchain,dato)
