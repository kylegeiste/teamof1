module ApplicationHelper
	#This helper sets the title for each page -- if a title is
	#defined for the page, then it adds a |, otherwise it simply
	#displays InboundTeamof1
	
	def full_title(page_title)
		base_title = "InboundTeamof1"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	

end
