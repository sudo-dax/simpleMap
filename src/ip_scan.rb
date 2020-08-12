require 'colorize'
require 'tty-prompt'


# Import ipaddr class
require 'ipaddr'

# Get user config
puts "Your current IP is: "
#system ("ip -h addr | awk 'NR==9 {print $2}'")
system("ip -o -4  address show  | awk ' NR==2 { gsub(/\\/.*/, \"\", $4); print $4 } '")
puts "Enter your ip config [xxx.xxx.xxx]"
puts "(This is the first 3 sets of numbers in your Ip address)"
begin
    
    
    ip_config = gets.chomp 
    # Define Ip-Range and output to array
    ipadd_range = IPAddr.new("#{ip_config}" + ".0/24").to_range.to_a
rescue 
 puts "You done Goofed!".red.blink
 puts "Invalid Address config...".red.blink
 puts "~ Try Again ~".red.blink
 
 retry
end
    
    # Added so the full range isn't scanned - takes too long
# Comment out for full range
shortened_range = ipadd_range.keep_if { |element| ipadd_range.index(element) < 10 }

array = []
# Map Ip range and for each Ip address do a ping call
    shortened_range.map do |ip|     # Comment out for full Range
        #ipadd_range.map do |ip|    # Uncomment for full Range
        status = system("ping -q -c 1 -W 1  #{ip}")
        #Clear screen after ping
        system('clear')
        
        #If output contains string "true" then convert statuss to boolean == true
        if status.to_s.downcase.include? "true"
            status == true
        end 

        #if status is true, write Ip Address to file.txt
        if status == true
            puts "#{ip} found, writing to file..."
            array.push(ip)
        else
            puts "#{ip} Ip not Found..."
        end 
end
File.open('active_ips.txt','w') {|file| file.write(array.join("\n"))}  

require './display_1'

# Selection Menu :: Gem Tty-Prompt
prompt = TTY::Prompt.new(symbols: {marker: '►'})

user_input = 
prompt.select("Select Option:".colorize(:red).on_blue.underline) do |menu|
    menu.choice 'Back to Main Menu', 1
    menu.choice 'Quit', 2
  end

if user_input == 1
    require './menu.rb'
elsif user_input == 2
    system('clear')
    puts "Good Bye...".cyan.blink
    sleep(2)
    system('clear') 
    exit  
else
    puts "invalid input"
end