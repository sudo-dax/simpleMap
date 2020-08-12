require 'socket'
require 'timeout'
require 'tty-progressbar'
require 'tty-prompt'
require 'colorize'
require 'pastel'

pastel = Pastel.new
green  = pastel.on_green(" ")
red    = pastel.on_red(" ")


system("clear")
puts "Your current IP is:"
system("ip -o -4  address show  | awk ' NR==2 { gsub(/\\/.*/, \"\", $4); print $4 } '")
puts ""
puts "Enter Your Target"
puts "  or"
puts "Press [Enter] for Local-Host IP"
puts "IP Address: "

# Loopback Adapter acts as local IP, by pressing enter it means 
# We are selecting Lo (127.0.0.1) 
ip = gets.chomp || "localhost"
puts 'Scanning common ports...'.yellow

# Progress Bar
bar = TTY::ProgressBar.new("Scanning [:bar]", 
    total: 15, 
    total: 15,
    complete: green,
    incomplete: red
  )
15.times do
  sleep(0.1)
  bar.advance(1)
end


# Array for Port Range
port_range = [22, 53, 135, 137, 445, 631, 1042, 1043, 2869, 5040, 51330]
port_range.each do |port|
    begin
    socket = Timeout::timeout(3){TCPSocket.new(ip, port)}
    status = puts "Open: #{port}"
rescue
    Errno::ECONNREFUSED
    Errno::ETIMEDOUT
    status = puts "Closed: #{port}"
    end  
end
puts '[*] Scan Complete! :-)'
puts ""
puts ""
sleep(1)
# Selection Menu :: Gem Tty-Prompt
prompt = TTY::Prompt.new(symbols: {marker: '►'}, active_color: :cyan)

user_input = 
prompt.select("Select Option:".red.on_light_green) do |menu|
    menu.choice 'Back to Main Menu', 1
    menu.choice 'Quit', 2
  end

if user_input == 1
    system('clear')
    require './menu.rb'

elsif user_input == 2
    exit

elsif user_input == 3
else
    puts "invalid input"
end