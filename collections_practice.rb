require 'pry'

def begins_with_r(array)
  for string in array
    return false if string[0] != "r"
  end
  true
end

def contain_a(array)
  a_array = []
  for string in array
    string.split("").each do |letter|
      a_array.push(string) if letter == "a"
    end
  end
  a_array
end

def first_wa(array)
  for string in array
    return string if string[0..1] == "wa"
  end
end

def remove_non_strings(array)
  new_array = []
  array.each do |element|
    if element.is_a?(String)
      new_array.push(element)
    else array.delete(element)
    end
  end
  new_array
end

def count_elements(array)
  names = []
  return_array = []
  array.each do |dict|
    name = dict[:name]
    count = array.count(dict)
    if names.include?(name)
    else
      names.push(name)
      return_array.push({name: name, count: count})
    end
  end
  return_array
end

def merge_data(keys, data)
  merged_data = []
  keys.each do |keys_dict|
    merged_dict = {}
    keys_dict.each do |key, value|
      merged_dict[key] = value
      data.each do |value_dict|
        value_dict.each do |k, v|
          if k == value
            merged_dict[:awesomeness] = v[:awesomeness]
            merged_dict[:height] = v[:height]
            merged_dict[:last_name] = v[:last_name]
          end
        end
      end
    end
    merged_data << merged_dict
  end
  merged_data
end

def find_cool(array)
  return_array = []
  array.each do |hash|
    hash.each do |key, value|
      if value == "cool"
        return_array.push(hash)
      end
    end
  end
  return_array
end

def organize_schools(hash)
  locations = []
  hash.each do |key, value|
    if locations.include?(value[:location])
    else
      locations.push(value[:location])
    end
  end
  return_hash = {}
  locations.each do |location|
    schools = []
    hash.each do |k, v|
      schools.push(k) if v[:location] == location
    end
    return_hash[location] = schools
  end
  return_hash
end

hash = {
  "flatiron school bk" => {location: "NYC"},
  "flatiron school" => {location: "NYC"},
  "dev boot camp" => {location: "SF"},
  "dev boot camp chicago" => {location: "Chicago"},
  "general assembly" => {location: "NYC"},
  "Hack Reactor" => {location: "SF"}
}

puts organize_schools(hash)
