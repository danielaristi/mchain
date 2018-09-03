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

	#trans['result'].length.times do |x|
	1.times do |x|
	
		if trans['result'][x]['data']['vout'] == nil
			datahexa=trans['result'][x]['data']
		else 
			tx=Tx.new(trans['result'][x]['data']['txid'],trans['result'][x]['data']['vout'].to_s)
			datahexatmp=getDataFromTxidVout(server,tx)
			datahexa=JSON.parse(datahexatmp[0])
			datahexa=datahexa['result']
		end	
		File.write('/tmp/dar.log', datahexa.gsub(/../) { |pair| pair.hex.chr })
	end



