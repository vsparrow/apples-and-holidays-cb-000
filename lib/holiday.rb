require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supplies = holiday_hash[:winter].values
  supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |key, value|
    puts "#{key.to_s.capitalize}:"
    value.each do |key2, value2|
      inner_values = ""

        value2.each_with_index do | subvalue,index|
          inner_values << " #{subvalue}"
          if index+1 < value2.length
            inner_values << ","
          end #if index+1
        end #value2.each
      # puts "#{value2.values}"
      # puts inner_values
      key2_split = key2.to_s.gsub('_', ' ').split(" ")
      key2_split_cap= key2_split.each do |word|
        word.capitalize!

      end#key2_split collect
      key2_split_cap= key2_split_cap.join(" ")
      # puts "key2_split is -> #{key2_split} || test is -> #{key2_split_cap}"
      # puts "  #{key2.to_s.gsub('_', ' ').split(" ")}:#{inner_values}"
      puts "  #{key2_split_cap}:#{inner_values}"
      # subline = "  #{key2.to_s.capitalize.gsub('_', ' ')}:#{inner_values}"
      # puts subline
      # puts "  #{key2.to_s.capitalize}:#{inner_values}"
    end #value.each
    # puts "  #{value}: #{value.values.flatten.inspect}"
    # puts "#{value.keys.to_s.split("").slice!(2,-100)}"
    # puts value.keys.to_s
    # puts key.dig
  end #each
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
    # puts holiday_hash.dig( :winter)
  holidays_with_bbqs = []
  holiday_hash.each do |season,holiday_sub_hash|
    # puts holiday_sub_hash
    holiday_sub_hash.each do |holiday, supply|
      puts "#{holiday},#{supply}"
      if supply.include?("BBQ")
        holidays_with_bbqs.push(holiday)
      end
    end #holiday_sub_hash
  end #holiday_hash.each
  puts "holidays_with_bbqs =>  #{holidays_with_bbqs}"
  holidays_with_bbqs
end




holiday_hash =   {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
 }

all_holidays_with_bbq(holiday_hash)
 # all_supplies_in_holidays(holiday_hash)
#
