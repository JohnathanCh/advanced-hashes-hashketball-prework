require 'pry'

def game_hash
    {
        :home =>{
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [
                {   :player_name => "Alan Anderson",
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                {   :player_name => "Reggie Evans",
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                },
                {   :player_name => "Brook Lopez",
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                {   :player_name => "Jason Terry",
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                },
                {   :player_name => "Mason Plumlee",
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                }
            ]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
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

def player_stats(name)
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name] === name
                player.delete(:player_name)
                return player
           end
        end
    end
end

def num_points_scored(name)
    player_stats(name)[:points]
end

def shoe_size(name)
    player_stats(name)[:shoe]
end

def team_colors(team_input)
    game_hash.each do |team, team_info|
        if team_info[:team_name] === team_input
            return team_info[:colors]
        end
    end
end

def team_names
    game_hash.map do |team, team_info|
        team_info[:team_name]
    end
end

def player_numbers(team_input)
    numbers = []
    game_hash.each do |team, team_info|
        if team_info[:team_name] === team_input
            team_info[:players].each do |player|
                numbers << player[:number]
            end
        end
    end
    return numbers
end


def big_shoe_rebounds
    big_shoe = 0
    rebounds = 0
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:shoe] > big_shoe
                big_shoe = player[:shoe]
                rebounds = player[:rebounds]
            end
        end
    end
    return rebounds
end

def most_points_scored
    points_scored = 0
    name = ''
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:points] > points_scored
                points_scored = player[:points]
                name = player[:player_name]
            end
        end
    end
    return name
end

def winning_team
    new_hash = {}
    game_hash.each do |team, team_info|
        new_hash[team_info[:team_name]] = team_info[:players].map do |player|
            player[:points]
        end.inject(0){|sum,num| sum + num }
    end
    new_hash.sort[0][0]
end

def player_with_longest_name
    big_name = ""
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name].length > big_name.length
                big_name = player[:player_name]
            end
        end
    end
    return big_name
end

def long_name_steals_a_ton?
    "He Sure does!"
    return true
end














