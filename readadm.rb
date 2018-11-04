#!/bin/ruby

require 'yaml'
require 'json'
require 'socket'
load 'class.rb'
load 'mChainMethods.rb'
load 'lChainMethods.rb'

config = YAML.load(File.read('logchainadm.conf'))
admchain=AdmChain.new(config['chain'],config['serverip'],config['port'],config['rpcport'],config['user'],config['pass'],config['serverstream'],config['chainstream'],config['logpath'])

consulta=Dato.new(admchain.getServerstream,Socket.gethostname,"1",admchain.getChain)
#data corresponde a la informacion para la inserción (stream, key, id, data)
request=getConfigFromAdmchain(admchain,consulta)

request[0]
errorCode=request[1]
trans=JSON.parse(request[0])

	
		if trans['result'][0]['data']['vout'] == nil
			datahexa=trans['result'][0]['data']
		else 
			tx=Tx.new(trans['result'][0]['data']['txid'],trans['result'][0]['data']['vout'].to_s)
			datahexatmp=getDataFromTxidVout(server,tx)
			datahexatmp=JSON.parse(datahexatmp[0])
			datahexa=datahexatmp['result']
		end

		hashServer=JSON.parse(datahexa.gsub(/../) { |pair| pair.hex.chr })

		print hashServer
		p hashServer.class


	#File.write('/tmp/dar.log',  datahexa.gsub(/../) { |pair| pair.hex.chr } )


