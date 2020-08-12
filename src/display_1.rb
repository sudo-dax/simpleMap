# This file displays the output from the IP Scanner 
# It generates a table of active IPs
require 'terminal-table'
$i = 0
#Adding rows one by one:
table = Terminal::Table.new do |t|
  t << ['Num#', 'IP Address']
  t << :separator
  t.add_row [0, '10.0.2.0']
    file = "./active_ips.txt"
    File.readlines(file).each do |line|
        # t.add_separator
     t.add_row [$i+=1, line]
    end
end
    
puts table