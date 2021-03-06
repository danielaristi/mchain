#!/bin/ruby

# clase de servidor para acceso via RPC
class Server
        def initialize(chain,user,pass,ip,port)
        @chain=chain
        @user=user
        @pass=pass
        @ip=ip
        @port=port
        end
	
	def getChain
        return @chain
	end

	def getUser
        return @user
	end

	def getPass
        return @pass
        end

	def getIp
	return @ip
	end

	def getPort
	return @port
	end
end


# clase qu e contiene la data que sera almacenada y donde sera almacenada
class Dato
	def initialize(stream,key,id,data)
	@stream=stream
	@key=key
	@id=id
	@data=data
	end

	def getStream
        return @stream
        end

	def getKey
	return @key
	end

	def getId
	return @id
	end

	def getData
	return @data
	end
end

class Tx
	def initialize(txid,vout)
	@txid=txid
	@vout=vout
	end

	def getTxid
	return @txid
	end

	def getVout
	return @vout
	end
end


class AdmChain
	def initialize(chain,serverip,port,rpcport,user,pass,serverstream,chainstream,logpath)
	@chain=chain
	@serverip=serverip
	@port=port
	@rpcport=rpcport
	@user=user
	@pass=pass
	@serverstream=serverstream
	@chainstream=chainstream
	@logpath=logpath
	end

	def getChain
		return @chain
	end

	def getServerip	
		return @serverip
	end

	def getPort
		return @port
	end

	def getRpcport
		return @rpcport
	end

	def getUser
		return @user
	end

	def getPass
		return @pass
	end

	def getServerstream
		return @serverstream
	end

	def getChainstream
		return @chainstream
	end

	def getLogpath
		return @logpath
	end

end

