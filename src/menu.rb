require 'colorize'
require 'tty-prompt'
# Selection Menu :: Gem Tty-Prompt
prompt = TTY::Prompt.new(symbols: {marker: '►'})

user_input = 
prompt.select("Main Menu:".red.on_light_green) do |menu|
    menu.choice 'Ip Scanner', 1
    menu.choice 'Port Scanner', 2
    menu.choice 'MAC Changer', 3
    menu.choice 'Quit', 4
  end

if user_input == 1
    system('clear')
    require './ip_scan'

elsif user_input == 2
    require './port_scanner'

elsif user_input == 3
    require './macchanger'

elsif user_input == 4
    system('clear')
    puts "Good Bye...".cyan.blink
    sleep(2)
    system('clear') 
    exit

else
    puts "invalid input"

end