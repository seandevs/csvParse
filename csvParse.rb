require 'csv'    

words = []

CSV.foreach(File.path(ARGV[0])) do |col|
    # Where col corresponds to a zero-based value/column in the csv
    # words << [col[0] + " " + col[1]]
    sport_name = col[0].to_s
    sport_name_match = ARGV[1].to_s

    if sport_name =~ /#{sport_name_match}/i
    	prewords = []
    	prewords << col[1].downcase.split.join(" ").split(/,/)
    	prewords.each do |pw|
    		words << pw
    	end
    end
end

b = Hash.new(0)

words.join(",").split(/,/).each do |w|
	b[w.lstrip.rstrip] += 1
end

b.sort_by {|_key, value| value}.each do |k, v|
	puts "#{k} :: #{v} "
end

# puts words.join(",")
