$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'
require 'pp'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input

def gross_for_director(director_data)
  director_earnings = 0
  movies_index = 0
  movies_length = director_data[:movies].length
  while movies_index < movies_length do
    director_earnings += director_data[:movies][movies_index][:worldwide_gross]
    movies_index += 1
  end
  director_earnings
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  result = {}
  director_index = 0
  while director_index < nds.length do
    director_data = nds[director_index]
    director_name = director_data[:name]
    result[director_name] = gross_for_director(director_data)
    director_index += 1
  end
  result
end
