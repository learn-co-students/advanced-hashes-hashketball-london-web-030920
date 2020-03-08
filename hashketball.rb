require 'pry'

def game_hash
{ 
  :home =>{
    :team_name => "Brooklyn Nets",
    :colors =>["Black" , "White"],
    :players => [
      {
      :player_name => "Alan Anderson", 
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
       },
             {
      :player_name =>"Reggie Evans",
      :number =>30,
      :shoe =>14,
      :points =>12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
       },
             {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists =>10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
       },
             {
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
       },
             {
      :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
       }
    ]
  },
  :away => {
     :team_name => "Charlotte Hornets",
    :colors =>["Turquoise" , "Purple"],
    :players => [
      {
      :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7, 
      :slam_dunks => 2
       },
             {
      :player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
       },
             {
      :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4, 
      :blocks => 5,
      :slam_dunks => 5
       },
             {
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
       },
             {
      :player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
       }
    ]
  }
}
end  

def num_points_scored(players_name)
  game_hash.each do |team, players|
    players.each do |team_data, data|
      if team_data == :players
        data.each do |player_data |
          if player_data[:player_name] == players_name
            return player_data[:points]
           
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |team, players|
    players.each do |team_data, data|
      if team_data == :players
        data.each do |player_data |
          if player_data[:player_name] == players_name
            return player_data[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, players|
    if players[:team_name] == team_name
        return players[:colors]
    end
  end 
end

def team_names
  game_hash.map do |team, players|
  players[:team_name]
  end
end


def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, players|
    if players[:team_name] == team_name
      players.each do |player, data|
        if player == :players
          data.each do |player_data|
            numbers << player_data[:number]
          end
        end
      end
    end
  end
  numbers
end


def player_stats(players_name)
  player_hash = {}
  game_hash.each do |team, players|
      players.each do |player, data|
        if player == :players
          data.each do |player_data|
            if player_data[:player_name] == players_name
              player_hash = {
                :number => player_data[:number],
                :shoe =>  player_data[:shoe],
                :points =>  player_data[:points],
                :rebounds => player_data[:rebounds],
                :assists =>  player_data[:assists],
                :steals =>  player_data[:steals],
                :blocks =>  player_data[:blocks],
                :slam_dunks => player_data[:slam_dunks],
              }
            end
          end
      end
    end
  end
  player_hash
end



# def big_shoe_rebounds
#   game_hash.each do |team, players|
#     players.each do |player, data|
#         largest_shoe_size = data[0][:shoe]
#           data.each do |player_data| 
#             if player_data[:shoe] > largest_shoe_size
#               largest_shoe_size = player_data[:shoe]
#               binding.pry
#             end
#           end
#     end
#   end 
# end 

def big_shoe_rebounds
  largest_shoe_size = 0
  number_rebounds = 0
  
  game_hash.each do |place, team|
    team[:players].each do |player_data|
      if player_data[:shoe] > largest_shoe_size
        largest_shoe_size = player_data[:shoe]
        number_rebounds = player_data[:rebounds]
       end
    end
  end
  number_rebounds
end

def most_points_scored
  points_scored = 0 
  players_name = ""
  game_hash.each do |place, team|
    team[:players].each do |player_data|
       if player_data[:points] > points_scored
         points_scored = player_data[:points]
         players_name = player_data[:player_name]
       end
    end
  end
  players_name
end

def winning_team
  home_team = 0 
  away_team = 0 
  winning_team = ""
  
  game_hash.each do |place, team|
    if place == :home
      team[:players].each do |player_data|
        home_team += player_data[:points]
      end
      winning_team = team[:team_name]
    else
      team[:players].each do |player_data|
      away_team += player_data[:points]
        if away_team > home_team
          winning_team = team[:team_name]
        end
      end
    end            
  end
winning_team
end




def player_with_longest_name
longest_name = ""
  game_hash.each do |place, team|
    team[:players].each do |player_data|
     if player_data[:player_name].length > longest_name.length
       longest_name = player_data[:player_name]
     end
    end
  end
  longest_name
end



def long_name_steals_a_ton?
    points_stolen = 0 
  players_name = ""
  game_hash.each do |place, team|
    team[:players].each do |player_data|
       if player_data[:steals] > points_stolen
         points_stolen = player_data[:steals]
         players_name = player_data[:player_name]
       end
    end
  end
  players_name == player_with_longest_name
end




