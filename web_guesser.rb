require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(99)

def check_guess(guess)
  return "" if guess.nil?
  guess = guess.to_i
  dif = guess - SECRET_NUMBER
  return "OK" if dif == 0
  return "#{dif <  5 ? "Too" : "Extremely"} high" if dif > 0
  return "#{dif > -5 ? "Too" : "Extremely"} low" if dif < 0
end

get '/' do
  message = check_guess(params["guess"])
  number = 'XX'
  number = SECRET_NUMBER if message == 'OK'

  erb :index, :locals => { number: number, message: message }
end
