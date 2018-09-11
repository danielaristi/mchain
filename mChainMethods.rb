#!/bin/ruby

def methodPublishDataStreamKey()
#params=stream,key,dataexa,id,chainname
string='{"method":"publish","params":["?1","?2","?3"],"id":?4,"chain_name":"?5"}'
return string
end

def methodlistStreamKeyTransactions()
#params=stream,key,id,chainname
#string='{"method":"liststreamkeyitems","params":["?1","?2"],"id":?3,"chain_name":"?4"}'
string='{"method":"liststreamkeyitems","params":["?1","?2",false,1000000],"id":?3,"chain_name":"?4"}'
#cambio en stream aumenta el limite de items que va listar
return string
end

def methodGetDataTxidVout()
#params=txid, vout, id, chainname
string='{"method":"gettxoutdata","params":["?1",?2],"id":?3,"chain_name":"?4"}'
return string
end
