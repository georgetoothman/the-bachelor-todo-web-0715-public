require 'pry'

def get_first_name_of_season_winner(data, season)
  #iterate through the json file and check the status key
  #if the status value contains winner, print the name at that index
  # winner_names_and_status_array = []
  # data.each do |season_name_key, season_array_value|
  #   season_array_value.each do |episode_key|
  #     winner_names_and_status_array << episode_key["name"] + ", " + episode_key["status"]      
  #   end
  # end
  # winner_names_and_status_array
  winner_name = ""
  data[season].each do |contestant_hash|
    if contestant_hash["status"] == "Winner"
      winner_name = contestant_hash["name"].split(' ').first
    end
  end
  winner_name
end

def get_contestant_name(data, occupation)
  contestant_name = ""
  data.each do |season, contestant_hash|
    contestant_hash.each do |k, v|
      if k["occupation"] == occupation
        contestant_name = k["name"]
      end
    end
  end
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  # code here
  hometown_counter = 0
   data.each do |season, contestant_hash|
    contestant_hash.each do |k, v|
      if k["hometown"] == hometown
        hometown_counter += 1
      end
    end
  end
  hometown_counter
end

def get_occupation(data, hometown)
  occupation_name = []
  data.each do |season, contestant_hash|
    contestant_hash.each do |stats_hash|
      if stats_hash["hometown"] == hometown
        occupation_name << stats_hash["occupation"]
      end
    end
  end 
  occupation_name.shift
end

def get_average_age_for_season(data, season)
# the data hash and a string of a season. Iterate through 
# the hash and return the average of all of the contestants for that season. 
  age_array = []
  data.each do |season_key, contestant_hash|
    if season_key == season
      contestant_hash.each do |stats_hash|
        age_array << stats_hash["age"]
      end
    end
  end 
  age_avg = age_array.map(&:to_f).reduce(:+)/age_array.count
  age_avg.round
end
