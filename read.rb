#!/bin/ruby

require 'yaml'
require 'json'
load 'class.rb'
load 'mChainMethods.rb'
load 'lChainMethods.rb'

config = YAML.load(File.read('logchain.conf'))
server=Server.new(config['chain'],config['user'],config['pass'],config['serverip'],config['port'])


consulta=Dato.new("stream1","key3","2",'multichain1_agosto2018')

#data corresponde a la informacion para la insercion (stream, key, id, data)
transactions=JSON.parse(listTransactionsStreamKey(server,consulta))




p transactions


p transactions.length

transactions.length.times do |x|

p transactions['result'][x]['txid']

end



