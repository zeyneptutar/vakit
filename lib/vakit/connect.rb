module Vakit
	
	class Connect
		
		def initialize(opt={})
			@path = opt[:path]
		end

		def self.shaber
			@doc ||= Nokogiri::HTML(open('http://www.samanyoluhaber.com/')) 
			x = @doc.css('#hnmzT')

			times = []
			x.each do |vakit|
				data = vakit.children.first.children.last.content
				data_add = data.slice(0..data.length-1)
				times.push(data_add)
			end
			vakit = {


				imsak: times[0],
				sabah: times[1],
				oglen: times[2],
				ikindi: times[3],
				aksam: times[4],
				yatsi: times[5]

			}

		end

	end
	

