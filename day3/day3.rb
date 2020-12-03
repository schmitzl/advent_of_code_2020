data = File.readlines('input_day3.txt')
line_length = data[0].delete("\n").length

slopes = {
  slope_r_1_d_1: { r: 1, d: 1, tree_count: 0 },
  slope_r_3_d_1: { r: 3, d: 1, tree_count: 0 },
  slope_r_5_d_1: { r: 5, d: 1, tree_count: 0 },
  slope_r_7_d_1: { r: 7, d: 1, tree_count: 0 },
  slope_r_1_d_2: { r: 1, d: 2, tree_count: 0 },
}

data.each_with_index do |d, index|
  slopes.each do |key, value|
    next if index % value[:d] > 0
    r = value[:r] * (index / value[:d])
    value[:tree_count] = value[:tree_count] + 1 if d[r % line_length] == '#'
  end
end

puts "# tree count"
puts slopes

tree_product = slopes.values.map{|v| v[:tree_count]}.reduce(:*)
puts "# tree product: #{tree_product}"
