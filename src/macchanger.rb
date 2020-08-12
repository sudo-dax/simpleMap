require 'tty-prompt'
require 'colorize'
#Module to get MAC
def get_mac_addr
 dmac = system ("ip addr | awk '/ether/{ print $2 }'")
end

#Display current MAC
puts 'Your current MAC Address is: ' 
get_mac_addr()
puts ""
puts ""

# Selection Menu :: Gem Tty-Prompt
prompt = TTY::Prompt.new(symbols: {marker: '►'})

user_input = 
prompt.select("Select Option:".colorize(:red).on_blue.underline) do |menu|
    menu.choice 'Change MAC Address', 1
    menu.choice 'Back to Main Menu', 2
    menu.choice 'Quit', 3
  end

if user_input == 1
    system('clear')
   # Enter Network Adapter
  puts "Available Adapters:" 
  system("ip addr | awk '/: /{ print $1,$2 }' | sed 's/:/ /2' | cut -c 3-")
  puts ""
  puts "Enter your Network Interface: (eg. eth0 || wlan0 || enp0s3)"
  $interf = gets.chomp
  
  # Display current MAC
  puts 'Your current MAC Address is: ' 
  get_mac_addr()
  puts ""
  puts 'Enter new MAC [xx:xx:xx:xx:xx:xx]'
  puts ""
  $mac = gets.chomp

  # Changing MAC Address
  puts ""
  puts 'Ethernet down...'
  system('sudo systemctl stop NetworkManager.service')
  puts 'Changhing MAC'  
  system('sudo ip link set dev ' + $interf + ' address ' + $mac)
  puts 'Network Starting...'  
  system('sudo systemctl start NetworkManager.service')
  puts 'Done!' 
  puts 'Your new MAC Address is: ' 
  get_mac_addr()
  sleep(3)
  require './menu.rb'


elsif user_input == 2
  require './menu.rb'

elsif user_input == 3
  exit
  
else
    puts "invalid input"

end