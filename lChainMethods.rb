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

def readFile(pathlog)
	file=''
	File.foreach(pathlog) do |line|
		file.concat(line)
	end
	return file
end


