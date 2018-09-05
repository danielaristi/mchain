#!/bin/ruby

require 'yaml'
load 'class.rb'
load 'mChainMethods.rb'
load 'lChainMethods.rb'

config = YAML.load(File.read('logchain.conf'))
server=Server.new(config['chain'],config['user'],config['pass'],config['serverip'],config['port'])

# se debe adaptar para modificacion dinamica de parametros
hex=readFile('dmesg')

#hex=hex.unpack('U' * hex.length).collect { |x| x.to_s(16) }.join
p hex.unpack('H*')
hex=hex.unpack('H*').to_s.gsub("\"","").gsub("[","").gsub("]","")

dato=Dato.new("stream1","key34","id1",hex)

#data corresponde a la informacion para la insercion (stream, key, id, data)
insertDataStreamKey(server,dato)

