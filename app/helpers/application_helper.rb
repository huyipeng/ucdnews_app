module ApplicationHelper

	def full_title(page_title)
		base_title = "UCDNews"
		if page_title.empty?
			base_title = 'UCDNews - 汇集分享优秀的UCD文章'
		else
			"#{page_title} - #{base_title}"
		end
	end
	
end
