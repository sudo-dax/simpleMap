#!/usr/bin/ruby

require 'tty-prompt'
require 'colorize'
flash = 0
while flash < 2 do
system('clear')
puts ""
puts ".d8888. d888888b .88b  d88. d8888b. db      d88888b   .88b  d88.  .d8b.  d8888b.".cyan.blink
puts "88'  YP   `88'   88'YbdP`88 88  `8D 88      88'       88'YbdP`88 d8' `8b 88  `8D".cyan.blink
puts "`8bo.      88    88  88  88 88oodD' 88      88ooooo   88  88  88 88ooo88 88oodD'".cyan.blink
puts "  `Y8b.    88    88  88  88 88~~~   88      88~~~~~   88  88  88 88~~~88 88~~~  ".cyan.blink
puts "db   8D   .88.   88  88  88 88      88booo. 88.       88  88  88 88   88 88     ".cyan.blink
puts "`8888Y' Y888888P YP  YP  YP 88      Y88888P Y88888P   YP  YP  YP YP   YP 88     ".cyan.blink
puts ""
                           
sleep(1)
system('clear')

puts ""
puts ".d8888. d888888b .88b  d88. d8888b. db      d88888b   .88b  d88.  .d8b.  d8888b.".blue.on_red
puts "88'  YP   `88'   88'YbdP`88 88  `8D 88      88'       88'YbdP`88 d8' `8b 88  `8D".blue.on_red
puts "`8bo.      88    88  88  88 88oodD' 88      88ooooo   88  88  88 88ooo88 88oodD'".blue.on_red
puts "  `Y8b.    88    88  88  88 88~~~   88      88~~~~~   88  88  88 88~~~88 88~~~  ".blue.on_red
puts "db   8D   .88.   88  88  88 88      88booo. 88.       88  88  88 88   88 88     ".blue.on_red
puts "`8888Y' Y888888P YP  YP  YP 88      Y88888P Y88888P   YP  YP  YP YP   YP 88     ".blue.on_red
puts ""

flash += 1
sleep(1)
system('clear')
end


# Selection Menu :: Gem Tty-Prompt
prompt = TTY::Prompt.new(symbols: {marker: '►'})
puts "#--Welcome to Simple Map--#".red.on_cyan
puts "   ---------------------   ".red.on_light_green
puts " Please make your selection".yellow.on_green
puts "  ▲ up & ▼ down Arrow Keys ".yellow.on_green
puts "      & Press [Enter]      ".yellow.on_green
puts "   ---------------------   ".red.on_light_green
# Welcome Menu

user_input = 
prompt.select("  Main Menu:               ".red.on_light_green) do |menu|
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