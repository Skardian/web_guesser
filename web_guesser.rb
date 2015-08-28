require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(99)
OK_MSG = "OK, generating new number"

def check_guess(guess)
  return "" if guess.nil?
  guess = guess.to_i
  dif = guess - SECRET_NUMBER
  return OK_MSG if dif == 0
  return "#{dif <  5 ? "too" : "extremely"} high" if dif > 0
  return "#{dif > -5 ? "too" : "extremely"} low" if dif < 0
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  number = 'XX'
  number = SECRET_NUMBER if message == OK_MSG
  SECRET_NUMBER = rand(99) if message == OK_MSG

  erb :index, :locals => { number: number, message: message, guess: guess }
end
