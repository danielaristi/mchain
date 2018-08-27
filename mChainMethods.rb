#!/bin/ruby

=begin
def methodPublishDataStreamKey()
string='{
  "method" => "publish",
  "params" => [
    "?1",
    "?2",
    "?3"
  ],
  "id" => 1,
  "chain_name" => "?3"
}'

print string.to_json.strip

exit 0

return string.strip
end
=end



def methodPublishDataStreamKey()
#string='{"method" => "publish","params" => ["?1","?2","?3"],"id" => ?4,"chain_name" => "?5"}'
string='{"method":"publish","params":["?1","?2","?3"],"id":?4,"chain_name":"?5"}'
return string
end

