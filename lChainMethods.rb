#!/bin/ruby

load 'class.rb'
load 'mChainMethods.rb'
load 'rest.rb'

def insertDataStreamKey(server, dato)
	method=methodPublishDataStreamKey()
	
	method=method.gsub '?1', dato.getStream
	method=method.gsub '?2', dato.getKey
	method=method.gsub '?3', dato.getData
	method=method.gsub '?4', '1'
	method=method.gsub '?5', server.getChain
	execRest(server,method)
end

def insertDataStreamAdmKey(config, dato)
        method=methodPublishDataStreamKey()

        method=method.gsub '?1', dato.getStream
        method=method.gsub '?2', dato.getKey
        method=method.gsub '?3', dato.getData
        method=method.gsub '?4', '1'
        method=method.gsub '?5', config.getChain
	execRestAdm(config,method)

end


def listTransactionsStreamKey(server, dato)
        method=methodlistStreamKeyTransactions()

        method=method.gsub '?1', dato.getStream
        method=method.gsub '?2', dato.getKey
        method=method.gsub '?3', '1'
        method=method.gsub '?4', server.getChain
	execRest(server,method)
end

def getConfigFromAdmchain(config, dato)
        method=methodGetConfigFromAdmchain()

        method=method.gsub '?1', dato.getStream
        method=method.gsub '?2', dato.getKey
        method=method.gsub '?3', '1'
        method=method.gsub '?4', config.getChain
	execRestAdm(config,method)
end

def getDataFromTxidVout(server, tx)
        method=methodGetDataTxidVout()

	method=method.gsub '?1', tx.getTxid
	method=method.gsub '?2', tx.getVout
        method=method.gsub '?3', '1'
        method=method.gsub '?4', server.getChain
	execRest(server,method)
end

def readFile(pathlog)
	file=''
	File.foreach(pathlog) do |line|
		file.concat(line)
	end
	return file
end

def hex_to_string
  stripped = self.gsub(/\s+/,'')
  unless stripped.size % 2 == 0
    raise "String length must be an even number."
  end
  [stripped].pack('H*')
end
