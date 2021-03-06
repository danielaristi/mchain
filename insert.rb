#!/b/in/ruby

require 'yaml'
require 'file-tail'
load 'class.rb'
load 'mChainMethods.rb'
load 'lChainMethods.rb'

# configuracion de la cadena de datos (se debe agregar esta info luego al stream de chains)
config = YAML.load(File.read('logchain.conf'))
server=Server.new(config['chain'],config['user'],config['pass'],config['serverip'],config['port'])


def insert()
# se debe adaptar para modificacion dinamica de parametros
####hex=readFile('dmesg')

#hex=hex.unpack('U' * hex.length).collect { |x| x.to_s(16) }.join
p hex.unpack('H*')
hex=hex.unpack('H*').to_s.gsub("\"","").gsub("[","").gsub("]","")

dato=Dato.new("stream1","key34","id1",hex)

#data corresponde a la informacion para la insercion (stream, key, id, data)
insertDataStreamKey(server,dato)

end


def insertData(configHash,server) 

tumbral=60           #Tiempo en segundos para cambio de key en blockchain
refresh=1
logall=''




exit 0


file='/tmp/dart'
key=Time.now.strftime('%d%H').to_s
time1=Time.now
logData=''
p key
File.open(file) do |log|
	log.extend(File::Tail)
	log.interval # 10
	log.backward(3)
	log.tail do |line|
		print Time.new-time1
		p tumbral
		if (Time.new-time1)>=tumbral || logData.length > 500000
		logData=logData.unpack('H*').to_s.gsub("\"","").gsub("[","").gsub("]","")
		dato=Dato.new("stream1",key,"id1",logData)
		insertDataStreamKey(server,dato)
		key=Time.now.strftime('%d%H').to_s
		time1=Time.now
		p key
		logData=''
		end
		logData+=line
	end
end


end
