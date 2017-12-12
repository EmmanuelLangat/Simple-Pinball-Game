require 'colorize'

def red;         "\e[41m#{self}\e[0m" end
def green;       "\e[42m#{self}\e[0m" end
def yellow;       "\e[43m#{self}\e[0m" end
def blue;        "\e[44m#{self}\e[0m" end
def magenta;     "\e[45m#{self}\e[0m" end
def cyan;        "\e[46m#{self}\e[0m" end

# Draws board and cals the floodit function
def get_board(width, height)

  #Creates the game board and fills it with colors
   gameboard = Array.new(height){ Array.new(width){
		rand = rand(1..6)
		
			case rand
		when 1
		:red
		when 2 
		:green
		when 3
		:yellow
		when 4
		:blue
		when 5 
		:magenta
		when 6
		:cyan
		end
      }
     }
  
  #Prints the game board and fills it with colors
    (0..height-1).each do|i|
      (0..width-1).each do|j|
        print "  ".colorize( :background => gameboard[i][j])
end
      puts""
end
  #Calls out the floodit function
  floodit(0,width,height, gameboard, 0)
end

# Asks for user input and passes it to the game controls function
def floodit(noOfGames,width,height, gameboard, percentage)
  
  #Refers to the first cell
  first = gameboard[0][0]
  #Intialises a variable calles 0
  number = 0
  total = (width*height)
  
  #Checks for the number of cells wwith the same value as the first cell
  (0..height-1).each do|i|
      (0..width-1).each do|j|
        if(gameboard[i][j] == first) then
          number =number+1
        end
end
end
    percentage = (number*100)/total
    
  if(percentage == 100) then
    puts"You won after #{noOfGames} games"
  end
    
    #Dispplays the menu values
   puts "Number of turns: #{noOfGames}"
   puts "Current completion: #{percentage}%"
   print"Choose a colour: "
  input = gets.chomp.downcase
  
  
  
  noOfGames +=1
  gameControls(noOfGames,0 ,0 ,width,height, gameboard, input,first)
  
  floodit(noOfGames,width,height, gameboard, 0 )
 
end
       
#Displays th e game controls
def gameControls(noOfGames,a ,b ,width,height, gameboard , input,first)
 
  case input
    when "r"
    gameboard[a][b] = :red
    when "y"
    gameboard[a][b] = :yellow
    when "b"
    gameboard[a][b] = :blue
    when "c"
    gameboard[a][b] = :cyan
    when "m"
    gameboard[a][b] = :magenta
    when "g"
    gameboard[a][b] = :green
    when "m"
    gameboard[a][b] = :magenta
    when "q"
    system ('clear')
    menu(width,height, noOfGames)
    else
    puts"Invalid"
    return
  end
  system ('clear')
  (0..height-1).each do|i|
      (0..width-1).each do|j|
        print "  ".colorize( :background => gameboard[i][j])
end
      puts""
end

#Describes the appropriate methods to call in all game situations.
  if (((a+1) < height) && ((b+1) < width ) && ((a) > -1) && ((b) >-1)) then
    if((first == input) || (gameboard[a+1][b] != first) && (gameboard[a][b+1] != first) && (gameboard[a-1][b] != first)) then
      return
    elsif ((gameboard[a+1][b] == first) && (gameboard[a][b+1] != first)) then 
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
    elsif ((gameboard[a+1][b] != first) && (gameboard[a][b+1] == first)) then 
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
    elsif ((gameboard[a+1][b] == first) && (gameboard[a][b+1] == first)) then
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
    elsif ((gameboard[a-1][b] == first) && (gameboard[a][b-1] != first)) then 
      gameControls(noOfGames,a-1 ,b ,width,height, gameboard , input,first)
    elsif ((gameboard[a-1][b] != first) && (gameboard[a][b-1] == first)) then 
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
    elsif ((gameboard[a-1][b] == first) && (gameboard[a][b-1] == first)) then
      gameControls(noOfGames,a-1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
    elsif ((gameboard[a-1][b] == first) && (gameboard[a][b+1] == first)) then
      gameControls(noOfGames,a-1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
    elsif ((gameboard[a+1][b] == first) && (gameboard[a][b-1] == first)) then
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
    elsif ((gameboard[a][b+1] == first) && (gameboard[a][b-1] == first)) then
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
    elsif ((gameboard[a+1][b] == first) && (gameboard[a-1][b] == first)) then
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a-1 ,b ,width,height, gameboard , input,first)
    elsif((gameboard[a+1][b] == first) && (gameboard[a-1][b] == first) && (gameboard[a][b-1] == first)) then
      gameControls(noOfGames,a-1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
      elsif((gameboard[a+1][b] == first) && (gameboard[a-1][b] == first) && (gameboard[a][b+1] == first)) then
      gameControls(noOfGames,a-1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
      elsif((gameboard[a][b-1] == first) && (gameboard[a][b+1] == first) && (gameboard[a+1][b] == first)) then
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
      elsif((gameboard[a][b-1] == first) && (gameboard[a][b+1] == first) && (gameboard[a-1][b] == first)) then
      gameControls(noOfGames,a+1 ,b ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b+1 ,width,height, gameboard , input,first)
      gameControls(noOfGames,a ,b-1 ,width,height, gameboard , input,first)
  end
      return
  end
end

#Creates the menu.
def menu(width,height, z)
  system ('clear')
  
  
    puts "Main menu:"
  puts "s = Start game"
  puts "c = Change size"
  puts "q = Quit"
  
if(z == 0) then
  puts"No games played yet"
  else
  puts"Best game : #{z} turns"
end
 print "Please enter your choice: "
  
  menuInput = gets
  menuInput = menuInput.chomp.upcase

  #Defines menu functions and actions to take when button to is pressed.
if (menuInput == "S") then
  system ('clear')
  get_board(width,height)
  
  elsif (menuInput == "C") then
    system ('clear')
    print "width (currently #{width})?" 
    width = gets
    width = width.to_i
    print "height (currently #{height})?" 
    height = gets
    height = height.to_i
    system ('clear')
    menu(width,height, z)
    elsif (menuInput == "Q") then
      exit
      else
      puts"Invalid choice"
      system ('clear')
      menu(width,height, z)
end
    
end


width = 14
height = 9

  #Creates the splash screen
require 'console_splash'
splash = ConsoleSplash.new(35, 88)
splash.write_header("Welcome to Flood-It","Neville Kitala", "Version 1.0")
splash.write_center(-5, "<Press enter to contiue>")
splash.write_top_pattern("-*")
splash.write_bottom_pattern("-*")
splash.write_left_pattern("|")
splash.write_right_pattern("|")
system ('clear')
  
splash.splash
sleep(3)
gets()

  #Calls the menu function after the splash screen
menu(width,height, 0)