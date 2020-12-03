data = File.readlines('input_day3.txt')

line_length = data[0].delete("\n").length

i = 0
tree_count = 0

data.each do |d|
  tree_count += 1 if d[i % line_length] == '#'
  i = i + 3
end

puts "# tree count: #{tree_count}"
