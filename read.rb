#!/bin/ruby

require 'yaml'
require 'json'
load 'class.rb'
load 'mChainMethods.rb'
load 'lChainMethods.rb'

config = YAML.load(File.read('logchain.conf'))
server=Server.new(config['chain'],config['user'],config['pass'],config['serverip'],config['port'])


consulta=Dato.new("stream1","key30","1",'multichain1_agosto2018')

#data corresponde a la informacion para la insercion (stream, key, id, data)
request=listTransactionsStreamKey(server,consulta)

request[0]
errorCode=request[1]
trans=JSON.parse(request[0])

print trans

exit 0

x['result'][2]['data']['vout']


	trans['result'].length.times do |x|
	
		if x['result'][x]['data']['vout'] == nil
			datahexa=trans['result'][x]['data']
		else 
			txid=Tx.new(x['result'][x]['data']['txid'],x['result'][x]['data']['vout'])
			datahexa=listTransactionsStreamKey(server,consulta)

		end	

			datahexa=cfdsa
	end



